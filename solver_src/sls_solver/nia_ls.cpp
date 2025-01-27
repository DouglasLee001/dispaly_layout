#include "nia_ls.h"
#include <sstream>
#define LS_DEBUG
namespace nia
{

    // random walk
    void ls_solver::update_clause_weight()
    {
        for (int i = 0; i < unsat_clauses->size(); i++)
        {
            clause *unsat_cl = &(_clauses[unsat_clauses->element_at(i)]);
            unsat_cl->weight++;
            for (int l_sign_idx : unsat_cl->bool_literals)
            {
                _vars[_lits[std::abs(l_sign_idx)].delta.to_int()].score++;
            }
        }
        total_clause_weight += unsat_clauses->size();
    }

    void ls_solver::smooth_clause_weight()
    {
        for (int i = 0; i < _num_clauses; i++)
        {
            if (_clauses[i].weight > 1 && !unsat_clauses->is_in_array(i))
            {
                _clauses[i].weight--;
                total_clause_weight--;
                if (_clauses[i].sat_count == 1 && !_lits[std::abs(_clauses[i].watch_lit_idx)].is_nia_lit)
                {
                    __int128_t watch_lit_idx = _lits[std::abs(_clauses[i].watch_lit_idx)].delta.to_int();
                    _vars[watch_lit_idx].score++;
                }
            }
        }
    }

    // when there is no operation, simply find a lit in a random false clause, pick a random var with coff!=0, set it to 0
    void ls_solver::no_operation_random_walk()
    {
        clause *cp = &(_clauses[unsat_clauses->element_at(mt() % unsat_clauses->size())]); // choose a random unsat clause
        int lit_idx = cp->literals[mt() % cp->literals.size()];
        lit *l = &(_lits[std::abs(lit_idx)]);
        if (!l->is_nia_lit)
        {
            critical_move(l->delta.to_int(), 0);
            return;
        } // boolean lit
        size_t num_cv = l->coff_vars.size();
        int var_idx_curr = l->coff_vars[mt() % num_cv].var_idx;
        if (var_idx_curr == unchanged_var_1 || var_idx_curr == unchanged_var_2)
            return;
        ration_num future_solution = 0;
        variable *var = &(_vars[var_idx_curr]);
        if (var->low_bound > 0)
        {
            future_solution = var->low_bound;
        }
        else if (var->upper_bound < 0)
        {
            future_solution = var->upper_bound;
        }
        critical_move(var_idx_curr, future_solution - _solution[var_idx_curr]); // move a random var with coff!=0 to 0
    }

    void ls_solver::random_walk()
    {
        int operation_idx(0), operation_idx_bool(0), clause_idx;
        clause *cp;
        // determine the operations
        for (int i = 0; i < 3 && operation_idx + operation_idx_bool < 5; i++)
        {
            clause_idx = unsat_clauses->element_at(mt() % unsat_clauses->size());
            cp = &(_clauses[clause_idx]);
            for (int l_idx : cp->nia_literals)
            {
                add_operation_from_false_lit(false, l_idx, operation_idx);
            }
            for (int l_idx : cp->bool_literals)
            {
                add_bool_operation(false, l_idx, operation_idx_bool);
            }
        }
        // recover bool vec
        for (int i = 0; i < operation_idx_bool; i++)
        {
            is_chosen_bool_var[operation_var_idx_bool_vec[i]] = false;
        }
        // recover the false_lit
        false_lit_occur->clear();
        // if no operation, return
        if (operation_idx + operation_idx_bool == 0)
        {
            last_op_var = UINT64_MAX; // in case the random walk make no move, it will not ban the only operation
            no_operation_random_walk();
            return;
        }
        // nia mode make move
        if (operation_idx_bool == 0 || (operation_idx > 0 && operation_idx_bool > 0 && !is_in_bool_search))
        {
            ration_num best_value_nia;
            int best_var_idx_nia, best_score_nia(INT32_MIN);
            select_best_operation_from_vec(operation_idx, best_score_nia, best_var_idx_nia, best_value_nia); // choose best nia operation
            critical_move(best_var_idx_nia, best_value_nia);
        }
        // bool mode make move
        else
        {
            // choose best bool operation
            int best_var_idx_bool(0), best_score_bool(INT32_MIN);
            select_best_operation_from_bool_vec(operation_idx_bool, best_score_bool, best_var_idx_bool);
            critical_move(best_var_idx_bool, 0);
        }
    }

