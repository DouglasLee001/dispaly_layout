#include "nia_ls.h"
#include "../utils/matrix.h"
#define NLS_DEBUG
namespace nia
{
    // input transformation
    void ls_solver::split_string(std::string &in_string, std::vector<std::string> &str_vec, std::string pattern = " ")
    {
        std::string::size_type pos;
        in_string += pattern;
        size_t size = in_string.size();
        for (size_t i = 0; i < size; i++)
        {
            pos = in_string.find(pattern, i);
            if (pos < size)
            {
                std::string s = in_string.substr(i, pos - i);
                str_vec.push_back(s);
                i = pos + pattern.size() - 1;
            }
        }
    }

    bool is_same_cls(const std::vector<int> &cl_1, const std::vector<int> &cl_2)
    {
        if (cl_1.size() != cl_2.size())
        {
            return false;
        }
        else
        {
            for (int l_idx = 0; l_idx < cl_1.size(); l_idx++)
            {
                if (cl_1[l_idx] != cl_2[l_idx])
                {
                    return false;
                }
            }
        }
        return true;
    }

    void ls_solver::read_from_file(const std::string &file_name)
    {
        std::string in_string;
        uint64_t num_lits;
        FILE *fp = freopen(file_name.c_str(), "r", stdin);
        if (fp == NULL)
        {
            perror("fopen failed");
            exit(EXIT_FAILURE);
        }
        std::cin >> num_lits;
        make_lits_space(num_lits);
        getline(std::cin, in_string);
        getline(std::cin, in_string);
        while (in_string != "0")
        {
            build_lits(in_string);
            getline(std::cin, in_string);
        }
        int size;
        std::cin >> size;
        std::vector<std::vector<int>> vec;
        vec.resize(size);
        int size_now = 0;
        while (size_now < size)
        {
            std::cin >> in_string;
            if (in_string == "(")
                continue;
            else if (in_string == ")")
                size_now++;
            else
                vec[size_now].push_back(atoi(in_string.c_str()));
        }
        std::string name = file_name;
        size_t lastSlashPos = name.rfind('/');
        size_t lastUnderscorePos = name.rfind('_');
        name = name.substr(lastSlashPos + 1, lastUnderscorePos - lastSlashPos - 1);
        basic_component_name = name;
        build_instance(vec);
        construct_solution();
        // print_formula();
    }

    void ls_solver::build_lits(std::string &in_string)
    {
        std::vector<std::string> vec;
        split_string(in_string, vec);
        if (vec[0] == "0")
        {
            _lits[0].lits_index = 0;
            return;
        } // true literal
        int lit_index = std::atoi(vec[0].c_str());
        lit *l = &(_lits[lit_index]);
        if (vec[1] == "or" || vec[1] == "if")
        {
            l->delta = (int)transfer_name_to_resolution_var(vec[2], false);
            l->key = 1;
            l->is_nia_lit = false;
            l->lits_index = lit_index;
            return;
        } // or lit in the form: 1 or newvar_2
        if (vec.size() > 2)
        {
            l->is_nia_lit = true;
            if (vec.size() > 6)
            {
                l->lits_index = std::atoi(vec[0].c_str());
                int idx = 5;
                if (vec[2] == "=" && vec[3] != "(")
                {
                    idx++;
                    l->key = -std::atoll(vec[3].c_str());
                }
                l->is_equal = (vec[2] == "=");
                for (; idx < vec.size(); idx++)
                {
                    if (vec[idx] == ")")
                    {
                        break;
                    }
                    if (vec[idx] == "(")
                    {
                        idx += 2;
                        int coff = std::atoi(vec[idx].c_str());
                        uint64_t v_idx = transfer_name_to_tmp_var(vec[++idx]); //( * 115 x ) idx at x
                        l->coff_vars.push_back(coff_var((int)v_idx, coff));
                        idx++;
                    }
                    else
                    {
                        uint64_t v_idx = transfer_name_to_tmp_var(vec[idx]);
                        l->coff_vars.push_back(coff_var((int)v_idx, 1));
                    }
                    _num_opt += l->coff_vars.size();
                }
                if (vec[2] != "=" || vec[3] == "(")
                {
                    l->key = -std::atoi(vec[++idx].c_str());
                }
                if (vec[2] == ">=")
                {
                    l->key += ration_num(1);
                    invert_lit(*l);
                }
            } //( <= ( + x1 ( * -1 x2 ) x7 ( * -1 x8 ) ) 0 )
            else
            {
                l->lits_index = std::atoi(vec[0].c_str());
                if (vec[2] == "=" && vec.size() == 6 && (vec[3][0] < '0' || vec[3][0] > '9') && (vec[4][0] < '0' || vec[4][0] > '9') && (vec[3][0] != '-') && (vec[4][0] != '-'))
                {
                    l->is_equal = true;
                    l->key = 0;
                    uint64_t new_v_idx_1 = transfer_name_to_tmp_var(vec[3]);
                    uint64_t new_v_idx_2 = transfer_name_to_tmp_var(vec[4]);
                    l->coff_vars.push_back(coff_var((int)new_v_idx_1, 1));
                    l->coff_vars.push_back(coff_var((int)new_v_idx_2, -1));
                } //( = x1 x2 )
                else
                {
                    int bound;
                    uint64_t var_idx;
                    if ((vec[3][0] < '0' || vec[3][0] > '9') && (vec[3][0] != '-'))
                    {
                        bound = std::atoi(vec[4].c_str());
                        var_idx = transfer_name_to_tmp_var(vec[3]);
                    } //( >= x 0 )
                    else
                    {
                        bound = std::atoi(vec[3].c_str());
                        var_idx = transfer_name_to_tmp_var(vec[4]);
                    } //( = 0 x )
                    if (vec[2] == ">=")
                    {
                        l->key = bound;
                        l->coff_vars.push_back(coff_var((int)var_idx, -1));
                    }
                    else
                    {
                        l->key = -bound;
                        l->coff_vars.push_back(coff_var((int)var_idx, 1));
                    }
                    l->is_equal = (vec[2] == "=");
                } //( >= x 0 )
            }

        } // nia lit
        else
        {
            l->delta = (int)transfer_name_to_resolution_var(vec[1], false);
            l->key = 1;
            l->is_nia_lit = false;
            l->lits_index = lit_index;
        } // boolean lit
    }

    int ls_solver::find(int var_idx)
    {
        if (var_idx == fa[var_idx])
        {
            fa_coff[var_idx] = 1;
            fa_const[var_idx] = 0;
            return var_idx;
        }
        else
        {
            int old_fa = fa[var_idx]; // var = old_fa * fa_coff[var] + fa_const[var] -> (new_fa*fa_coff[old_fa]+fa_const[old_fa]) * fa_coff[var] + fa_const[var]
            int new_fa = find(fa[var_idx]);
            fa_const[var_idx] += fa_coff[var_idx] * fa_const[old_fa];
            fa_coff[var_idx] *= fa_coff[old_fa];
            return fa[var_idx] = new_fa;
        }
    }

