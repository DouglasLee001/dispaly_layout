#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
};

const std::vector<bool> belong_to_right{
false,
false,
false,
false,
true,
false,
false,
false,
false,
};
const std::vector<double> right_bound{
4000.0,
1650.0,
1550.0,
1210.0,
970.0,
800.0,
730.0,
630.0,
450.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"down_holder_kid_2_feasible",
"title_tv_feasible",
"main_body_TV_feasible",
},
{
"down_holder_kid_2_feasible",
"title_pad_feasible",
"main_body_1_feasible",
},
{
"down_tab_long_feasible",
"title_pad_feasible",
"main_body_1_feasible",
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
"down_tab_long_feasible",
"title_phone_feasible",
"main_body_4_feasible",
},
{
"down_tab_feasible",
"title_phone_feasible",
"main_body_4_feasible",
},
};
