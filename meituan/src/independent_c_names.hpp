#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
"main_news",
"icons",
"home_pages",
"downloads",
"mt_lists",
"mt_list2",
"pics_content_0_title",
"pics_content_1_title",
"pics_content_2_title",
"pics_content_3_title",
"pics_content_4_title",
"pics_content_5_title",
"pics_content_6_title",
"pics_content_7_title",
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
1410.0,
940.0,
860.0,
680.0,
270.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"wide_title_feasible",
"main_title_1_feasible",
"main_pic_1_feasible",
"mt_bottom_0_feasible",
},
{
"thin_title_feasible",
"main_title_1_feasible",
"main_pic_1_feasible",
"mt_bottom_0_feasible",
},
{
"thin_title_feasible",
"main_title_1_feasible",
"main_pic_1_feasible",
"mt_bottom_1_feasible",
},
{
"thin_title_feasible",
"main_title_2_feasible",
"main_pic_1_feasible",
"mt_bottom_1_feasible",
},
{
"thin_title_feasible",
"main_title_2_feasible",
"main_pic_2_feasible",
"mt_bottom_1_feasible",
},
};