    // return true if the fa_coff and fa_const have been modified
    bool ls_solver::merge(lit &l)
    { // coff_1*var_1==coff_2*var_2
        int var_idx_1 = l.coff_vars[0].var_idx;
        int var_idx_2 = l.coff_vars[1].var_idx;
        int fa_1 = find(var_idx_1), fa_2 = find(var_idx_2);
        ration_num const_1 = l.coff_vars[0].coff * fa_const[var_idx_1], const_2 = l.coff_vars[1].coff * fa_const[var_idx_2];
        ration_num fa_coff_1 = l.coff_vars[0].coff * fa_coff[var_idx_1], fa_coff_2 = l.coff_vars[1].coff * fa_coff[var_idx_2];
        ration_num key_new = l.key + const_1 + const_2;
        // fa_coff_1*fa_1+fa_coff_2*fa_2+key==0
        if (fa_1 == fa_2)
            return false;
        if (fa_coff_1.abs() > fa_coff_2.abs())
        {
            fa[fa_2] = fa_1;
            fa_coff[fa_2] = -fa_coff_1 / fa_coff_2;
            fa_const[fa_2] = -key_new / fa_coff_2;
            return true;
        } // fa_2 = (-fa_coff_1/fa_coff_2)*fa_1 + (-key/fa_coff_2)
        else
        {
            fa[fa_1] = fa_2;
            fa_coff[fa_1] = -fa_coff_2 / fa_coff_1;
            fa_const[fa_1] = -key_new / fa_coff_1;
            return true;
        } // fa_1 = (-fa_coff_2/fa_coff_1)*fa_2 + (-key/fa_coff_1)
        return false;
    }
    bool cmp_coff_var(const coff_var &cv1, const coff_var &cv2) { return cv1.var_idx < cv2.var_idx; }
    void ls_solver::find_unit_equal_lits(std::vector<int> &unit_equal_lits_all)
    {
        std::map<std::string, int> litstr2idx;
        // find out all unit equal lits
        for (int clause_idx = 0; clause_idx < _clauses.size(); clause_idx++)
        {
            if (_clauses[clause_idx].literals.size() == 1 && _clauses[clause_idx].literals[0] > 0)
            {
                int lit_idx = _clauses[clause_idx].literals[0];
                lit *l = &(_lits[lit_idx]);
                if (l->is_equal)
                { // t1+t2+..+tn=0
                    unit_equal_lits_all.push_back(lit_idx);
                }
                else if (l->is_nia_lit)
                { // t1+t2<=0

                    {
                        std::sort(l->coff_vars.begin(), l->coff_vars.end(), cmp_coff_var);
                        std::string lit_cvs;
                        std::string neg_lit_cvs;
                        for (coff_var &cv : l->coff_vars)
                        {
                            lit_cvs += cv.coff.print() + "*" + std::to_string(cv.var_idx) + "+";
                            neg_lit_cvs += (-cv.coff).print() + "*" + std::to_string(cv.var_idx) + "+";
                        }
                        lit_cvs += l->key.print();
                        neg_lit_cvs += (-l->key).print();
                        if (litstr2idx.find(neg_lit_cvs) != litstr2idx.end())
                        {
                            int l_eq_idx = litstr2idx[neg_lit_cvs];
                            _lits[l_eq_idx].is_equal = true;
                            l->lits_index = 0;
                            unit_equal_lits_all.push_back(l_eq_idx);
                        }
                        else
                        {
                            litstr2idx[lit_cvs] = l->lits_index;
                        }
                    }
                }
            }
        }
    }
    void ls_solver::equal_vars()
    {
        std::vector<ration_num> preset_values(_resolution_vars.size(), INT32_MAX);
        fa.resize(_resolution_vars.size());
        for (int var_idx = 0; var_idx < _resolution_vars.size(); var_idx++)
        {
            fa[var_idx] = var_idx;
        } // initialize the fa vec
        fa_coff.resize(_resolution_vars.size(), 1);
        fa_const.resize(_resolution_vars.size(), 0);
        bool modified = true;
        while (modified)
        { // if the formula has been modified, it should try to update by equalities again
            modified = reduce_clause();
            std::vector<int> unit_equal_lits_all; // a+b+... == any
            find_unit_equal_lits(unit_equal_lits_all);
            if (update_by_equals(unit_equal_lits_all, preset_values))
                modified = true;
        }
    }

    // return true if lits can be modified by equalitied
    bool ls_solver::update_by_equals(const std::vector<int> &unit_equal_lits_all, std::vector<ration_num> &preset_values)
    {
        bool find_new_merge = true;
        bool modified = false;
        while (find_new_merge)
        {
            find_new_merge = false;
            // find the equalities in form of a==1
            for (int i = 0; i < unit_equal_lits_all.size(); i++)
            {
                lit *l = &(_lits[unit_equal_lits_all[i]]);
                if (l->lits_index != 0 && l->coff_vars.size() == 1)
                {
                    int var_1 = l->coff_vars[0].var_idx;
                    if (preset_values[var_1] == INT32_MAX)
                    {
                        preset_values[var_1] = ((-l->key) / l->coff_vars[0].coff);
                        _resolution_vars[var_1].upper_bound = preset_values[var_1];
                        _resolution_vars[var_1].low_bound = preset_values[var_1];
                    }
                    find_new_merge = true;
                    modified = true;
                    l->lits_index = 0;
                }
            }
            for (int i = 0; i < unit_equal_lits_all.size(); i++)
            {
                int l_idx = unit_equal_lits_all[i];
                update_lit_preset_tmp_var(l_idx, preset_values);
            }
            // merge the equalities in form of 1*a+2*b==3
            for (int i = 0; i < unit_equal_lits_all.size(); i++)
            {
                lit *l = &(_lits[unit_equal_lits_all[i]]);
                if (l->lits_index == 0)
                {
                    continue;
                }
                if (l->coff_vars.size() == 2 && merge(*l))
                {
                    l->lits_index = 0;
                    find_new_merge = true;
                    modified = true;
                }
            }
            // modify the lit by new equality
            for (int i = 0; i < unit_equal_lits_all.size(); i++)
                update_lit_equal(unit_equal_lits_all[i]);

            // if there is no unit equalities with 1 or 2 vars, try to find one by modify the formula
            if (!modified)
            {
                std::vector<int> m_lits;
                for (const auto &l_idx : unit_equal_lits_all)
                {
                    if (_lits[l_idx].coff_vars.size() > 2)
                        m_lits.push_back(l_idx);
                }
                if (resolve_multiple_equals(m_lits))
                {
                    modified = true; // if the equality has been modified, and find some literals with 1 or 2 vars
                }
            }
        }
        for (int lit_idx = 0; lit_idx < _lits.size(); lit_idx++)
        {
            update_lit_preset_tmp_var(lit_idx, preset_values);
            update_lit_equal(lit_idx);
        }
        return modified;
    }

    void ls_solver::update_lit_preset_tmp_var(int lit_idx, const std::vector<ration_num> &pre_set_val)
    {
        lit *l = &(_lits[lit_idx]);
        if (l->lits_index == 0 || !l->is_nia_lit)
            return;
        if (l->coff_vars.size() == 1 && l->is_equal)
            return;
        unsigned total_cv_size = 0;
        for (unsigned cv_idx = 0; cv_idx < l->coff_vars.size(); cv_idx++)
        {
            coff_var &cv = l->coff_vars[cv_idx];
            int var_idx = cv.var_idx;
            if (pre_set_val[var_idx] != INT32_MAX)
            {
                l->key += (cv.coff * pre_set_val[var_idx]);
                continue;
            }
            l->coff_vars[total_cv_size++] = cv;
        }
        l->coff_vars.resize(total_cv_size);
        if (l->coff_vars.size() == 0)
        {
            if (l->key == 0 || (l->key < 0 && !l->is_equal))
                l->lits_index = 0;
        }
        gcd_for_lit(*l);
    }

