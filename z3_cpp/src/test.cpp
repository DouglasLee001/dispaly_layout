#include "independent_c_names.hpp"
#include <iostream>
#include <sstream>
#include <map>
#include <vector>
#include <time.h>
#include "./sls_solver/nia_ls.h"
#include "./sls_solver_overall/nia_ls.h"
#include <emscripten/bind.h>
#define DEBUG

std::vector<int> soft_c_info;
std::vector<nia::ls_solver *> sls_solvers;
nia_overall::ls_solver *overall_solver;
std::vector<double> x_pos, y_pos, widths, hights;
std::vector<int> visibles;
std::vector<std::string> names;

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
    overall_solver->set_components(x_pos, y_pos, widths, hights, visibles, names);
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
void test_solve_cpp(int width, bool is_print = false)
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
    overall_solver->build_instance_new_width(width);
    if (overall_solver->local_search())
    {
        if (is_print)
            overall_solver->print_components(x_pos, y_pos, widths, hights, visibles);
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

std::vector<double> return_x_pos()
{
    return x_pos;
}

std::vector<double> return_y_pos()
{
    return y_pos;
}

std::vector<double> return_widths()
{
    return widths;
}

std::vector<double> return_hights()
{
    return hights;
}

std::vector<int> return_visibiles()
{
    return visibles;
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

EMSCRIPTEN_BINDINGS(my_module)
{
    emscripten::register_vector<double>("vector<double>");
    emscripten::register_vector<int>("vector<int>");
    emscripten::function("test_solve_cpp", &test_solve_cpp);
    emscripten::function("return_x_pos", &return_x_pos);
    emscripten::function("return_y_pos", &return_y_pos);
    emscripten::function("return_widths", &return_widths);
    emscripten::function("return_hights", &return_hights);
    emscripten::function("return_visibiles", &return_visibiles);
}