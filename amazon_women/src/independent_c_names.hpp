#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
"title_bg",
"back_top",
"spring_edit",
"spring_edit_thin",
"basic_right_bottom",
"basic_right_pic",
};

const std::vector<bool> belong_to_right{
true,
true,
true,
};
const std::vector<double> right_bound{
4000.0,
1220.0,
920.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"spring_edit_feasible",
"basic_right_pic_feasible",
},
{
"spring_edit_thin_feasible",
"basic_right_pic_thin_feasible",
},
};