    void ls_solver::update_lit_equal(int lit_idx)
    {
        lit *l = &(_lits[lit_idx]);
        if (l->lits_index == 0 || !l->is_nia_lit)
        {
            return;
        }
        bool lit_modified = false;
        for (coff_var &cv : l->coff_vars)
        {
            int var_idx = cv.var_idx;
            int new_var_idx = find(var_idx);
            if (new_var_idx != var_idx)
            { // modify the var
                lit_modified = true;
                l->key += cv.coff * fa_const[var_idx];
                cv.var_idx = new_var_idx;
                cv.coff *= fa_coff[var_idx];
            }
        }
        if (lit_modified)
        {
            std::sort(l->coff_vars.begin(), l->coff_vars.end(), cmp_coff_var);
            int curr_var_idx = l->coff_vars[0].var_idx;
            ration_num curr_coff = 0;
            int lit_coff_var_idx = 0;
            for (int cv_idx = 0; cv_idx < l->coff_vars.size(); cv_idx++)
            {
                if (l->coff_vars[cv_idx].var_idx != curr_var_idx)
                {
                    curr_var_idx = l->coff_vars[cv_idx].var_idx;
                    curr_coff = 0;
                } // enter a new var
                curr_coff += l->coff_vars[cv_idx].coff; // the same var
                if (curr_coff != 0 && (cv_idx == l->coff_vars.size() - 1 || l->coff_vars[cv_idx + 1].var_idx != curr_var_idx))
                {
                    l->coff_vars[lit_coff_var_idx].var_idx = curr_var_idx;
                    l->coff_vars[lit_coff_var_idx++].coff = curr_coff;
                } // the last coff_var of the current var
            }
            l->coff_vars.resize(lit_coff_var_idx);
            if (lit_coff_var_idx == 0)
            {
                l->lits_index = 0;
            }
            gcd_for_lit(*l);
        }
    }

    void print_vec(const std::vector<std::vector<int>> &cl)
    {
        std::cout << "0\n"
                  << cl.size() << '\n';
        for (auto c : cl)
        {
            std::cout << "(";
            for (auto l : c)
            {
                std::cout << " " << l;
            }
            std::cout << " )\n";
        }
    }

    // delete the duplicate clauses and clause containing unit lits
    void ls_solver::delete_redundant_clauses(std::vector<std::vector<int>> &clause_vec)
    {
#ifdef LS_DEBUG
        std::cout << "start build\n";
        print_vec(clause_vec);
#endif
        std::sort(clause_vec.begin(), clause_vec.end()); // sort the clauses according to its literals
        int n_c = 0;
        for (int cl_idx = 0; cl_idx < clause_vec.size(); cl_idx++)
        {
            if (n_c == 0 || (!is_same_cls(clause_vec[cl_idx], clause_vec[n_c - 1])))
            {
                clause_vec[n_c++] = clause_vec[cl_idx];
            }
        } // delete redundant clauses
        clause_vec.resize(n_c);
        for (int cl_idx = 0; cl_idx < clause_vec.size(); cl_idx++)
        {
            unsigned clause_sz = 0;
            for (int l : clause_vec[cl_idx])
            {
                if (clause_sz == 0 || clause_vec[cl_idx][clause_sz - 1] != l)
                {
                    clause_vec[cl_idx][clause_sz++] = l;
                }
            }
            clause_vec[cl_idx].resize(clause_sz);
        }
#ifdef LS_DEBUG
        std::cout << "after delete redundant clauses\n";
        print_vec(clause_vec);
#endif
        std::vector<bool> unit_lit(2 * _num_lits + _additional_len, false);
        n_c = 0;
        for (int cl_idx = 0; cl_idx < clause_vec.size(); cl_idx++)
        {
            if (clause_vec[cl_idx].size() == 1)
            {
                unit_lit[(clause_vec[cl_idx][0] + _num_lits)] = true;
            } // unit lit, record it
        }
        for (int cl_idx = 0; cl_idx < clause_vec.size(); cl_idx++)
        {
            bool has_unit_lit = false;
            if (clause_vec[cl_idx].size() != 1)
            {
                for (auto l : clause_vec[cl_idx])
                {
                    if (unit_lit[l + _num_lits])
                    {
                        has_unit_lit = true;
                        break;
                    } // if found unit clause
                }
            }
            if (!has_unit_lit)
            {
                clause_vec[n_c++] = clause_vec[cl_idx];
            } // unit or multiple clauses without unit, add it to clauses
        }
        clause_vec.resize(n_c);
#ifdef LS_DEBUG
        std::cout << "after delete unit clauses\n";
        print_vec(clause_vec);
        std::cout.flush();
#endif
    }

    void ls_solver::build_instance(std::vector<std::vector<int>> clause_vec)
    {
        delete_redundant_clauses(clause_vec);
        turn_tmp_to_resolution();
        prepare_clause_for_resolution(clause_vec);
        // now the vars are all in the resolution vars
        unit_prop();
        resolution();
        unit_prop();
        reduce_clause();
        equal_vars();
        reduce_clause();
        find_bound();
        reduce_clause();
        eliminate_multiple_inequalities();
        // now the vars are in the reduced vars
        turn_resolution_to_reduce();
        prepare_components_idx();
        best_found_cost = (int)_num_clauses;
        make_space();
        set_pre_value();
    }

    void ls_solver::prepare_up_value_vars()
    {
        up_value_vars.resize(_vars.size(), 0);
        for (variable &v : _resolution_vars)
        {
            if (v.up_bool != 0)
            {
                size_t idx = name2var[v.var_name];
                up_value_vars[idx] = v.up_bool;
            }
        }
    }

    // a+b<=10 and a+b<=0 --> a+b<=0
    void ls_solver::eliminate_multiple_inequalities()
    {
        std::map<std::string, int> minlit2idx;
        for (const auto &c : _clauses)
        {
            if (c.literals.size() == 1 && c.literals[0] > 0)
            {
                lit &l = _lits[c.literals[0]];
                if (l.lits_index != 0 && l.is_nia_lit && !l.is_equal)
                {
                    std::string lit_cfs;
                    for (coff_var &cv : l.coff_vars)
                        lit_cfs += cv.coff.print() + "*" + std::to_string(cv.var_idx) + "+";
                    if (minlit2idx.find(lit_cfs) == minlit2idx.end())
                    {
                        minlit2idx[lit_cfs] = l.lits_index;
                    }
                    else
                    {
                        lit &l_pre_min = _lits[minlit2idx[lit_cfs]];
                        if (l.key > l_pre_min.key)
                        {
                            l_pre_min.lits_index = 0;
                            minlit2idx[lit_cfs] = l.lits_index;
                        }
                        else
                        {
                            l.lits_index = 0;
                        }
                    }
                }
            }
        }
        reduce_clause();
    }

