169
0 true
1 ( >= BC_width 0.0 )
2 ( >= BC_hight 0.0 )
3 ( <= BC_width 4000.0 )
4 ( <= BC_x 0.0 )
5 ( >= BC_x 0.0 )
6 ( <= BC_y 0.0 )
7 ( >= BC_y 0.0 )
8 BC_feasible
9 ( >= back_ground_y 0.0 )
10 ( >= back_ground_width 0.0 )
11 ( >= cavas_x 0.0 )
12 ( >= cavas_y 0.0 )
13 ( >= cavas_width 0.0 )
14 ( >= cavas_hight 0.0 )
15 ( <= ( + cavas_hight cavas_y ( * -1.0 back_ground_y ) ) 700.0 )
16 ( <= back_ground_x 0.0 )
17 ( >= back_ground_x 0.0 )
18 ( <= ( + back_ground_width ( * -1.0 BC_width ) ) 0.0 )
19 ( >= ( + back_ground_width ( * -1.0 BC_width ) ) 0.0 )
20 ( <= ( + cavas_x ( * -1.0 back_ground_x ) ) 50.0 )
21 ( >= ( + cavas_x ( * -1.0 back_ground_x ) ) 50.0 )
22 ( <= ( + cavas_x cavas_width ( * -1.0 back_ground_x ) ( * -1.0 back_ground_width ) ) -50.0 )
23 ( >= ( + cavas_x cavas_width ( * -1.0 back_ground_x ) ( * -1.0 back_ground_width ) ) -50.0 )
24 ( <= ( + cavas_y ( * -1.0 back_ground_y ) ) 50.0 )
25 ( >= ( + cavas_y ( * -1.0 back_ground_y ) ) 50.0 )
26 ( <= ( + cavas_hight cavas_y ( * -1.0 back_ground_y ) ) 650.0 )
27 ( >= ( + cavas_hight cavas_y ( * -1.0 back_ground_y ) ) 650.0 )
28 ( <= back_ground_hight 700.0 )
29 ( >= back_ground_hight 700.0 )
30 ( >= holder_x 0.0 )
31 ( >= holder_y 0.0 )
32 ( >= holder_width 0.0 )
33 ( >= holder_hight 0.0 )
34 ( <= ( + holder_x ( * -1.0 cavas_x ) ) 10.0 )
35 ( >= ( + holder_x ( * -1.0 cavas_x ) ) 10.0 )
36 ( <= ( + holder_width holder_x ( * -1.0 cavas_x ) ( * -1.0 cavas_width ) ) -10.0 )
37 ( >= ( + holder_width holder_x ( * -1.0 cavas_x ) ( * -1.0 cavas_width ) ) -10.0 )
38 ( <= ( + holder_y ( * -1.0 cavas_y ) ) 10.0 )
39 ( >= ( + holder_y ( * -1.0 cavas_y ) ) 10.0 )
40 ( <= ( + holder_hight holder_y ( * -1.0 cavas_hight ) ( * -1.0 cavas_y ) ) -10.0 )
41 ( >= ( + holder_hight holder_y ( * -1.0 cavas_hight ) ( * -1.0 cavas_y ) ) -10.0 )
42 ( >= horizon_x 0.0 )
43 ( >= horizon_y 0.0 )
44 ( >= horizon_width 0.0 )
45 ( >= horizon_hight 0.0 )
46 ( >= vertical_x 0.0 )
47 ( >= vertical_y 0.0 )
48 ( >= vertical_width 0.0 )
49 ( >= vertical_hight 0.0 )
50 horizon_feasible
51 ( <= ( + horizon_x ( * -1.0 holder_x ) ) 0.0 )
52 ( >= ( + horizon_x ( * -1.0 holder_x ) ) 0.0 )
53 ( <= ( + horizon_width horizon_x ( * -1.0 holder_width ) ( * -1.0 holder_x ) ) 0.0 )
54 ( >= ( + horizon_width horizon_x ( * -1.0 holder_width ) ( * -1.0 holder_x ) ) 0.0 )
55 ( <= ( + horizon_y ( * -1.0 holder_y ) ) 0.0 )
56 ( >= ( + horizon_y ( * -1.0 holder_y ) ) 0.0 )
57 ( <= ( + horizon_y horizon_hight ( * -1.0 holder_hight ) ( * -1.0 holder_y ) ) 0.0 )
58 ( >= ( + horizon_y horizon_hight ( * -1.0 holder_hight ) ( * -1.0 holder_y ) ) 0.0 )
59 vertical_feasible
60 ( <= ( + vertical_x ( * -1.0 holder_x ) ) 0.0 )
61 ( >= ( + vertical_x ( * -1.0 holder_x ) ) 0.0 )
62 ( <= ( + holder_width ( * -1.0 vertical_x ) holder_x ( * -1.0 vertical_width ) ) 0.0 )
63 ( >= ( + holder_width ( * -1.0 vertical_x ) holder_x ( * -1.0 vertical_width ) ) 0.0 )
64 ( <= ( + vertical_y ( * -1.0 holder_y ) ) 0.0 )
65 ( >= ( + vertical_y ( * -1.0 holder_y ) ) 0.0 )
66 ( <= ( + holder_hight ( * -1.0 vertical_y ) ( * -1.0 vertical_hight ) holder_y ) 0.0 )
67 ( >= ( + holder_hight ( * -1.0 vertical_y ) ( * -1.0 vertical_hight ) holder_y ) 0.0 )
68 ( >= massage_x 0.0 )
69 ( >= massage_y 0.0 )
70 ( >= massage_hight 0.0 )
71 ( >= follow_x 0.0 )
72 ( >= follow_y 0.0 )
73 ( >= follow_hight 0.0 )
74 ( >= following_x 0.0 )
75 ( >= following_y 0.0 )
76 ( >= following_hight 0.0 )
77 ( >= followers_x 0.0 )
78 ( >= followers_y 0.0 )
79 ( >= followers_hight 0.0 )
80 ( <= massage_width 100.0 )
81 ( >= massage_width 100.0 )
82 ( <= follow_width 100.0 )
83 ( >= follow_width 100.0 )
84 ( <= following_width 100.0 )
85 ( >= following_width 100.0 )
86 ( <= followers_width 100.0 )
87 ( >= followers_width 100.0 )
88 ( >= horizon_up_x 0.0 )
89 ( >= horizon_up_y 0.0 )
90 ( >= horizon_up_width 0.0 )
91 ( >= horizon_up_hight 0.0 )
92 ( >= horizon_down_x 0.0 )
93 ( >= horizon_down_y 0.0 )
94 ( >= horizon_down_width 0.0 )
95 ( <= ( + horizon_x ( * -1.0 horizon_up_x ) ) 0.0 )
96 ( >= ( + horizon_width horizon_x ( * -1.0 horizon_up_width ) ( * -1.0 horizon_up_x ) ) 0.0 )
97 ( >= ( + horizon_up_y ( * -1.0 horizon_y ) ) 0.0 )
98 ( <= ( + horizon_up_y horizon_up_hight ( * -1.0 horizon_y ) ( * -1.0 horizon_hight ) ) 0.0 )
99 ( >= ( + horizon_down_x ( * -1.0 horizon_x ) ) 0.0 )
100 ( <= ( + horizon_down_x horizon_down_width ( * -1.0 horizon_width ) ( * -1.0 horizon_x ) ) 0.0 )
101 ( >= ( + horizon_down_y ( * -1.0 horizon_y ) ) 0.0 )
102 ( <= ( + horizon_down_y ( * -1.0 horizon_y ) ( * -1.0 horizon_hight ) ) -100.0 )
103 ( >= ( + horizon_down_y ( * -1.0 horizon_up_y ) ( * -1.0 horizon_up_hight ) ) 0.0 )
104 ( >= ( + horizon_x ( * -1.0 horizon_up_x ) ) 0.0 )
105 ( <= ( + horizon_down_x ( * -1.0 horizon_x ) ) 0.0 )
106 ( <= ( + horizon_width horizon_x ( * -1.0 horizon_up_width ) ( * -1.0 horizon_up_x ) ) 0.0 )
107 ( >= ( + horizon_down_x horizon_down_width ( * -1.0 horizon_width ) ( * -1.0 horizon_x ) ) 0.0 )
108 ( <= ( + horizon_up_y ( * -1.0 horizon_y ) ) 0.0 )
109 ( >= ( + horizon_down_y ( * -1.0 horizon_y ) ( * -1.0 horizon_hight ) ) -100.0 )
110 ( <= ( + horizon_down_y ( * -1.0 horizon_up_y ) ( * -1.0 horizon_up_hight ) ) 0.0 )
111 horizon_down_feasible
112 ( <= ( + horizon_down_x ( * -1.0 massage_x ) ) 0.0 )
113 ( >= ( + horizon_down_x horizon_down_width ( * -1.0 massage_x ) ) 100.0 )
114 ( <= ( + horizon_down_y ( * -1.0 massage_y ) ) 0.0 )
115 ( >= ( + horizon_down_y ( * -1.0 massage_y ) ( * -1.0 massage_hight ) ) -100.0 )
116 ( <= ( + horizon_down_x ( * -1.0 follow_x ) ) 0.0 )
117 ( >= ( + horizon_down_x horizon_down_width ( * -1.0 follow_x ) ) 100.0 )
118 ( <= ( + horizon_down_y ( * -1.0 follow_y ) ) 0.0 )
119 ( >= ( + horizon_down_y ( * -1.0 follow_y ) ( * -1.0 follow_hight ) ) -100.0 )
120 ( >= ( + following_x ( * -1.0 horizon_down_x ) ) 0.0 )
121 ( <= ( + following_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -100.0 )
122 ( <= ( + horizon_down_y ( * -1.0 following_y ) ) 0.0 )
123 ( >= ( + horizon_down_y ( * -1.0 following_hight ) ( * -1.0 following_y ) ) -100.0 )
124 ( >= ( + followers_x ( * -1.0 horizon_down_x ) ) 0.0 )
125 ( <= ( + followers_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -100.0 )
126 ( <= ( + horizon_down_y ( * -1.0 followers_y ) ) 0.0 )
127 ( >= ( + horizon_down_y ( * -1.0 followers_y ) ( * -1.0 followers_hight ) ) -100.0 )
128 ( >= ( + follow_x ( * -1.0 massage_x ) ) 100.0 )
129 ( >= ( + following_x ( * -1.0 follow_x ) ) 100.0 )
130 ( >= ( + followers_x ( * -1.0 following_x ) ) 100.0 )
131 ( <= ( + horizon_down_x ( * -1.0 massage_x ) ) -10.0 )
132 ( >= ( + horizon_down_x ( * -1.0 massage_x ) ) -10.0 )
133 ( <= ( + followers_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -110.0 )
134 ( >= ( + followers_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -110.0 )
135 ( <= ( + horizon_down_y ( * -1.0 massage_y ) ) -10.0 )
136 ( >= ( + horizon_down_y ( * -1.0 massage_y ) ) -10.0 )
137 ( <= ( + horizon_down_y ( * -1.0 follow_y ) ) -10.0 )
138 ( >= ( + horizon_down_y ( * -1.0 follow_y ) ) -10.0 )
139 ( <= ( + horizon_down_y ( * -1.0 following_y ) ) -10.0 )
140 ( >= ( + horizon_down_y ( * -1.0 following_y ) ) -10.0 )
141 ( <= ( + horizon_down_y ( * -1.0 followers_y ) ) -10.0 )
142 ( >= ( + horizon_down_y ( * -1.0 followers_y ) ) -10.0 )
143 ( <= ( + horizon_down_y ( * -1.0 massage_y ) ( * -1.0 massage_hight ) ) -90.0 )
144 ( >= ( + horizon_down_y ( * -1.0 massage_y ) ( * -1.0 massage_hight ) ) -90.0 )
145 ( <= ( + horizon_down_y ( * -1.0 follow_y ) ( * -1.0 follow_hight ) ) -90.0 )
146 ( >= ( + horizon_down_y ( * -1.0 follow_y ) ( * -1.0 follow_hight ) ) -90.0 )
147 ( <= ( + horizon_down_y ( * -1.0 following_hight ) ( * -1.0 following_y ) ) -90.0 )
148 ( >= ( + horizon_down_y ( * -1.0 following_hight ) ( * -1.0 following_y ) ) -90.0 )
149 ( <= ( + horizon_down_y ( * -1.0 followers_y ) ( * -1.0 followers_hight ) ) -90.0 )
150 ( >= ( + horizon_down_y ( * -1.0 followers_y ) ( * -1.0 followers_hight ) ) -90.0 )
151 ( <= horizon_down_hight 100.0 )
152 ( >= horizon_down_hight 100.0 )
153 ( >= ( + follow_x ( * -1.0 massage_x ) ) 150.0 )
154 ( >= ( + following_x ( * -1.0 follow_x ) ) 150.0 )
155 ( >= ( + followers_x ( * -1.0 following_x ) ) 150.0 )
156 soft_var0
157 ( <= ( + ( * 2.0 horizon_down_x ) horizon_down_width ( * -2.0 follow_x ) ) 100.0 )
158 ( >= ( + ( * 2.0 horizon_down_x ) horizon_down_width ( * -2.0 follow_x ) ) 100.0 )
159 or bool_new_var0 -157 -158
160 ( <= ( + followers_x ( * -1.0 following_x ) ) 150.0 )
161 back_ground_feasible
162 cavas_feasible
163 holder_feasible
164 massage_feasible
165 follow_feasible
166 following_feasible
167 followers_feasible
168 horizon_up_feasible
0
186
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
( 31 )
( 32 )
( 33 )
( 34 )
( 35 )
( 36 )
( 37 )
( 38 )
( 39 )
( 40 )
( 41 )
( 42 )
( 43 )
( 44 )
( 45 )
( 46 )
( 47 )
( 48 )
( 49 )
( -50 51 )
( -50 52 )
( -50 53 )
( -50 54 )
( -50 55 )
( -50 56 )
( -50 57 )
( -50 58 )
( -59 60 )
( -59 61 )
( -59 62 )
( -59 63 )
( -59 64 )
( -59 65 )
( -59 66 )
( -59 67 )
( 50 59 )
( -50 -59 )
( 68 )
( 69 )
( 70 )
( 71 )
( 72 )
( 73 )
( 74 )
( 75 )
( 76 )
( 77 )
( 78 )
( 79 )
( 80 )
( 81 )
( 82 )
( 83 )
( 84 )
( 85 )
( 86 )
( 87 )
( 88 )
( 89 )
( 90 )
( 91 )
( 92 )
( 93 )
( 94 )
( -50 95 )
( -50 96 )
( -50 97 )
( -50 98 )
( -50 99 )
( -50 100 )
( -50 101 )
( -50 102 )
( -50 103 )
( -50 95 )
( -50 104 )
( -50 105 )
( -50 99 )
( -50 106 )
( -50 96 )
( -50 100 )
( -50 107 )
( -50 108 )
( -50 97 )
( -50 102 )
( -50 109 )
( -50 110 )
( -50 103 )
( -111 112 )
( -111 113 )
( -111 114 )
( -111 115 )
( -111 116 )
( -111 117 )
( -111 118 )
( -111 119 )
( -111 120 )
( -111 121 )
( -111 122 )
( -111 123 )
( -111 124 )
( -111 125 )
( -111 126 )
( -111 127 )
( -111 128 )
( -111 129 )
( -111 130 )
( -111 131 )
( -111 132 )
( -111 133 )
( -111 134 )
( -111 135 )
( -111 136 )
( -111 137 )
( -111 138 )
( -111 139 )
( -111 140 )
( -111 141 )
( -111 142 )
( -111 143 )
( -111 144 )
( -111 145 )
( -111 146 )
( -111 147 )
( -111 148 )
( -111 149 )
( -111 150 )
( 151 )
( 152 )
( 105 -111 )
( 99 -111 )
( 100 -111 )
( 107 -111 )
( -111 153 )
( -111 154 )
( -111 155 )
( 157 159 )
( 158 159 )
( -157 -158 -159 )
( -50 -156 -159 )
( -111 160 )
( -111 155 )
( 161 )
( 162 )
( 163 )
( 111 -164 )
( -111 164 )
( 111 -165 )
( -111 165 )
( 111 -166 )
( -111 166 )
( 111 -167 )
( -111 167 )
( 50 -168 )
( -50 168 )
( 50 -111 )
( -50 111 )
sat
