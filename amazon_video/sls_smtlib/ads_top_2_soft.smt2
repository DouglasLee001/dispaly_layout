118
0 true
1 ( >= menus_width 0.0 )
2 ( >= menus_hight 0.0 )
3 ( >= homes_y 0.0 )
4 ( >= homes_width 0.0 )
5 ( >= homes_hight 0.0 )
6 ( <= ( + menus_hight ( * -1.0 ads_top_2_hight ) ) 0.0 )
7 ( <= menus_x 0.0 )
8 ( >= menus_x 0.0 )
9 ( <= homes_x 0.0 )
10 ( >= homes_x 0.0 )
11 ( <= ( + menus_x menus_width ( * -1.0 ads_top_2_width ) ) 0.0 )
12 ( >= ( + menus_x menus_width ( * -1.0 ads_top_2_width ) ) 0.0 )
13 ( <= ( + homes_x homes_width ( * -1.0 ads_top_2_width ) ) 0.0 )
14 ( >= ( + homes_x homes_width ( * -1.0 ads_top_2_width ) ) 0.0 )
15 ( <= menus_y 0.0 )
16 ( >= menus_y 0.0 )
17 ( <= ( + homes_hight homes_y ( * -1.0 ads_top_2_hight ) ) 0.0 )
18 ( >= ( + homes_hight homes_y ( * -1.0 ads_top_2_hight ) ) 0.0 )
19 ( <= ( + homes_y ( * -1.0 menus_hight ) ( * -1.0 menus_y ) ) 0.0 )
20 ( >= ( + homes_y ( * -1.0 menus_hight ) ( * -1.0 menus_y ) ) 0.0 )
21 ( <= ( + homes_hight ( * -1.0 menus_hight ) ) 0.0 )
22 ( >= ( + homes_hight ( * -1.0 menus_hight ) ) 0.0 )
23 ( >= menus_kid_0_x 0.0 )
24 ( >= menus_kid_0_y 0.0 )
25 ( >= menus_kid_0_width 0.0 )
26 ( >= menus_kid_0_hight 0.0 )
27 ( >= menus_kid_1_x 0.0 )
28 ( >= menus_kid_1_y 0.0 )
29 ( >= menus_kid_1_width 0.0 )
30 ( >= menus_kid_1_hight 0.0 )
31 menus_feasible
32 ( <= ( + menus_x ( * -1.0 menus_kid_0_x ) ) -10.0 )
33 ( <= ( + menus_kid_0_width ( * -1.0 menus_x ) ( * -1.0 menus_width ) menus_kid_0_x ) -10.0 )
34 ( <= ( + menus_y ( * -1.0 menus_kid_0_y ) ) -10.0 )
35 ( >= ( + menus_hight menus_y ( * -1.0 menus_kid_0_y ) ( * -1.0 menus_kid_0_hight ) ) 10.0 )
36 ( >= ( + menus_kid_1_x ( * -1.0 menus_x ) ) 10.0 )
37 ( <= ( + menus_kid_1_width menus_kid_1_x ( * -1.0 menus_x ) ( * -1.0 menus_width ) ) -10.0 )
38 ( >= ( + menus_kid_1_y ( * -1.0 menus_y ) ) 10.0 )
39 ( >= ( + menus_hight ( * -1.0 menus_kid_1_y ) ( * -1.0 menus_kid_1_hight ) menus_y ) 10.0 )
40 ( <= ( + menus_kid_0_width ( * -1.0 menus_kid_1_x ) menus_kid_0_x ) 0.0 )
41 ( >= ( + menus_y ( * -1.0 menus_kid_0_y ) ) -10.0 )
42 ( <= ( + menus_hight menus_y ( * -1.0 menus_kid_0_y ) ( * -1.0 menus_kid_0_hight ) ) 10.0 )
43 ( <= ( + menus_kid_1_y ( * -1.0 menus_y ) ) 10.0 )
44 ( <= ( + menus_hight ( * -1.0 menus_kid_1_y ) ( * -1.0 menus_kid_1_hight ) menus_y ) 10.0 )
45 ( >= ( + menus_x ( * -1.0 menus_kid_0_x ) ) -10.0 )
46 ( <= ( + menus_kid_1_width ( * 2.0 menus_kid_1_x ) ( * -2.0 menus_x ) ( * -1.0 menus_width ) ) 0.0 )
47 ( >= ( + menus_kid_1_width ( * 2.0 menus_kid_1_x ) ( * -2.0 menus_x ) ( * -1.0 menus_width ) ) 0.0 )
48 ( <= ( + menus_kid_0_width ( * -1.0 menus_kid_1_width ) ) 0.0 )
49 ( >= ( + menus_kid_0_width ( * -1.0 menus_kid_1_width ) ) 0.0 )
50 ( <= menus_kid_0_width 100.0 )
51 ( >= menus_kid_0_width 100.0 )
52 ( >= homes_kid_0_x 0.0 )
53 ( >= homes_kid_0_y 0.0 )
54 ( >= homes_kid_0_width 0.0 )
55 ( >= homes_kid_0_hight 0.0 )
56 ( >= homes_kid_1_x 0.0 )
57 ( >= homes_kid_1_y 0.0 )
58 ( >= homes_kid_1_width 0.0 )
59 ( >= homes_kid_1_hight 0.0 )
60 ( >= homes_kid_2_x 0.0 )
61 ( >= homes_kid_2_y 0.0 )
62 ( >= homes_kid_2_width 0.0 )
63 ( >= homes_kid_2_hight 0.0 )
64 ( >= homes_kid_3_x 0.0 )
65 ( >= homes_kid_3_y 0.0 )
66 ( >= homes_kid_3_width 0.0 )
67 ( >= homes_kid_3_hight 0.0 )
68 homes_feasible
69 ( >= ( + homes_kid_0_x ( * -1.0 homes_x ) ) 10.0 )
70 ( <= ( + homes_kid_0_width homes_kid_0_x ( * -1.0 homes_x ) ( * -1.0 homes_width ) ) -10.0 )
71 ( <= ( + homes_y ( * -1.0 homes_kid_0_y ) ) -10.0 )
72 ( >= ( + homes_hight homes_y ( * -1.0 homes_kid_0_y ) ( * -1.0 homes_kid_0_hight ) ) 10.0 )
73 ( >= ( + homes_kid_1_x ( * -1.0 homes_x ) ) 10.0 )
74 ( <= ( + homes_kid_1_x homes_kid_1_width ( * -1.0 homes_x ) ( * -1.0 homes_width ) ) -10.0 )
75 ( <= ( + homes_y ( * -1.0 homes_kid_1_y ) ) -10.0 )
76 ( >= ( + homes_hight homes_y ( * -1.0 homes_kid_1_y ) ( * -1.0 homes_kid_1_hight ) ) 10.0 )
77 ( >= ( + homes_kid_2_x ( * -1.0 homes_x ) ) 10.0 )
78 ( <= ( + homes_kid_2_x homes_kid_2_width ( * -1.0 homes_x ) ( * -1.0 homes_width ) ) -10.0 )
79 ( <= ( + homes_y ( * -1.0 homes_kid_2_y ) ) -10.0 )
80 ( >= ( + homes_hight homes_y ( * -1.0 homes_kid_2_hight ) ( * -1.0 homes_kid_2_y ) ) 10.0 )
81 ( >= ( + homes_kid_3_x ( * -1.0 homes_x ) ) 10.0 )
82 ( <= ( + homes_kid_3_x ( * -1.0 homes_x ) homes_kid_3_width ( * -1.0 homes_width ) ) -10.0 )
83 ( >= ( + homes_kid_3_y ( * -1.0 homes_y ) ) 10.0 )
84 ( >= ( + homes_hight ( * -1.0 homes_kid_3_hight ) ( * -1.0 homes_kid_3_y ) homes_y ) 10.0 )
85 ( >= ( + homes_kid_1_x ( * -1.0 homes_kid_0_width ) ( * -1.0 homes_kid_0_x ) ) 0.0 )
86 ( >= ( + homes_kid_2_x ( * -1.0 homes_kid_1_x ) ( * -1.0 homes_kid_1_width ) ) 0.0 )
87 ( >= ( + homes_kid_3_x ( * -1.0 homes_kid_2_x ) ( * -1.0 homes_kid_2_width ) ) 0.0 )
88 ( <= ( + homes_kid_1_width ( * -1.0 homes_kid_0_width ) ) 0.0 )
89 ( >= ( + homes_kid_1_width ( * -1.0 homes_kid_0_width ) ) 0.0 )
90 ( <= ( + homes_kid_2_width ( * -1.0 homes_kid_0_width ) ) 0.0 )
91 ( >= ( + homes_kid_2_width ( * -1.0 homes_kid_0_width ) ) 0.0 )
92 ( <= ( + homes_kid_0_width ( * -1.0 homes_kid_3_width ) ) 0.0 )
93 ( >= ( + homes_kid_0_width ( * -1.0 homes_kid_3_width ) ) 0.0 )
94 ( <= homes_kid_0_width 100.0 )
95 ( >= homes_kid_0_width 100.0 )
96 ( >= ( + homes_y ( * -1.0 homes_kid_0_y ) ) -10.0 )
97 ( <= ( + homes_hight homes_y ( * -1.0 homes_kid_0_y ) ( * -1.0 homes_kid_0_hight ) ) 10.0 )
98 ( >= ( + homes_y ( * -1.0 homes_kid_1_y ) ) -10.0 )
99 ( <= ( + homes_hight homes_y ( * -1.0 homes_kid_1_y ) ( * -1.0 homes_kid_1_hight ) ) 10.0 )
100 ( >= ( + homes_y ( * -1.0 homes_kid_2_y ) ) -10.0 )
101 ( <= ( + homes_hight homes_y ( * -1.0 homes_kid_2_hight ) ( * -1.0 homes_kid_2_y ) ) 10.0 )
102 ( <= ( + homes_kid_3_y ( * -1.0 homes_y ) ) 10.0 )
103 ( <= ( + homes_hight ( * -1.0 homes_kid_3_hight ) ( * -1.0 homes_kid_3_y ) homes_y ) 10.0 )
104 ( <= ( + homes_kid_0_x ( * -1.0 homes_x ) ) 10.0 )
105 ( <= ( + homes_kid_1_x ( * -1.0 homes_kid_0_width ) ( * -1.0 homes_kid_0_x ) ) 10.0 )
106 ( >= ( + homes_kid_1_x ( * -1.0 homes_kid_0_width ) ( * -1.0 homes_kid_0_x ) ) 10.0 )
107 ( <= ( + homes_kid_2_x ( * -1.0 homes_kid_1_x ) ( * -1.0 homes_kid_1_width ) ) 10.0 )
108 ( >= ( + homes_kid_2_x ( * -1.0 homes_kid_1_x ) ( * -1.0 homes_kid_1_width ) ) 10.0 )
109 ( <= ( + homes_kid_3_x ( * -1.0 homes_kid_2_x ) ( * -1.0 homes_kid_2_width ) ) 10.0 )
110 ( >= ( + homes_kid_3_x ( * -1.0 homes_kid_2_x ) ( * -1.0 homes_kid_2_width ) ) 10.0 )
111 menus_kid_0_feasible
112 menus_kid_1_feasible
113 homes_kid_0_feasible
114 homes_kid_1_feasible
115 homes_kid_2_feasible
116 homes_kid_3_feasible
117 ads_top_2_feasible
0
137
( 1 )
( 2 )
( 3 )
( 4 )
( 5 )
( 6 )
( 7 )
( 8 )
( 9 )
( 10 )
( 11 )
( 12 )
( 13 )
( 14 )
( 15 )
( 16 )
( 17 )
( 18 )
( 19 )
( 20 )
( 21 )
( 22 )
( 23 )
( 24 )
( 25 )
( 26 )
( 27 )
( 28 )
( 29 )
( 30 )
( -31 32 )
( -31 33 )
( -31 34 )
( -31 35 )
( -31 36 )
( -31 37 )
( -31 38 )
( -31 39 )
( -31 40 )
( -31 34 )
( -31 41 )
( -31 42 )
( -31 35 )
( -31 43 )
( -31 38 )
( -31 44 )
( -31 39 )
( -31 32 )
( -31 45 )
( -31 46 )
( -31 47 )
( -31 48 )
( -31 49 )
( -31 50 )
( -31 51 )
( 52 )
( 53 )
( 54 )
( 55 )
( 56 )
( 57 )
( 58 )
( 59 )
( 60 )
( 61 )
( 62 )
( 63 )
( 64 )
( 65 )
( 66 )
( 67 )
( -68 69 )
( -68 70 )
( -68 71 )
( -68 72 )
( -68 73 )
( -68 74 )
( -68 75 )
( -68 76 )
( -68 77 )
( -68 78 )
( -68 79 )
( -68 80 )
( -68 81 )
( -68 82 )
( -68 83 )
( -68 84 )
( -68 85 )
( -68 86 )
( -68 87 )
( -68 88 )
( -68 89 )
( -68 90 )
( -68 91 )
( -68 92 )
( -68 93 )
( -68 94 )
( -68 95 )
( -68 71 )
( -68 96 )
( -68 97 )
( -68 72 )
( -68 75 )
( -68 98 )
( -68 99 )
( -68 76 )
( -68 79 )
( -68 100 )
( -68 101 )
( -68 80 )
( -68 102 )
( -68 83 )
( -68 103 )
( -68 84 )
( -68 104 )
( -68 69 )
( -68 105 )
( -68 106 )
( -68 107 )
( -68 108 )
( -68 109 )
( -68 110 )
( 31 )
( 68 )
( 31 -111 )
( 111 111 )
( 31 -112 )
( 112 112 )
( 68 -113 )
( 113 113 )
( 68 -114 )
( 114 114 )
( 68 -115 )
( 115 115 )
( 68 -116 )
( 116 116 )
( 117 )
sat