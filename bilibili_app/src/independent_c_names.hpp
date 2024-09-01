#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
"title_tv_center",
};

const std::vector<bool> belong_to_right{
false,
true,
false,
true,
false,
false,
false,
true,
false,
};
const std::vector<double> right_bound{
4000.0,
1700.0,
1600.0,
970.0,
840.0,
740.0,
730.0,
390.0,
220.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"down_tab_vertical_feasible",
"title_tv_feasible",
"main_body_TV_feasible",
},
{
"down_tab_long_feasible",
"title_tv_feasible",
"main_body_2_feasible",
},
{
"down_tab_long_feasible",
"title_pad_feasible",
"main_body_2_feasible",
},
{
"down_tab_long_feasible",
"title_pad_feasible",
"main_body_3_feasible",
},
{
"down_tab_long_feasible",
"title_phone_feasible",
"main_body_3_feasible",
},
{
"down_tab_feasible",
"title_phone_feasible",
"main_body_3_feasible",
},
{
"down_tab_feasible",
"title_phone_feasible",
"main_body_4_feasible",
},
{
"down_tab_feasible",
"title_phone_feasible",
"main_body_watch_feasible",
},
};