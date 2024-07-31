#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
};

const std::vector<bool> belong_to_right{
true,
true,
true,
true,
true,
true,
};
const std::vector<double> right_bound{
4000.0,
800.0,
750.0,
700.0,
620.0,
400.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"search_feasible",
"title_buttons_feasible",
"main_body_feasible",
"fast_feasible",
},
{
"search_feasible",
"title_buttons_2_feasible",
"main_body_feasible",
"fast_feasible",
},
{
"search_feasible",
"title_buttons_2_feasible",
"main_body_2_feasible",
"fast2_feasible",
},
{
"search_2_feasible",
"title_buttons_2_feasible",
"main_body_2_feasible",
"fast2_feasible",
},
{
"search_2_feasible",
"title_buttons_2_feasible",
"main_body_2_feasible",
"fast_feasible",
},
};