    // basic operations
    bool ls_solver::update_best_solution()
    {
        bool improve = false;
        if (unsat_clauses->size() < best_found_this_restart)
        {
            improve = true;
            best_found_this_restart = unsat_clauses->size();
        }
        if (unsat_clauses->size() < best_found_cost)
        {
            improve = true;
            best_found_cost = unsat_clauses->size();
            best_cost_time = TimeElapsed();
        }
        return improve;
    }

    int ls_solver::pick_critical_move_bool()
    {
        int best_var_idx(-1), best_score(1);
        int operation_idx = 0;
        for (int i = 0; i < contain_bool_unsat_clauses->size(); i++)
        {
            int clause_idx = contain_bool_unsat_clauses->element_at(i);
            clause *cl = &(_clauses[clause_idx]);
            for (int l_sign_idx : cl->bool_literals)
            {
                add_bool_operation(true, l_sign_idx, operation_idx);
            }
        }
        for (int i = 0; i < operation_idx; i++)
        {
            is_chosen_bool_var[operation_var_idx_bool_vec[i]] = false;
        } // recover chosen_bool_var
        select_best_operation_from_bool_vec(operation_idx, best_score, best_var_idx);
        // if there is untabu decreasing move
        if (best_var_idx != -1)
        {
            return best_var_idx;
        }
        // update weight
        if (mt() % 10000 > smooth_probability)
        {
            update_clause_weight();
        }
        else
        {
            smooth_clause_weight();
        }
        random_walk();
        return -1;
    }

    void ls_solver::add_bool_operation(bool use_tabu, int lit_idx, int &operation_idx_bool)
    {
        __int128_t bool_var_idx = _lits[std::abs(lit_idx)].delta.to_int();
        if (is_chosen_bool_var[bool_var_idx])
            return; // operations will not be inserted repeatedly
        if (!use_tabu || (use_tabu && _outer_layer_step > tabulist[2 * bool_var_idx]))
        { // tabu mechanism
            operation_var_idx_bool_vec[operation_idx_bool++] = (int)bool_var_idx;
            is_chosen_bool_var[bool_var_idx] = true;
        }
    }

    // calculate the operation to be added
    void ls_solver::add_coff(uint64_t var_idx_curr, bool use_tabu, int lit_idx, int &operation_idx, ration_num coff_1)
    {
        lit *l = &(_lits[std::abs(lit_idx)]);
        ration_num lit_delta = l->delta;
        if (l->is_equal)
        {
            if (lit_idx > 0)
            {
                insert_operation(var_idx_curr, (-lit_delta / coff_1), operation_idx, use_tabu);
            } // the delta should be 0, while it is now !=0, so the change value should be -delta/coff
            else
            {
                insert_operation(var_idx_curr, 1, operation_idx, use_tabu);
                insert_operation(var_idx_curr, -1, operation_idx, use_tabu);
            } // the delta should be !=0, while it is now 0, so the change value should be +/- 1
        }
        else
        {
            if (lit_idx > 0)
            {
                insert_operation(var_idx_curr, ((-lit_delta) / coff_1), operation_idx, use_tabu);
            } // the delta should be <=0, while it is now >0, so the change value should add -delta/coff
            else
            {
                insert_operation(var_idx_curr, ((1 - lit_delta) / coff_1), operation_idx, use_tabu);
            } // the delta should be >0, while it is now <=0, so the change value should add (1-delta)/coff
        }
    }