    void ls_solver::find_bound()
    {
        for (int clause_idx = 0; clause_idx < _clauses.size(); clause_idx++)
        {
            if (_clauses[clause_idx].literals.size() == 1)
            {
                int &l_only_idx = _clauses[clause_idx].literals[0];
                lit *l = &(_lits[std::abs(l_only_idx)]);
                if (l->is_equal || !l->is_nia_lit || l->lits_index == 0)
                {
                    continue;
                } // equal lit is not bound lit
                if (l->coff_vars.size() == 1)
                {
                    ration_num new_low_bound = -max_int;
                    ration_num new_upper_bound = max_int;
                    int var_idx = l->coff_vars[0].var_idx;
                    if (l_only_idx > 0)
                    {
                        if (l->coff_vars[0].coff > 0)
                        {
                            new_upper_bound = (-l->key) / (l->coff_vars[0].coff);
                        } // ax+k<=0   x<=(-k/a)
                        else
                        {
                            new_low_bound = (-l->key) / (l->coff_vars[0].coff);
                        } // ax+k<=0  x>=(-k/a)
                    }
                    else
                    {
                        if (l->coff_vars[0].coff > 0)
                        {
                            new_low_bound = (-l->key) / (l->coff_vars[0].coff);
                        } // ax+k>0 ax+k>=1 x>=(1-k)/a
                        else
                        {
                            new_upper_bound = (-l->key) / (l->coff_vars[0].coff);
                        } // ax+k>=1 x<=(1-k)/a
                    }
                    if (new_low_bound > _resolution_vars[var_idx].low_bound)
                    {
                        _resolution_vars[var_idx].low_bound = new_low_bound;
                    }
                    else if (new_upper_bound < _resolution_vars[var_idx].upper_bound)
                    {
                        _resolution_vars[var_idx].upper_bound = new_upper_bound;
                    }
                    if (l->lits_index != 0)
                    {
                        _bound_lits.push_back(l->lits_index);
                    }
                    l->lits_index = 0;
                    if (l_only_idx < 0)
                    {
                        l_only_idx = -l_only_idx;
                    }
                }
            }
        }
        for (variable &v_tmp : _resolution_vars)
        {
            if (v_tmp.low_bound > v_tmp.upper_bound)
            {
                build_unsat = true;
                break;
            }
        }
    }
    void ls_solver::prepare_clause_for_resolution(const std::vector<std::vector<int>> clause_vec)
    {
        _clauses.resize(clause_vec.size());
        _num_clauses = 0;
        for (auto clause_curr : clause_vec)
        {
            bool is_tautology = false;
            for (auto l_idx : clause_curr)
            {
                if (_lits[std::abs(l_idx)].lits_index == 0)
                {
                    is_tautology = true;
                    break;
                }
            }
            if (is_tautology)
            {
                continue;
            }
            for (auto l_idx : clause_curr)
            {
                _clauses[_num_clauses].literals.push_back(l_idx);
                lit *l = &(_lits[std::abs(l_idx)]);
                if (l->lits_index == 0)
                {
                    continue;
                }
                if (!l->is_nia_lit)
                {
                    _resolution_vars[l->delta.to_int()].clause_idxs.push_back((int)_num_clauses);
                }
            }
            _num_clauses++;
        }
        _clauses.resize(_num_clauses);
    }

    uint64_t ls_solver::transfer_name_to_reduced_var(const std::string &name, bool is_nia)
    {
        if (name2var.find(name) == name2var.end())
        {
            name2var[name] = _vars.size();
            variable var;
            var.var_name = name;
            var.is_nia = is_nia;
            _vars.push_back(var);
            if (is_nia)
            {
                nia_var_vec.push_back((int)_vars.size() - 1);
            }
            else
            {
                bool_var_vec.push_back((int)_vars.size() - 1);
            }
            return _vars.size() - 1;
        }
        else
            return name2var[name];
    }

    uint64_t ls_solver::transfer_name_to_resolution_var(const std::string &name, bool is_nia)
    {
        if (name2resolution_var.find(name) == name2resolution_var.end())
        {
            name2resolution_var[name] = _resolution_vars.size();
            variable var;
            var.clause_idxs.reserve(64);
            var.literal_idxs.reserve(64);
            var.var_lits.reserve(64);
            var.var_name = name;
            var.is_nia = is_nia;
            _resolution_vars.push_back(var);
            if (is_nia)
            {
                nia_var_vec.push_back((int)_resolution_vars.size() - 1);
            }
            else
            {
                bool_var_vec.push_back((int)_resolution_vars.size() - 1);
            }
            return _resolution_vars.size() - 1;
        }
        else
            return name2resolution_var[name];
    }

    uint64_t ls_solver::transfer_name_to_tmp_var(const std::string &name)
    {
        if (name2tmp_var.find(name) == name2tmp_var.end())
        {
            name2tmp_var[name] = _tmp_vars.size();
            variable var;
            var.is_nia = true;
            var.var_name = name;
            _tmp_vars.push_back(var);
            return _tmp_vars.size() - 1;
        }
        else
            return name2tmp_var[name];
    }
    // transfer the nia var into _resolution_vars, turn (x-y) to z
    void ls_solver::turn_tmp_to_resolution()
    {
        variable *original_var;
        variable *new_var;
        int original_var_idx;
        name2var.clear();

        // set low and upbound
        for (original_var_idx = 0; original_var_idx < _tmp_vars.size(); original_var_idx++)
        {
            original_var = &(_tmp_vars[original_var_idx]);
            // original var
            new_var = &(_resolution_vars[transfer_name_to_resolution_var(original_var->var_name, true)]);
            new_var->low_bound = original_var->low_bound;
            new_var->upper_bound = original_var->upper_bound;
        }

        for (auto &l : _lits)
        {
            if (l.lits_index != 0 && l.is_nia_lit)
            {
                for (auto &cv : l.coff_vars)
                {
                    original_var = &(_tmp_vars[cv.var_idx]);
                    cv.var_idx = (int)transfer_name_to_resolution_var(original_var->var_name, true);
                }
            }
        }
    }

    void ls_solver::unit_prop()
    {
        std::stack<uint64_t> unit_clause; // the var_idx in the unit clause
        for (uint64_t clause_idx = 0; clause_idx < _num_clauses; clause_idx++)
        { // the unit clause is the undeleted clause containing only one bool var
            if (!_clauses[clause_idx].is_delete && _clauses[clause_idx].literals.size() == 1 && !_lits[std::abs(_clauses[clause_idx].literals[0])].is_nia_lit)
            {
                unit_clause.push(clause_idx);
            }
        }
        while (!unit_clause.empty())
        {
            uint64_t unit_clause_idx = unit_clause.top();
            unit_clause.pop();
            if (_clauses[unit_clause_idx].is_delete)
            {
                continue;
            }
            int is_pos_lit = (_clauses[unit_clause_idx].literals[0] > 0) ? 1 : -1;                     // determine the sign of the var in unit clause
            uint64_t unit_var = _lits[std::abs(_clauses[unit_clause_idx].literals[0])].delta.to_int(); // determing the var in unit clause
            _resolution_vars[unit_var].is_delete = true;                                               // delete the unit var
            _resolution_vars[unit_var].up_bool = is_pos_lit;                                           // set the solution of a boolean var as its unit propogation value
            for (uint64_t cl_idx : _resolution_vars[unit_var].clause_idxs)
            {
                clause *cl = &(_clauses[cl_idx]);
                if (cl->is_delete)
                    continue;
                for (uint64_t lit_idx = 0; lit_idx < cl->literals.size(); lit_idx++)
                {
                    int l_id_in_lits = cl->literals[lit_idx];
                    lit *l = &(_lits[std::abs(l_id_in_lits)]);
                    if (!l->is_nia_lit && l->delta == unit_var)
                    { // go through the clauses of the unit var, find the var in corresponding clause
                        if ((is_pos_lit > 0 && l_id_in_lits > 0) || (is_pos_lit < 0 && l_id_in_lits < 0))
                        {
                            cl->is_delete = true;
                            for (int l_idx_inner : cl->literals)
                            { // delete the clause from corresponding bool var
                                lit *l_inner = &(_lits[std::abs(l_idx_inner)]);
                                if (!l_inner->is_nia_lit && l_inner->delta != unit_var)
                                {
                                    variable *var_inner = &(_resolution_vars[l_inner->delta.to_int()]);
                                    for (uint64_t delete_idx = 0; delete_idx < var_inner->clause_idxs.size(); delete_idx++)
                                    {
                                        if (var_inner->clause_idxs[delete_idx] == cl_idx)
                                        {
                                            var_inner->clause_idxs[delete_idx] = var_inner->clause_idxs.back();
                                            var_inner->clause_idxs.pop_back();
                                            break;
                                        }
                                    }
                                }
                            }
                        } // if there exist same lit, the clause is already set true, then delete the clause
                        else
                        { // else delete the lit
                            cl->literals[lit_idx] = cl->literals.back();
                            cl->literals.pop_back();
                            if (cl->literals.size() == 1 && !_lits[std::abs(cl->literals[0])].is_nia_lit)
                            {
                                unit_clause.push(cl_idx);
                            } // if after deleting, it becomes unit clause
                        }
                        break;
                    }
                }
            }
        }
    }
    __int128_t ls_solver::hash_lits_to_num(std::vector<int> &lits)
    {
        std::sort(lits.begin(), lits.end());
        __int128_t hash_num = 0;
        for (int lit_idx : lits)
        {
            hash_num = (__int128_t)hash_num * (__int128_t)(_num_lits) + (__int128_t)lit_idx + (__int128_t)_num_lits;
        }
        return hash_num;
    }
    bool ls_solver::is_same_lits(std::vector<int> &lits_1, std::vector<int> &lits_2)
    {
        if (lits_1.size() != lits_2.size())
        {
            return false;
        }
        std::sort(lits_1.begin(), lits_1.end());
        std::sort(lits_2.begin(), lits_2.end());
        for (int l_idx = 0; l_idx < lits_1.size(); l_idx++)
        {
            if (lits_1[l_idx] != lits_2[l_idx])
            {
                return false;
            }
        }
        return true;
    }

