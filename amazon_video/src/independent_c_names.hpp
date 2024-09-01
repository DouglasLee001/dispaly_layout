#include <vector>
#include <string>
std::vector<std::string> soft_c_names = {
"info",
"search",
"buttons",
"video_1",
"video_2",
"video_3",
"ads_top_1",
"ads_top_2",
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
787.2727272727273,
700.0,
640.0,
630.0,
};
const std::vector<std::vector<std::string>> soft_constraints = {
{
"ads_pics_feasible",
"ads_top_1_feasible",
},
{
"ads_pics_2_feasible",
"ads_top_1_feasible",
},
{
"ads_pics_3_feasible",
"ads_top_1_feasible",
},
{
"ads_pics_3_feasible",
"ads_top_2_feasible",
},
};