    // for a falsified NIA lit, choose critical move from it
    void ls_solver::add_operation_from_false_lit(bool use_tabu, int lit_idx, int &operation_idx)
    {
        if (false_lit_occur->is_in_array(std::abs(lit_idx)))
            return;
        // if the false lit has been considered, then the lit will not be considered repeatedly
        false_lit_occur->insert_element(std::abs(lit_idx));
        // go through the coff_vars and insert critical move for each var
        for (const auto &cv : _lits[std::abs(lit_idx)].coff_vars)
            add_coff(cv.var_idx, use_tabu, lit_idx, operation_idx, cv.coff);
    }
    // select best bool operation from
    void ls_solver::select_best_operation_from_bool_vec(int operation_idx_bool, int &best_score_bool, int &best_var_idx_bool)
    {
        int cnt, score, var_idx;
        uint64_t best_last_move(UINT64_MAX);
        bool BMS;
        if (operation_idx_bool > 45)
        {
            BMS = true;
            cnt = 45;
        }
        else
        {
            BMS = false;
            cnt = operation_idx_bool;
        }
        for (int i = 0; i < cnt; i++)
        {
            if (BMS)
            {
                int idx = mt() % (operation_idx_bool - i);
                int tmp = operation_var_idx_bool_vec[operation_idx_bool - i - 1];
                var_idx = operation_var_idx_bool_vec[idx];
                operation_var_idx_bool_vec[idx] = tmp;
            }
            else
            {
                var_idx = operation_var_idx_bool_vec[i];
            }
            score = _vars[var_idx].score;
            uint64_t last_move_step = last_move[2 * var_idx];
            if (score > best_score_bool || (score == best_score_bool && last_move_step < best_last_move))
            {
                best_score_bool = score;
                best_var_idx_bool = var_idx;
                best_last_move = last_move_step;
            }
        }
    }
    // select the best nia operation from operation_vec depending on score
    void ls_solver::select_best_operation_from_vec(int operation_idx, int &best_score, int &best_var_idx, ration_num &best_value)
    {
        bool BMS;
        int cnt, score;
        uint64_t operation_var_idx, best_last_move(UINT64_MAX);
        ration_num operation_change_value, best_future_abs_value(INT64_MAX), future_abs_value;
        if (operation_idx > 45)
        {
            BMS = true;
            cnt = 45;
        }
        else
        {
            BMS = false;
            cnt = operation_idx;
        }
        for (int i = 0; i < cnt; i++)
        {
            if (BMS)
            {
                int idx = mt() % (operation_idx - i);
                operation_change_value = operation_change_value_vec[idx];
                operation_var_idx = operation_var_idx_vec[idx];
                operation_change_value_vec[idx] = operation_change_value_vec[operation_idx - i - 1];
                operation_var_idx_vec[idx] = operation_var_idx_vec[operation_idx - i - 1];
            }
            else
            {
                operation_change_value = operation_change_value_vec[i];
                operation_var_idx = operation_var_idx_vec[i];
            }
            future_abs_value = (_solution[operation_var_idx] + operation_change_value).abs();
            score = critical_score(operation_var_idx, operation_change_value);
            int opposite_direction = (operation_change_value > 0) ? 1 : 0; // if the change value is >0, then means it is moving forward, the opposite direction is 1(backward)
            uint64_t last_move_step = last_move[2 * operation_var_idx + opposite_direction];
            if (score > best_score || (score == best_score && future_abs_value < best_future_abs_value) || (score == best_score && future_abs_value == best_future_abs_value && last_move_step < best_last_move))
            {
                best_score = score;
                best_var_idx = (int)operation_var_idx;
                best_value = operation_change_value;
                best_last_move = last_move_step;
                best_future_abs_value = future_abs_value;
            }
        }
    }
    // pick a NIA critical move
    int ls_solver::pick_critical_move(ration_num &best_value)
    {
        int best_score(1), best_var_idx(-1), operation_idx(0);
        // determine the critical value from unsat sat, using tabu
        for (int i = 0; i < unsat_clauses->size(); i++)
        {
            clause *cl = &(_clauses[unsat_clauses->element_at(i)]);
            for (int l_idx : cl->nia_literals)
            {
                add_operation_from_false_lit(true, l_idx, operation_idx);
            }
        }
        // recover the false_lit
        false_lit_occur->clear();
        // go through the forward and backward move of vars, evaluate their score, pick the untabued best one
        select_best_operation_from_vec(operation_idx, best_score, best_var_idx, best_value);
        // if there is untabu decreasing move
        if (best_var_idx != -1)
        {
            return best_var_idx;
        }
        // choose from swap operations if there is no decreasing unsat critical
        if (!sat_clause_with_false_literal->empty())
        {
            operation_idx = 0;
            add_swap_operation(operation_idx);
            // recover the false_lit
            false_lit_occur->clear();
            select_best_operation_from_vec(operation_idx, best_score, best_var_idx, best_value);
            if (best_var_idx != -1)
            {
                return best_var_idx;
            }
        }
        // update weight and random walk
        if (mt() % 10000 > smooth_probability)
        {
            update_clause_weight();
        }
        else
        {
            smooth_clause_weight();
        }
        random_walk();
        return -1;
    }

