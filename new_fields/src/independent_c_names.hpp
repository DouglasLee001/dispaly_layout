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
};
const std::vector<double> right_bound{
4000.0,
1110.0,
940.0,
770.0,
470.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"wide_feasible",
"soft_var0",
"soft_var1",
},
{
"horizon_feasible",
"soft_var0",
},
{
"horizon_feasible",
"soft_var1",
},
{
"vertical_feasible",
"soft_var0",
"soft_var1",
},
};