    void ls_solver::resolution()
    {
        std::vector<uint64_t> pos_clauses(10 * _num_clauses);
        std::vector<uint64_t> neg_clauses(10 * _num_clauses);
        std::map<__int128_t, int> clauselit_map;            // for the clause with literal {a,b,c}, sort the lit by its order, and hash the literals to a number, then map it to the clause_idx, if deleted, set it to -1
        std::vector<__int128_t> clauselit(_clauses.size()); // hash the lits of clause to a number
        for (int cls_idx = 0; cls_idx < _clauses.size(); cls_idx++)
        {
            clauselit[cls_idx] = hash_lits_to_num(_clauses[cls_idx].literals);
            clauselit_map[clauselit[cls_idx]] = cls_idx;
        }
        int pos_clause_size, neg_clause_size;
        bool is_improve = true;
        while (is_improve)
        {
            is_improve = false;
            for (uint64_t bool_var_idx : bool_var_vec)
            {
                if (_resolution_vars[bool_var_idx].is_delete)
                    continue;
                pos_clause_size = 0;
                neg_clause_size = 0;
                for (int i = 0; i < _resolution_vars[bool_var_idx].clause_idxs.size(); i++)
                {
                    uint64_t clause_idx = _resolution_vars[bool_var_idx].clause_idxs[i];
                    if (_clauses[clause_idx].is_delete)
                        continue;
                    for (int l_var_sign : _clauses[clause_idx].literals)
                    {
                        if (!_lits[std::abs(l_var_sign)].is_nia_lit && _lits[std::abs(l_var_sign)].delta == bool_var_idx)
                        { // make sure that it is a boolean literal and is exactly the one containing the var
                            if (l_var_sign > 0)
                            {
                                pos_clauses[pos_clause_size++] = clause_idx;
                            }
                            else
                            {
                                neg_clauses[neg_clause_size++] = clause_idx;
                            }
                            break;
                        }
                    }
                } // determine the pos_clause and neg_clause
                int tautology_num = 0;
                for (int i = 0; i < pos_clause_size; i++)
                { // pos clause X neg clause
                    uint64_t pos_clause_idx = pos_clauses[i];
                    for (int j = 0; j < neg_clause_size; j++)
                    {
                        uint64_t neg_clause_idx = neg_clauses[j];
                        bool is_tautology_flag = false;
                        for (int k = 0; k < _clauses[neg_clause_idx].literals.size(); k++)
                        {
                            int l_neg_lit = _clauses[neg_clause_idx].literals[k];
                            if (_lits[std::abs(l_neg_lit)].delta != bool_var_idx || _lits[std::abs(l_neg_lit)].is_nia_lit)
                            { // the bool_var for resolution is not considered(that is \neg ( the lit is bool lit and it contains the var))
                                for (int l_pos_lit : _clauses[pos_clause_idx].literals)
                                {
                                    if (-l_neg_lit == (l_pos_lit))
                                    {
                                        is_tautology_flag = true;
                                        break;
                                    } // if there exists (aVb)^(-aV-b), the new clause is tautology
                                }
                            }
                            if (is_tautology_flag)
                            {
                                break;
                            }
                        }
                        if (is_tautology_flag)
                        {
                            tautology_num++;
                        }
                    }
                }
                if ((pos_clause_size * neg_clause_size - tautology_num) > (pos_clause_size + neg_clause_size))
                {
                    continue;
                } // if deleting the var can cause 2 times clauses, then skip it
                for (uint64_t clause_idx : _resolution_vars[bool_var_idx].clause_idxs)
                { // delete the clauses of bool_var
                    _clauses[clause_idx].is_delete = true;
                    for (int l_idx_sign : _clauses[clause_idx].literals)
                    { // delete the clause from corresponding bool var
                        lit *l = &(_lits[std::abs(l_idx_sign)]);
                        if (!l->is_nia_lit && l->delta != bool_var_idx)
                        {
                            variable *var_inner = &(_resolution_vars[l->delta.to_int()]);
                            for (uint64_t delete_idx = 0; delete_idx < var_inner->clause_idxs.size(); delete_idx++)
                            {
                                if (var_inner->clause_idxs[delete_idx] == clause_idx)
                                {
                                    var_inner->clause_idxs[delete_idx] = var_inner->clause_idxs.back();
                                    var_inner->clause_idxs.pop_back();
                                    break;
                                }
                            }
                        }
                    }
                }
                is_improve = true;
                _resolution_vars[bool_var_idx].is_delete = true;
                if (pos_clause_size == 0)
                {
                    _resolution_vars[bool_var_idx].up_bool = -1;
                } // if it is a false pure lit, the var is set to false
                if (neg_clause_size == 0)
                {
                    _resolution_vars[bool_var_idx].up_bool = 1;
                } // if it is a true pure lit, the var is set to true
                if (pos_clause_size == 0 || neg_clause_size == 0)
                    continue; // pos or neg clause is empty, meaning the clauses are SAT when assigned to true or false, then cannot resolute, just delete the clause
                for (int i = 0; i < pos_clause_size; i++)
                { // pos clause X neg clause
                    uint64_t pos_clause_idx = pos_clauses[i];
                    for (int j = 0; j < neg_clause_size; j++)
                    {
                        uint64_t neg_clause_idx = neg_clauses[j];
                        clause new_clause;
                        uint64_t pos_lit_size = _clauses[pos_clause_idx].literals.size();
                        uint64_t neg_lit_size = _clauses[neg_clause_idx].literals.size();
                        new_clause.literals.reserve(pos_lit_size + neg_lit_size);
                        bool is_tautology = false;
                        for (int k = 0; k < pos_lit_size; k++)
                        {
                            int l_sign_idx = _clauses[pos_clause_idx].literals[k];
                            if (_lits[std::abs(l_sign_idx)].is_nia_lit || _lits[std::abs(l_sign_idx)].delta != bool_var_idx)
                            {
                                new_clause.literals.push_back(l_sign_idx);
                            }
                        } // add the lits in pos clause to new clause
                        for (int k = 0; k < neg_lit_size; k++)
                        {
                            int l_sign_idx = _clauses[neg_clause_idx].literals[k];
                            if (_lits[std::abs(l_sign_idx)].is_nia_lit || _lits[std::abs(l_sign_idx)].delta != bool_var_idx)
                            {
                                bool is_existed_lit = false;
                                for (uint64_t i = 0; i < pos_lit_size - 1; i++)
                                {
                                    if (l_sign_idx == (new_clause.literals[i]))
                                    {
                                        is_existed_lit = true;
                                        break;
                                    } // if the lit has existed, then it will not be added
                                    if (l_sign_idx == (-new_clause.literals[i]))
                                    {
                                        is_tautology = true;
                                        break;
                                    } // if there exists (aVb)^(-aV-b), the new clause is tautology
                                }
                                if (is_tautology)
                                {
                                    break;
                                }
                                if (!is_existed_lit)
                                {
                                    new_clause.literals.push_back(l_sign_idx);
                                }
                            }
                        }
                        if (!is_tautology)
                        {
                            __int128_t clause_lit_hash = hash_lits_to_num(new_clause.literals);
                            bool should_add = false;
                            if (clauselit_map.find(clause_lit_hash) == clauselit_map.end())
                            {
                                should_add = true;
                            } // the clause never appears
                            else
                            {
                                int origin_clause_idx = clauselit_map[clause_lit_hash];
                                clause *cl_origin = &(_clauses[origin_clause_idx]);
                                if (cl_origin->is_delete)
                                {
                                    should_add = true;
                                } // the clause has been deleted
                                else if (!is_same_lits(cl_origin->literals, new_clause.literals))
                                {
                                    should_add = true;
                                } // not the same one
                            }
                            if (should_add)
                            { // add new clause, if it never appers then add it
                                for (int l_sign_idx : new_clause.literals)
                                {
                                    lit *l_inner = &(_lits[std::abs(l_sign_idx)]);
                                    if (!l_inner->is_nia_lit)
                                    {
                                        _resolution_vars[l_inner->delta.to_int()].clause_idxs.push_back((int)_num_clauses);
                                    }
                                }
                                _clauses.push_back(new_clause);
                                clauselit.push_back(clause_lit_hash);
                                clauselit_map[clause_lit_hash] = (int)_num_clauses;
                                _num_clauses++;
                            }
                        }
                    }
                }
                for (int i = 0; i < pos_clause_size; i++)
                {
                    clause pos_cl = _clauses[pos_clauses[i]];
                    for (int j = 0; j < pos_cl.literals.size(); j++)
                    {
                        int l_idx = pos_cl.literals[j];
                        lit *l = &(_lits[std::abs(l_idx)]);
                        if (!l->is_nia_lit && l->delta == bool_var_idx)
                        {
                            pos_cl.literals[j] = pos_cl.literals[0];
                            pos_cl.literals[0] = l_idx;
                            break;
                        }
                    }
                    _reconstruct_stack.push_back(pos_cl);
                }
                for (int i = 0; i < neg_clause_size; i++)
                {
                    clause neg_cl = _clauses[neg_clauses[i]];
                    for (int j = 0; j < neg_cl.literals.size(); j++)
                    {
                        int l_idx = neg_cl.literals[j];
                        lit *l = &(_lits[std::abs(l_idx)]);
                        if (!l->is_nia_lit && l->delta == bool_var_idx)
                        {
                            neg_cl.literals[j] = neg_cl.literals[0];
                            neg_cl.literals[0] = l_idx;
                            break;
                        }
                    }
                    _reconstruct_stack.push_back(neg_cl);
                }
            }
        }
    }
    bool cmp_vl_by_var(const var_lit &vl1, const var_lit &vl2) { return vl1.var_idx < vl2.var_idx; }
    bool cmp_vl_by_lit(const var_lit &vl1, const var_lit &vl2) { return vl1.lit_idx < vl2.lit_idx; }