    // make move
    void ls_solver::critical_move(uint64_t var_idx, ration_num change_value)
    {
        int direction = (change_value > 0) ? 0 : 1;
        if (_vars[var_idx].is_nia)
        {
            last_op_value = change_value;
            last_op_var = var_idx;
            move_update(var_idx, change_value);
            _solution[var_idx] += change_value;
        }
        else
        {
            last_op_var = UINT64_MAX; // if last operation is boolean operation, the var should no longer be banned
            int origin_score = _vars[var_idx].score;
            move_update(var_idx);
            _solution[var_idx] *= -1;
            _vars[var_idx].score = -origin_score;
        }
        // step
        if (_vars[var_idx].is_nia)
        {
            last_move[2 * var_idx + direction] = _step;
            tabulist[var_idx * 2 + (direction + 1) % 2] = _step + 3 + mt() % 10;
        }
        else
        {
            last_move[2 * var_idx] = _outer_layer_step;
            tabulist[2 * var_idx] = _outer_layer_step + 1 + mt() % 3;
            _outer_layer_step++;
        }
    }
    // transfer the ">" to "<="
    void ls_solver::invert_lit(lit &l)
    {
        l.key = 1 - l.key;
        for (int i = 0; i < l.coff_vars.size(); i++)
        {
            l.coff_vars[i].coff *= -1;
        }
    }
    // all coffs are positive, go through all vars of the literal
    ration_num ls_solver::delta_lit(lit &l)
    {
        ration_num delta = l.key;
        for (const auto &cv : l.coff_vars)
        {
            delta += (cv.coff * _solution[cv.var_idx]);
        }
        return delta;
    }

    double ls_solver::TimeElapsed()
    {
        std::chrono::steady_clock::time_point finish = std::chrono::steady_clock::now();
        std::chrono::duration<double> duration = finish - start;
        return duration.count();
    }

    void ls_solver::insert_operation(uint64_t var_idx, ration_num change_value, int &operation_idx, bool use_tabu)
    {
        if (var_idx == unchanged_var_1 || var_idx == unchanged_var_2)
            return;
        if (var_idx == last_op_var && change_value == -last_op_value)
        {
            return;
        } // if op returns to previous assignment, it is banned
        uint64_t direction = (change_value > 0) ? 0 : 1;
        if (use_tabu && _step < tabulist[2 * var_idx + direction])
        {
            return;
        } // the operation is now tabued
        ration_num future_solution = _solution[var_idx] + change_value;
        if (future_solution > 100000000 || future_solution < -100000000)
        {
            return;
        }
        bool no_pre_value = (_pre_value_1[var_idx] == INT32_MAX && _pre_value_2[var_idx] == INT32_MAX && future_solution >= _vars[var_idx].low_bound && future_solution <= _vars[var_idx].upper_bound);
        bool has_pre_value_1 = (_pre_value_1[var_idx] != INT32_MAX && _pre_value_2[var_idx] == INT32_MAX && future_solution == _pre_value_1[var_idx]);
        bool has_pre_value_2 = (_pre_value_1[var_idx] != INT32_MAX && _pre_value_2[var_idx] != INT32_MAX && (future_solution == _pre_value_1[var_idx] || future_solution == _pre_value_2[var_idx]));
        if (no_pre_value || has_pre_value_1 || has_pre_value_2)
        {
            operation_var_idx_vec[operation_idx] = var_idx;
            operation_change_value_vec[operation_idx++] = change_value;
        }
    }

    void ls_solver::add_swap_operation(int &operation_idx)
    {
        int clause_idx;
        clause *cl;
        if (sat_clause_with_false_literal->size() < 20)
        {
            for (int i = 0; i < sat_clause_with_false_literal->size(); i++)
            {
                clause_idx = sat_clause_with_false_literal->element_at(i);
                cl = &(_clauses[clause_idx]);
                for (int l_idx : cl->nia_literals)
                {
                    if ((_lits[std::abs(l_idx)].is_true ^ l_idx) < 0)
                    {
                        add_operation_from_false_lit(true, l_idx, operation_idx);
                    } // determine a false lit, and add operation from it
                }
            }
        }
        else
        {
            for (int i = 0; operation_idx < 20 && i < 50; i++)
            {
                clause_idx = sat_clause_with_false_literal->element_at(mt() % sat_clause_with_false_literal->size());
                cl = &(_clauses[clause_idx]);
                for (int l_idx : cl->nia_literals)
                {
                    if ((_lits[std::abs(l_idx)].is_true ^ l_idx) < 0)
                    {
                        add_operation_from_false_lit(true, l_idx, operation_idx);
                    } // determine a false lit, and add operation from it
                }
            }
        }
    }

