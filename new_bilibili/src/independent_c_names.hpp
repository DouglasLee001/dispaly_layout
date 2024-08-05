#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
};

const std::vector<bool> belong_to_right{
false,
true,
false,
false,
true,
false,
false,
false,
};
const std::vector<double> right_bound{
4000.0,
1650.0,
1480.0,
1210.0,
970.0,
800.0,
730.0,
490.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"title_tv_feasible",
"main_body_TV_feasible",
},
{
"title_tv_feasible",
"main_body_1_feasible",
},
{
"title_pad_feasible",
"main_body_1_feasible",
},
{
"title_pad_feasible",
"main_body_2_feasible",
},
{
"title_pad_feasible",
"main_body_3_feasible",
},
{
"title_phone_feasible",
"main_body_3_feasible",
},
{
"title_phone_feasible",
"main_body_4_feasible",
},
};