    // prepare coff var, copy it to vars
    void ls_solver::prepare_coff_var()
    {
        fa_vars.resize(_vars.size());
        fa_coff_vars.resize(_vars.size(), 1);
        fa_const_vars.resize(_vars.size(), 0);
        for (size_t idx = 0; idx < _vars.size(); idx++)
            fa_vars[idx] = (int)idx;
        for (size_t idx = 0; idx < _vars.size(); idx++)
        {
            variable &v = _vars[idx];
            if (!v.is_nia)
                continue;
            int res_idx = (int)name2resolution_var[v.var_name];
            int res_root_idx = find(res_idx);
            int root_idx = (int)name2var[_resolution_vars[res_root_idx].var_name];
            fa_vars[idx] = root_idx;
            fa_coff_vars[idx] = fa_coff[res_idx];
            fa_const_vars[idx] = fa_const[res_idx];
        }
        // now the fa, fa_coff, fa_const are related to vars
    }
    // turn the coffs and key of the lit to integer value
    void ls_solver::gcd_for_lit(lit &l)
    {
        if (l.lits_index == 0 || !l.is_nia_lit || l.coff_vars.size() <= 1)
            return;
        int64_t m_total = l.key.m;
        for (const auto &cv : l.coff_vars)
            m_total *= cv.coff.m;
        for (auto &cv : l.coff_vars)
            cv.coff *= m_total;
        l.key *= m_total;
        int64_t result = l.coff_vars[0].coff.n;
        for (const auto &cv : l.coff_vars)
        {
            result = std::gcd(result, cv.coff.n);
            if (result == 1)
                return;
        }
        result = std::gcd(result, l.key.n);
        if (result != 1)
        {
            for (size_t idx = 0; idx < l.coff_vars.size(); idx++)
            {
                l.coff_vars[idx].coff /= result;
            }
            l.key /= result;
        }
    }

    bool ls_solver::reduce_duplicated_lits()
    {
        bool has_duplicated_lits = false;
        std::map<std::string, int> litstr2idx;
        std::vector<int> new_lit_idx(_lits.size());
        for (int l_idx = 0; l_idx < _lits.size(); l_idx++)
        {
            new_lit_idx[l_idx] = l_idx;
            lit *l = &_lits[l_idx];
            if (l->lits_index == 0 || !l->is_nia_lit)
                continue;
            std::sort(l->coff_vars.begin(), l->coff_vars.end(), cmp_coff_var);
            std::string lit_cvs;
            for (coff_var &cv : l->coff_vars)
            {
                lit_cvs += cv.coff.print() + "*" + std::to_string(cv.var_idx) + "+";
            }
            lit_cvs += l->key.print();
            lit_cvs += l->is_equal ? "==0" : "<=0";
            if (litstr2idx.find(lit_cvs) != litstr2idx.end())
            {
                new_lit_idx[l_idx] = litstr2idx[lit_cvs];
            } // the lit has appeared
            else
                litstr2idx[lit_cvs] = l_idx;
        }
        // replace the lits in clauses
        for (auto &c : _clauses)
        {
            if (c.is_delete)
                continue;
            for (auto &l_idx : c.literals)
            {
                lit *l = &_lits[std::abs(l_idx)];
                if (l->is_nia_lit && l->lits_index != 0)
                {
                    int abs_l_idx = std::abs(l_idx);
                    if (new_lit_idx[abs_l_idx] != abs_l_idx)
                    {
                        has_duplicated_lits = true;
                        if (l_idx > 0)
                            l_idx = new_lit_idx[abs_l_idx];
                        else
                            l_idx = -new_lit_idx[abs_l_idx];
                    }
                }
            }
        }
        return has_duplicated_lits;
    }