    // choose a clause with small weight, then choose a random lit, select the operation with greatest score in the lit
    void ls_solver::swap_from_small_weight_clause() {}

    // calculate score for nia vars
    int ls_solver::critical_score(uint64_t var_idx, ration_num change_value)
    {
        int critical_score = 0;
        variable *var = &(_vars[var_idx]);
        var_lit *vl;
        uint64_t curr_lit_idx = var->var_lits[0].lit_idx;
        ration_num curr_lit_delta_new = _lits[curr_lit_idx].delta;
        // determine the lit_make_break by going through the vlt of var
        for (int vl_idx = 0; vl_idx < var->var_lits.size(); vl_idx++)
        {
            vl = &(var->var_lits[vl_idx]);
            if (curr_lit_idx != vl->lit_idx)
            {
                curr_lit_idx = vl->lit_idx;
                curr_lit_delta_new = _lits[curr_lit_idx].delta;
            } // enter a new lit
            curr_lit_delta_new += vl->coff * change_value;
            if ((vl_idx == var->var_lits.size() - 1) || (curr_lit_idx != var->var_lits[vl_idx + 1].lit_idx))
            {
                if (_lits[curr_lit_idx].is_equal)
                {
                    if (_lits[curr_lit_idx].delta == 0 && curr_lit_delta_new != 0)
                    {
                        _lit_make_break[curr_lit_idx] = -1;
                    }
                    else if (_lits[curr_lit_idx].delta != 0 && curr_lit_delta_new == 0)
                    {
                        _lit_make_break[curr_lit_idx] = 1;
                    }
                } // equal lit
                else
                {
                    if (_lits[curr_lit_idx].delta <= 0 && curr_lit_delta_new > 0)
                    {
                        _lit_make_break[curr_lit_idx] = -1;
                    }
                    else if (_lits[curr_lit_idx].delta > 0 && curr_lit_delta_new <= 0)
                    {
                        _lit_make_break[curr_lit_idx] = 1;
                    }
                } // nia <= lit
            } // the last vlt of the var or the last vlt of current lit
        }
        // determine the score by going through the clauses of var
        clause *c;
        for (int cls_idx : var->clause_idxs)
        {
            c = &(_clauses[cls_idx]);
            int clause_sat_count_new = c->sat_count;
            for (int v_lit : c->literals)
            {
                clause_sat_count_new += (v_lit > 0) ? _lit_make_break[v_lit] : (-_lit_make_break[-v_lit]);
            }
            if (c->sat_count > 0 && clause_sat_count_new == 0)
            {
                critical_score -= c->weight;
            }
            else if (c->sat_count == 0 && clause_sat_count_new > 0)
            {
                critical_score += c->weight;
            }
        }
        // recover the lit_make_break
        for (uint64_t l_idx : var->literal_idxs)
        {
            _lit_make_break[l_idx] = 0;
        }
        return critical_score;
    }

