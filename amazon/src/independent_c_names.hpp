#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
"search",
"bottom",
"tbl4_kid_0",
"tbl4_kid_1",
"tbl4_kid_2",
"tbl4_kid_3",
"tbl4_kid_4",
"tbl4_kid_5",
"tbl4_kid_6",
"tbl4_kid_7",
};

const std::vector<bool> belong_to_right{
false,
true,
false,
};
const std::vector<double> right_bound{
4000.0,
1050.0,
720.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"tbl4_feasible",
},
{
"tbl3_feasible",
},
};