    // all lits in m_lits are unit equalities with multiple items
    bool ls_solver::resolve_multiple_equals(const std::vector<int> &m_lits)
    {
        if (m_lits.size() < 2)
            return false;
        std::map<int, size_t> var_hash;
        std::vector<int> var_idxs;
        for (const auto &l_idx : m_lits)
        {
            lit &l = _lits[l_idx];
            for (const auto &cv : l.coff_vars)
            {
                int var_idx = cv.var_idx;
                if (var_hash.find(var_idx) == var_hash.end())
                {
                    var_hash[var_idx] = var_idxs.size();
                    var_idxs.push_back(var_idx);
                }
            }
        }
        size_t row_num = m_lits.size();
        size_t collom_num = var_idxs.size() + 1;
        std::vector<std::vector<ration_num>> matrix(row_num);
        for (auto &row : matrix)
            row.resize(collom_num, 0);
        for (size_t l_idx = 0; l_idx < row_num; l_idx++)
        {
            lit &l = _lits[m_lits[l_idx]];
            for (const auto &cv : l.coff_vars)
            {
                size_t hash_val = var_hash[cv.var_idx];
                matrix[l_idx][hash_val] = cv.coff;
            }
            matrix[l_idx][collom_num - 1] = l.key;
        }
        // now the lits has been converted to matrix, matrix[i][j]=c indicates that in i_th literal, the coff of terms[j] is c, the last collom of the matrix indicates the key of literals
        gaussianElimination(matrix);
        // TODO: turn the double to rationals, then no need to determine whether contains double
        if (!contains_short_row(matrix))
        {
            return false; // if after the modification, there is still no lit with items less than 2
        }
        for (size_t r_idx = 0; r_idx < row_num; r_idx++)
        {
            lit &l = _lits[m_lits[r_idx]];
            if (is_all_zero_row(matrix[r_idx]))
                l.lits_index = 0;
            else
            {
                l.coff_vars.clear();
                for (size_t c_idx = 0; c_idx < collom_num - 1; c_idx++)
                {
                    if (matrix[r_idx][c_idx] != 0)
                    {
                        int var_idx = var_idxs[c_idx];
                        ration_num coff = matrix[r_idx][c_idx];
                        l.coff_vars.push_back(coff_var(var_idx, coff));
                    }
                }
                l.key = matrix[r_idx][collom_num - 1];
            }
        }
        return true;
    }
    bool ls_solver::reduce_clause()
    {
        bool clauses_modified = false;
        if (reduce_duplicated_lits())
            clauses_modified = true;
        int reduced_clause_num = 0;
        uint64_t original_clause_num = _num_clauses;
        // delete clause that has been marked deleted and those containing true literal
        for (int i = 0; i < _num_clauses; i++)
        {
            if (!_clauses[i].is_delete)
            {
                bool is_tautology = false;
                for (const auto &l_idx : _clauses[i].literals)
                {
                    if (_lits[std::abs(l_idx)].lits_index == 0)
                    {
                        is_tautology = true;
                        break;
                    }
                }
                if (!is_tautology)
                    _clauses[reduced_clause_num++] = _clauses[i];
            }
        }
        _clauses.resize(reduced_clause_num);
        _num_clauses = reduced_clause_num;
        // delete the duplicated literals in the same clause
        for (auto &c : _clauses)
        {
            std::sort(c.literals.begin(), c.literals.end());
            unsigned clause_sz = 0;
            for (int l : c.literals)
            {
                if (clause_sz == 0 || c.literals[clause_sz - 1] != l)
                {
                    c.literals[clause_sz++] = l;
                }
            }
            if (c.literals.size() != clause_sz)
                clauses_modified = true;
            c.literals.resize(clause_sz);
        }
        // delete redundant clauses
        std::vector<std::vector<int>> clause_vec(_num_clauses);
        for (size_t c_idx = 0; c_idx < _clauses.size(); c_idx++)
            clause_vec[c_idx] = _clauses[c_idx].literals;
        delete_redundant_clauses(clause_vec);
        _num_clauses = clause_vec.size();
        _clauses.resize(_num_clauses);
        for (size_t c_idx = 0; c_idx < _num_clauses; c_idx++)
            _clauses[c_idx].literals = clause_vec[c_idx];
        if (original_clause_num != _num_clauses)
            clauses_modified = true;
        return clauses_modified;
    }