    // sat or unsat a clause, update the delta, dedicated for nia var
    void ls_solver::move_update(uint64_t var_idx, ration_num change_value)
    {
        variable *var = &(_vars[var_idx]);
        var_lit *vl;
        uint64_t curr_lit_idx = var->var_lits[0].lit_idx;
        ration_num curr_lit_delta_new = _lits[curr_lit_idx].delta;
        // determine the lit_is_true by going through the vlt of var, and update the delta of lits
        for (int vl_idx = 0; vl_idx < var->var_lits.size(); vl_idx++)
        {
            vl = &(var->var_lits[vl_idx]);
            if (curr_lit_idx != vl->lit_idx)
            {
                curr_lit_idx = vl->lit_idx;
                curr_lit_delta_new = _lits[curr_lit_idx].delta;
            } // enter a new lit
            curr_lit_delta_new += vl->coff * change_value;
            if ((vl_idx == var->var_lits.size() - 1) || (curr_lit_idx != var->var_lits[vl_idx + 1].lit_idx))
            {
                if (_lits[curr_lit_idx].is_equal)
                {
                    if (_lits[curr_lit_idx].delta == 0 && curr_lit_delta_new != 0)
                    {
                        _lits[curr_lit_idx].is_true = -1;
                    }
                    else if (_lits[curr_lit_idx].delta != 0 && curr_lit_delta_new == 0)
                    {
                        _lits[curr_lit_idx].is_true = 1;
                    }
                } // equal lit
                else
                {
                    if (_lits[curr_lit_idx].delta <= 0 && curr_lit_delta_new > 0)
                    {
                        _lits[curr_lit_idx].is_true = -1;
                    }
                    else if (_lits[curr_lit_idx].delta > 0 && curr_lit_delta_new <= 0)
                    {
                        _lits[curr_lit_idx].is_true = 1;
                    }
                } // nia <= lit
                _lits[curr_lit_idx].delta = curr_lit_delta_new; // update lit delta
            } // the last vlt of the var or the last vlt of current lit
        }
        // unsat/sat a clause by going through the lits in it
        clause *c;
        lit *l;
        for (int cls_idx : var->clause_idxs)
        {
            c = &(_clauses[cls_idx]);
            int clause_sat_count_old = c->sat_count;
            int watch_lit_idx_old = c->watch_lit_idx;
            c->sat_count = 0; // reset the sat count
            for (int l_idx : c->literals)
            {
                if ((l_idx ^ _lits[std::abs(l_idx)].is_true) >= 0)
                {
                    c->sat_count++;
                    c->watch_lit_idx = l_idx;
                }
            }
            // sat or unsat a clause, update the lit_in_unsat_clause
            if (c->sat_count > 0 && clause_sat_count_old == 0)
            {
                sat_a_clause(cls_idx);
                _lit_in_unsat_clause_num -= c->literals.size();
                _bool_lit_in_unsat_clause_num -= c->bool_literals.size();
            }
            else if (c->sat_count == 0 && clause_sat_count_old > 0)
            {
                unsat_a_clause(cls_idx);
                _lit_in_unsat_clause_num += c->literals.size();
                _bool_lit_in_unsat_clause_num += c->bool_literals.size();
            }
            // update the sat_clause_with_false_lit
            if (c->sat_count > 0 && c->sat_count < c->literals.size())
            {
                sat_clause_with_false_literal->insert_element((int)cls_idx);
            }
            else
            {
                sat_clause_with_false_literal->delete_element((int)cls_idx);
            }
            // update the score of boolean vars
            if (clause_sat_count_old == 0 && c->sat_count > 0)
            {
                for (int l_sign_idx : c->bool_literals)
                {
                    l = &(_lits[std::abs(l_sign_idx)]);
                    _vars[l->delta.to_int()].score -= c->weight;
                }
            }
            else if (clause_sat_count_old == 1 && c->sat_count > 1)
            {
                l = &(_lits[std::abs(watch_lit_idx_old)]);
                if (!l->is_nia_lit)
                {
                    _vars[l->delta.to_int()].score += c->weight;
                }
            }
            else if (clause_sat_count_old > 0 && c->sat_count == 0)
            {
                for (int l_sign_idx : c->bool_literals)
                {
                    l = &(_lits[std::abs(l_sign_idx)]);
                    _vars[l->delta.to_int()].score += c->weight;
                }
            }
            else if (clause_sat_count_old > 1 && c->sat_count == 1)
            {
                l = &(_lits[std::abs(c->watch_lit_idx)]);
                if (!l->is_nia_lit)
                {
                    _vars[l->delta.to_int()].score -= c->weight;
                }
            }
        }
    }

