#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
};

const std::vector<bool> belong_to_right{
false,
true,
true,
false,
true,
false,
};
const std::vector<double> right_bound{
4000.0,
1240.0,
1160.0,
910.0,
820.0,
680.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"search_bar_1_feasible",
"mails_1_feasible",
"main_2_collom_feasible",
"right_2_collom_feasible",
},
{
"search_bar_1_feasible",
"mails_1_feasible",
"main_2_collom_feasible",
"right_1_collom_feasible",
},
{
"search_bar_2_feasible",
"mails_1_feasible",
"main_2_collom_feasible",
"right_1_collom_feasible",
},
{
"search_bar_2_feasible",
"mails_2_feasible",
"main_2_collom_feasible",
"right_1_collom_feasible",
},
{
"search_bar_2_feasible",
"mails_2_feasible",
"main_1_collom_feasible",
},
};