    void ls_solver::turn_resolution_to_reduce()
    {

        bool_var_vec.clear();
        nia_var_vec.clear();
        _vars.reserve(_resolution_vars.size());
        _num_nia_lits = 0;
        _num_bool_lits = 0;
        for (const auto &v : _resolution_vars)
            transfer_name_to_reduced_var(v.var_name, v.is_nia);
        // now all resolution vars are in the vars
        for (lit &l : _lits)
        {
            if (l.lits_index == 0)
                continue;
            if (l.is_nia_lit)
            {
                for (coff_var &cv : l.coff_vars)
                {
                    cv.var_idx = (int)transfer_name_to_reduced_var(_resolution_vars[cv.var_idx].var_name, true);
                }
            }
            else
            {
                l.delta = transfer_name_to_reduced_var(_resolution_vars[l.delta.to_int()].var_name, false);
            }
        }
        // var_idx of all terms appear in lits are transfered to reduced vars
        // the lits_idx == 0 means the NIA lit is true
        // transfer the resolution vars to vars

        lit_appear.resize(_num_lits + _additional_len, false);
        var_appear.resize(_resolution_vars.size() + _additional_len, false);
        int reduced_clause_num = (int)_clauses.size();
        for (int clause_idx = 0; clause_idx < reduced_clause_num; clause_idx++)
        {
            _clauses[clause_idx].weight = 1;
            for (int k = 0; k < _clauses[clause_idx].literals.size(); k++)
            {
                int l_sign_idx = _clauses[clause_idx].literals[k];
                lit *l = &(_lits[std::abs(l_sign_idx)]);
                if (l->is_nia_lit)
                {
                    for (const auto &cv : l->coff_vars)
                    {
                        if (!var_appear[cv.var_idx])
                        {
                            var_appear[cv.var_idx] = true;
                        }
                        _vars[cv.var_idx].clause_idxs.push_back(clause_idx);
                    }
                    _clauses[clause_idx].nia_literals.push_back(l_sign_idx);
                }
                else
                {
                    if (!lit_appear[std::abs(l_sign_idx)])
                    {
                        _vars[l->delta.to_int()].literal_idxs.push_back(std::abs(l_sign_idx)); // for a boolean var, its first lit_idx is the lit containing the var
                    }
                    _vars[l->delta.to_int()].clause_idxs.push_back(clause_idx);
                    _vars[l->delta.to_int()].bool_var_in_pos_clause.push_back(l_sign_idx > 0); // for a boolean var, if it is neg in a clause, it is false
                    _clauses[clause_idx].bool_literals.push_back(l_sign_idx);
                }
                if (!lit_appear[std::abs(l_sign_idx)])
                {
                    lit_appear[std::abs(l_sign_idx)] = true;
                }
            }
        }
        _vars.resize(_vars.size());
        _num_vars = _vars.size();
        _num_nia_vars = 0;
        for (variable &v : _vars)
        {
            uint64_t pre_clause_idx = INT64_MAX;
            int var_clause_num = 0;
            for (int i = 0; i < v.clause_idxs.size(); i++)
            {
                uint64_t tmp_clause_idx = v.clause_idxs[i];
                if (pre_clause_idx != tmp_clause_idx)
                {
                    pre_clause_idx = tmp_clause_idx;
                    v.clause_idxs[var_clause_num++] = (int)pre_clause_idx;
                }
            }
            v.clause_idxs.resize(var_clause_num);
            if (v.is_nia)
            {
                v.upper_bound = _resolution_vars[transfer_name_to_resolution_var(v.var_name, true)].upper_bound;
                v.low_bound = _resolution_vars[transfer_name_to_resolution_var(v.var_name, true)].low_bound;
                _num_nia_vars++;
            }
        } // determine the clause_idxs of var
        lit *l;
        for (unsigned l_idx = 0; l_idx < _lits.size(); l_idx++)
        {
            l = &(_lits[l_idx]);
            if (!lit_appear[l_idx])
            {
                continue;
            }
            for (int pos_var_idx = 0; pos_var_idx < l->coff_vars.size(); pos_var_idx++)
            {
                uint64_t var_idx = l->coff_vars[pos_var_idx].var_idx;
                ration_num coff = l->coff_vars[pos_var_idx].coff;
                var_lit vl(var_idx, l_idx, coff);
                _vars[var_idx].var_lits.push_back(vl);
                l->var_lits.push_back(vl);
            }
        } // determine the var_lit of var and lit, the vlt has been sorted by the lit_idx in vars
        for (unsigned l_idx = 0; l_idx < _lits.size(); l_idx++)
        {
            l = &(_lits[l_idx]);
            if (lit_appear[l_idx])
            {
                std::sort(l->var_lits.begin(), l->var_lits.end(), cmp_vl_by_var);
            }
        } // sort the vlt in lit by its var_idx
        for (variable &v : _vars)
        {
            uint64_t pre_lit_idx = INT64_MAX;
            int var_lit_num = 0;
            for (int i = 0; i < v.var_lits.size(); i++)
            {
                uint64_t tmp_lit_idx = v.var_lits[i].lit_idx;
                if (pre_lit_idx != tmp_lit_idx)
                {
                    var_lit_num++;
                    pre_lit_idx = tmp_lit_idx;
                    v.literal_idxs.push_back(pre_lit_idx);
                }
            }
            v.literal_idxs.resize(var_lit_num);
        } // determine the lit_idxs of var
        prepare_coff_var();
        prepare_up_value_vars();
        b_width_idx = name2var[basic_component_name + "_width"];
        b_hight_idx = name2var[basic_component_name + "_hight"];
    }

    void ls_solver::prepare_components_idx()
    {
        std::string v_name, val;
        std::map<std::string, int> kids_names2fre;
        for (const auto &v_tmp : _tmp_vars)
        {
            v_name = v_tmp.var_name;
            size_t pos = v_name.find_last_of('_');
            if (pos != std::string::npos)
                v_name = v_name.substr(0, pos);
            if (v_name != basic_component_name)
            {
                if (kids_names2fre.find(v_name) != kids_names2fre.end())
                    kids_names2fre[v_name]++;
                else
                    kids_names2fre[v_name] = 1;
            }
        }
        for (const auto &pair : kids_names2fre)
        {
            if (pair.second == 4)
                add_component(pair.first);
        }
        add_component(basic_component_name);
    }

    void ls_solver::add_component(const std::string &c_name)
    {
        components_idx.push_back(name2var[c_name + "_width"]);
        components_idx.push_back(name2var[c_name + "_hight"]);
        components_idx.push_back(name2var[c_name + "_x"]);
        components_idx.push_back(name2var[c_name + "_y"]);
        components_idx.push_back(name2var[c_name + "_feasible"]);
        component_names.push_back(c_name);
    }

    void ls_solver::make_space()
    {
        _num_opt *= 3;
        _solution.resize(10 * _num_vars + _additional_len);
        _best_solutin.resize(_num_vars + _additional_len);
        tabulist.resize(2 * _num_vars + _additional_len, 0);
        operation_var_idx_vec.resize(_num_opt + _additional_len);
        operation_var_idx_bool_vec.resize(_num_opt + _additional_len);
        operation_change_value_vec.resize(_num_opt + _additional_len);
        last_move.resize(2 * _num_vars + _additional_len, 0);
        unsat_clauses = new Array((int)_num_clauses + (int)_additional_len);
        sat_clause_with_false_literal = new Array((int)_num_clauses + (int)_additional_len);
        false_lit_occur = new Array((int)_num_lits + (int)_additional_len);
        contain_bool_unsat_clauses = new Array((int)_num_clauses);
        is_chosen_bool_var.resize(_num_vars + _additional_len, false);
        _lit_make_break.resize(_num_lits + _additional_len, 0);
        is_in_unsat_clause.resize(_num_lits + _additional_len, false);
        lits_in_unsat_clause.resize(_num_lits + _additional_len);
    }

    void ls_solver::set_pre_value()
    {
        _pre_value_1.resize(_num_vars + _additional_len, INT32_MAX);
        _pre_value_2.resize(_num_vars + _additional_len, INT32_MAX);
        for (clause &cl : _clauses)
        {
            if (cl.literals.size() == 1 && cl.literals[0] > 0 && _lits[cl.literals[0]].is_equal)
            {
                lit *l = &(_lits[cl.literals[0]]);
                if (l->coff_vars.size() == 1)
                {
                    int var_idx = l->coff_vars[0].var_idx;
                    _pre_value_1[var_idx] = (-l->key / l->coff_vars[0].coff);
                }
            } //(a==0)
            else if (cl.literals.size() == 2 && cl.literals[0] > 0 && _lits[cl.literals[0]].is_equal && cl.literals[1] > 0 && _lits[cl.literals[1]].is_equal)
            {
                lit *l1 = &(_lits[cl.literals[0]]);
                lit *l2 = &(_lits[cl.literals[1]]);
                if ((l1->coff_vars.size() == 1) && (l2->coff_vars.size() == 1) && (l1->coff_vars[0].var_idx == l2->coff_vars[0].var_idx))
                {
                    int var_idx = l1->coff_vars[0].var_idx;
                    _pre_value_1[var_idx] = (-l1->key / l1->coff_vars[0].coff);
                    _pre_value_2[var_idx] = (-l2->key / l2->coff_vars[0].coff);
                }
            } //(a==0 OR a==1)
        }
    }
    ls_solver::~ls_solver()
    {
        if (unsat_clauses != NULL)
            delete unsat_clauses;
        if (sat_clause_with_false_literal != NULL)
            delete sat_clause_with_false_literal; // clauses with 0<sat_num<literal_num, from which swap operation are choosen
        if (contain_bool_unsat_clauses != NULL)
            delete contain_bool_unsat_clauses; // unsat clause with at least one boolean var
        if (false_lit_occur != NULL)
            delete false_lit_occur; // the false lits for choosing critical move
    }
}