    // dedicated for boolean var
    void ls_solver::move_update(uint64_t var_idx)
    {
        variable *var = &(_vars[var_idx]);
        int v_lit_idx = (int)var->literal_idxs[0]; // the lit_idx containing the var
        _lits[v_lit_idx].is_true *= -1;
        int make_break_in_clause = 0;
        int cl_sign_idx;
        for (int i = 0; i < var->clause_idxs.size(); i++)
        {
            cl_sign_idx = var->clause_idxs[i];
            if ((_solution[var_idx] > 0 && var->bool_var_in_pos_clause[i]) || (_solution[var_idx] < 0 && !var->bool_var_in_pos_clause[i]))
            {
                make_break_in_clause = -1;
            } // true to false
            else
            {
                make_break_in_clause = 1;
            } // false to true
            int clause_idx = std::abs(cl_sign_idx);
            clause *cp = &(_clauses[clause_idx]);
            // sat or unsat a clause
            if (cp->sat_count > 0 && cp->sat_count + make_break_in_clause == 0)
            {
                unsat_a_clause(clause_idx);
                _lit_in_unsat_clause_num += cp->literals.size();
                _bool_lit_in_unsat_clause_num += cp->bool_literals.size();
            }
            else if (cp->sat_count == 0 && cp->sat_count + make_break_in_clause > 0)
            {
                sat_a_clause(clause_idx);
                _lit_in_unsat_clause_num -= cp->literals.size();
                _bool_lit_in_unsat_clause_num -= cp->bool_literals.size();
            }
            int origin_watch_lit = cp->watch_lit_idx;
            int origin_sat_count = cp->sat_count;
            cp->sat_count += make_break_in_clause;
            // update sat_clause_with_false_lit
            if (cp->sat_count > 0 && cp->sat_count < cp->literals.size())
            {
                sat_clause_with_false_literal->insert_element(clause_idx);
            }
            else
            {
                sat_clause_with_false_literal->delete_element(clause_idx);
            }
            // update the watch lit
            if (std::abs(origin_watch_lit) == v_lit_idx && cp->sat_count > 0)
            { // if the original watch lit exactly contains the var and the sat_count>0, set the new watch lit
                for (int l_idx : cp->literals)
                {
                    if ((l_idx ^ _lits[std::abs(l_idx)].is_true) >= 0)
                    {
                        cp->watch_lit_idx = l_idx;
                        break;
                    }
                }
            }
            else if (origin_sat_count == 0)
            {
                cp->watch_lit_idx = (cl_sign_idx > 0) ? (v_lit_idx) : (-v_lit_idx);
            } // if origin sat count==0, then set new watch lit
            // update the score of boolean vars
            if (make_break_in_clause > 0)
            {
                if (origin_sat_count == 0)
                {
                    for (int bl : cp->bool_literals)
                    {
                        lit *l = &(_lits[std::abs(bl)]);
                        _vars[l->delta.to_int()].score -= cp->weight;
                    }
                }
                else if (origin_sat_count == 1)
                {
                    lit *l = &(_lits[std::abs(origin_watch_lit)]);
                    if (!l->is_nia_lit)
                    {
                        _vars[l->delta.to_int()].score += cp->weight;
                    }
                }
            }
            else if (make_break_in_clause < 0)
            {
                if (cp->sat_count == 0)
                {
                    for (int bl : cp->bool_literals)
                    {
                        lit *l = &(_lits[std::abs(bl)]);
                        _vars[l->delta.to_int()].score += cp->weight;
                    }
                }
                else if (cp->sat_count == 1)
                {
                    lit *l = &(_lits[std::abs(cp->watch_lit_idx)]);
                    if (!l->is_nia_lit)
                    {
                        _vars[l->delta.to_int()].score -= cp->weight;
                    }
                }
            }
        }
    }

