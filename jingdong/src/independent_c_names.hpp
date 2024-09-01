#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
"title_top",
"title_bar",
"select",
"welcome_kid_0",
"welcome_kid_1",
"welcome_kid_2",
"welcome_kid_3",
};

const std::vector<bool> belong_to_right{
false,
true,
false,
};
const std::vector<double> right_bound{
4000.0,
1170.0,
1050.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"ads_feasible",
},
{
"ads2_feasible",
},
};
