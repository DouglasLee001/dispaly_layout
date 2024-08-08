#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
};

const std::vector<bool> belong_to_right{
false,
true,
true,
true,
true,
true,
true,
true,
};
const std::vector<double> right_bound{
4000.0,
1310.0,
1040.0,
880.0,
810.0,
660.0,
550.0,
440.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"empty_feasible",
"title_h_feasible",
"pic_3_feasible",
"app_flow_long_feasible",
"game_flow_long_feasible",
"movie_4_feasible",
},
{
"empty_feasible",
"title_h_feasible",
"pic_3_feasible",
"app_flow_feasible",
"game_flow_feasible",
"movie_4_feasible",
},
{
"empty_feasible",
"title_v_feasible",
"pic_3_feasible",
"app_flow_feasible",
"game_flow_feasible",
"movie_4_feasible",
},
{
"empty_feasible",
"title_v_feasible",
"pic_3_feasible",
"app_flow_feasible",
"game_flow_feasible",
"movie_3_feasible",
},
{
"empty_feasible",
"title_v_feasible",
"pic_2_feasible",
"app_flow_feasible",
"game_flow_feasible",
"movie_3_feasible",
},
{
"empty_feasible",
"title_v_feasible",
"pic_2_feasible",
"app_flow_feasible",
"game_flow_feasible",
"movie_2_feasible",
},
{
"empty_feasible",
"title_v_feasible",
"pic_1_feasible",
"app_flow_feasible",
"game_flow_feasible",
"movie_2_feasible",
},
};