    // check
    bool ls_solver::check_solution()
    {
        clause *cp;
        int unsat_num = 0;
        for (int lit_idx = 0; lit_idx < _lits.size(); lit_idx++)
        {
            if (!lit_appear[lit_idx] || !_lits[lit_idx].is_nia_lit)
            {
                continue;
            }
            ration_num delta = delta_lit(_lits[lit_idx]);
            if (delta != _lits[lit_idx].delta)
            {
                std::cout << "lit delta wrong: " << lit_idx << "\n";
            }
        } // check lit delta
        for (uint64_t i = 0; i < _num_clauses; i++)
        {
            int sat_count = 0;
            cp = &(_clauses[i]);
            for (int lit_idx : cp->literals)
            {
                ration_num delta = _lits[std::abs(lit_idx)].delta;
                bool is_equal = _lits[std::abs(lit_idx)].is_equal;
                if (!_lits[std::abs(lit_idx)].is_nia_lit)
                {
                    __int128_t var_idx = _lits[std::abs(lit_idx)].delta.to_int();
                    if ((_solution[var_idx] > 0 && lit_idx > 0) || (_solution[var_idx] < 0 && lit_idx < 0))
                    {
                        sat_count++;
                    }
                }
                else if ((!is_equal && ((delta <= 0 && lit_idx > 0) || (delta > 0 && lit_idx < 0))) || (is_equal && ((delta == 0 && lit_idx > 0) || (delta != 0 && lit_idx < 0))))
                {
                    sat_count++;
                }
            }
            if (sat_count != cp->sat_count)
            {
                std::cout << "sat count wrong at clause " << i << "\n";
            }
            if (sat_count == 0)
            {
                unsat_num++;
            }
        }
        for (int var_idx = 0; var_idx < _vars.size(); var_idx++)
        {
            if (_solution[var_idx] > _vars[var_idx].upper_bound || _solution[var_idx] < _vars[var_idx].low_bound)
            {
                std::cout << "var " << var_idx << " out of range\n";
            }
        }
        if (unsat_num == unsat_clauses->size())
            std::cout << "right solution\n";
        else
            std::cout << "wrong solution\n";
        return unsat_num == unsat_clauses->size();
    }

    bool ls_solver::update_inner_best_solution()
    {
        if (unsat_clauses->size() < _best_found_hard_cost_this_nia)
        {
            _best_found_hard_cost_this_nia = unsat_clauses->size();
            return true;
        }
        return false;
    }

    bool ls_solver::update_outer_best_solution()
    {
        if (unsat_clauses->size() < _best_found_hard_cost_this_bool)
        {
            _best_found_hard_cost_this_bool = unsat_clauses->size();
            return true;
        }
        return false;
    }

    void ls_solver::enter_nia_mode()
    {
        _best_found_hard_cost_this_nia = unsat_clauses->size();
        if (is_in_bool_search)
        {
            no_improve_cnt_nia = 0;
        } // only when it is now in boolean mode, the no_improve_cnt_nia will be 0
        is_in_bool_search = false;
    }

    void ls_solver::enter_bool_mode()
    {
        _best_found_hard_cost_this_bool = unsat_clauses->size();
        if (!is_in_bool_search)
        {
            no_improve_cnt_bool = 0;
        } // only when it is now in integer mode, the no_improve_cnt_bool will be 0
        is_in_bool_search = true;
    }

    // local search
    bool ls_solver::local_search()
    {
        initialize();
        if (build_unsat)
        {
            return false;
        }
        int no_improve_cnt = 0;
        int flipv;
        ration_num change_value = 0;
        start = std::chrono::steady_clock::now();
        _outer_layer_step = 1;
        for (_step = 1; _step < _max_step; _step++)
        {
            if (0 == unsat_clauses->size())
            {
                up_bool_vars();
                return true;
            }
            bool time_up_bool = (no_improve_cnt_bool * _lit_in_unsat_clause_num > 5 * _bool_lit_in_unsat_clause_num);
            bool time_up_nia = (no_improve_cnt_nia * _lit_in_unsat_clause_num > 20 * (_lit_in_unsat_clause_num - _bool_lit_in_unsat_clause_num));
            if ((is_in_bool_search && _bool_lit_in_unsat_clause_num < _lit_in_unsat_clause_num && time_up_bool) || _bool_lit_in_unsat_clause_num == 0)
            {
                enter_nia_mode();
            }
            else if ((!is_in_bool_search && _bool_lit_in_unsat_clause_num > 0 && time_up_nia) || (_lit_in_unsat_clause_num == _bool_lit_in_unsat_clause_num))
            {
                enter_bool_mode();
            }
            if (is_in_bool_search)
            {
                flipv = pick_critical_move_bool();
                if (flipv != -1)
                {
                    critical_move(flipv, change_value);
                }
                if (update_outer_best_solution())
                    no_improve_cnt_bool = 0;
                else
                    no_improve_cnt_bool++;
            }
            else
            {
                flipv = pick_critical_move(change_value);
                if (flipv != -1)
                {
                    critical_move(flipv, change_value);
                }
                if (update_inner_best_solution())
                    no_improve_cnt_nia = 0;
                else
                    no_improve_cnt_nia++;
            }
            no_improve_cnt = (update_best_solution()) ? 0 : (no_improve_cnt + 1);
        }
        return false;
    }

}
