#include "independent_c_names.hpp"
#include <iostream>
#include <sstream>
#include <map>
#include <vector>
#include <time.h>
#include "../../solver_src/sls_solver/nia_ls.h"
#include "../../solver_src/sls_solver_overall/nia_ls.h"
#include <emscripten/bind.h>
#define DEBUG

std::vector<int> soft_c_info;
std::vector<nia::ls_solver *> sls_solvers;
nia_overall::ls_solver *overall_solver;
struct Component
{
    double x;
    double y;
    double w;
    double h;
    int v;
};
std::vector<std::string> c_names;
std::vector<Component> components;

void add_sls_solvers_independent()
{
    for (const auto &soft_c_name : soft_c_names)
    {
        nia::ls_solver *m_ls = new nia::ls_solver(0, 10000, 5, true);
        std::string s = "../sls_smtlib/" + soft_c_name + "_soft.smt2";
        m_ls->read_from_file(s);
        sls_solvers.emplace_back(m_ls);
    }
}

void add_sls_solvers_overall()
{
    overall_solver = new nia_overall::ls_solver(0, 10000, 5, true);
    overall_solver->read_from_file("/sls_smtlib/hard.smt2", soft_c_names);
    components.resize(overall_solver->component_names.size());
    c_names = overall_solver->component_names;
}

bool sls_solve_component(nia::ls_solver *sls_solver, int w, int h, int x, int y, bool is_print = false)
{
    if (sls_solver->update_width_hight(w, h) && sls_solver->local_search())
    {
        if (is_print)
            sls_solver->print_components(x, y);
        return true;
    }
    return false;
}

bool refine_by_sls_solver(bool is_print = false)
{
#ifdef DEBUG
    clock_t sls_start = clock();
#endif
    for (unsigned idx = 0; idx < soft_c_names.size(); idx++)
    {
        if (soft_c_info[5 * idx + 4] > 0)
        {
            int w = soft_c_info[5 * idx];
            int h = soft_c_info[5 * idx + 1];
            int x = soft_c_info[5 * idx + 2];
            int y = soft_c_info[5 * idx + 3];
            if (!sls_solve_component(sls_solvers[idx], w, h, x, y, is_print))
                return false;
        }
    }
#ifdef DEBUG
    std::cout << "sls time:" << clock() - sls_start << "\n";
#endif
    return true;
}

bool width_in_interval(int width, int idx)
{
    return (idx >= 0 && idx < soft_constraints.size()) && ((width < right_bound[idx] && width > right_bound[idx + 1]) ||
                                                           (width == right_bound[idx] && !belong_to_right[idx]) ||
                                                           (width == right_bound[idx + 1] && belong_to_right[idx + 1]));
}

int find_width_interval(int width)
{
    static int idx = 0;
    if (width_in_interval(width, idx))
        return idx;
    if (width_in_interval(width, idx - 1))
        return --idx;
    if (width_in_interval(width, idx + 1))
        return ++idx;
    for (idx = 0; idx < right_bound.size(); idx++)
        if (width_in_interval(width, idx))
            return idx;
    return -1; //-1 means the width is not feasible
}

void print_end()
{
    std::cout << R"(];
rectangles.forEach(function (rect) {
    var div = document.createElement('div');
    div.className = 'rectangle';
    div.style.width = rect.width + 'px';
    div.style.height = rect.height + 'px';
    div.style.left = rect.x + 'px';
    div.style.top = rect.y + 'px';
    div.style.display = rect.display;
    document.body.appendChild(div);
    var textDiv = document.createElement("div");
    textDiv.className = "text";
    textDiv.textContent = rect.name;
    div.appendChild(textDiv);
    document.body.appendChild(div);
});)";
    std::cout << std::endl;
}

int total_check = 0;
clock_t total_time = 0;

void print_overall_component(int offset_x = 0, int offset_y = 0)
{
    for (int c_idx = 0; c_idx < overall_solver->component_names.size(); c_idx++)
    {
        Component &c = components[c_idx];
        overall_solver->print_component(c.x, c.y, c.w, c.h, c.v, c_idx);
    }
}
void test_solve_cpp(int width, int hight, bool is_print = false)
{
#ifdef DEBUG
    clock_t start_t = clock();
#endif
    static int previous_interval_idx = -1;
    int curr_interval_idx = find_width_interval(width);
    if (curr_interval_idx == -1)
    {
        std::cout << "out of bound\n";
        return;
    }
    if (previous_interval_idx != curr_interval_idx)
    {
        previous_interval_idx = curr_interval_idx;
        overall_solver->build_instance_original(soft_constraints[curr_interval_idx]);
    }
    overall_solver->build_instance_new_width(width, hight);
    if (overall_solver->local_search())
    {
        if (is_print)
            print_overall_component();
        else
            std::cout << "sat\n";
            // overall_solver->record_soft_var_solution(soft_c_info);
            // refine_by_sls_solver(is_print);
#ifdef DEBUG
#endif
    }
    else
        std::cout << "unsat" << std::endl;
}

int main()
{
    add_sls_solvers_independent();
    add_sls_solvers_overall();
    // clock_t start = clock();
    // for (int width = 400; width < 2400; width++)
    //     test_solve_cpp(width);
    // total_time = clock() - start;
    // std::cout << total_time << std::endl;
    // test_solve_cpp(400, true);
    // test_solve_cpp(600, true);
    // test_solve_cpp(800, true);
    // test_solve_cpp(1000, true);
    // test_solve_cpp(1200, true);
    // test_solve_cpp(1400, true);
    // test_solve_cpp(1600, true);
    // test_solve_cpp(1800, true);
    // #ifdef DEBUG
    //     std::cout << total_time << std::endl;
    //     std::cout << total_time / total_check << std::endl;
    // #endif
    return 0;
}

std::vector<Component> getComponents(int width, int hight)
{
    test_solve_cpp(width, hight, true);
    return components;
}

std::vector<std::string> getInitialComponents()
{
    return c_names;
}

EMSCRIPTEN_BINDINGS(my_module)
{
    emscripten::value_object<Component>("Component")
        .field("x", &Component::x)
        .field("y", &Component::y)
        .field("w", &Component::w)
        .field("h", &Component::h)
        .field("v", &Component::v);
    emscripten::register_vector<std::string>("vector<string>");
    emscripten::register_vector<Component>("vector<Component>");
    emscripten::function("getComponents", &getComponents);
    emscripten::function("getInitialComponents", &getInitialComponents);
}