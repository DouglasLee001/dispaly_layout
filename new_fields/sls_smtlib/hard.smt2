277
0 true
1 ( >= BC_width 0.0 )
2 ( >= BC_hight 0.0 )
3 ( <= BC_width 4000.0 )
4 ( <= BC_x 0.0 )
5 ( >= BC_x 0.0 )
6 ( <= BC_y 0.0 )
7 ( >= BC_y 0.0 )
8 BC_feasible
9 ( >= back_ground_width 0.0 )
10 ( >= cavas_x 0.0 )
11 ( >= cavas_width 0.0 )
12 ( >= cavas_hight 0.0 )
13 ( >= cavas_y 0.0 )
14 ( <= ( + cavas_y cavas_hight ) 900.0 )
15 ( <= back_ground_x 0.0 )
16 ( >= back_ground_x 0.0 )
17 ( <= ( + back_ground_width ( * -1.0 BC_width ) ) 0.0 )
18 ( >= ( + back_ground_width ( * -1.0 BC_width ) ) 0.0 )
19 ( <= ( + cavas_x ( * -1.0 back_ground_x ) ) 50.0 )
20 ( >= ( + cavas_x ( * -1.0 back_ground_x ) ) 50.0 )
21 ( <= ( + cavas_width cavas_x ( * -1.0 back_ground_x ) ( * -1.0 back_ground_width ) ) -50.0 )
22 ( >= ( + cavas_width cavas_x ( * -1.0 back_ground_x ) ( * -1.0 back_ground_width ) ) -50.0 )
23 ( <= cavas_y 50.0 )
24 ( >= cavas_y 50.0 )
25 ( <= ( + cavas_y cavas_hight ) 850.0 )
26 ( >= ( + cavas_y cavas_hight ) 850.0 )
27 ( <= back_ground_hight 900.0 )
28 ( >= back_ground_hight 900.0 )
29 ( <= back_ground_y 0.0 )
30 ( >= back_ground_y 0.0 )
31 ( >= holder_x 0.0 )
32 ( >= holder_y 0.0 )
33 ( >= holder_width 0.0 )
34 ( >= holder_hight 0.0 )
35 ( <= ( + holder_x ( * -1.0 cavas_x ) ) 10.0 )
36 ( >= ( + holder_x ( * -1.0 cavas_x ) ) 10.0 )
37 ( <= ( + holder_width holder_x ( * -1.0 cavas_width ) ( * -1.0 cavas_x ) ) -10.0 )
38 ( >= ( + holder_width holder_x ( * -1.0 cavas_width ) ( * -1.0 cavas_x ) ) -10.0 )
39 ( <= ( + holder_y ( * -1.0 cavas_y ) ) 10.0 )
40 ( >= ( + holder_y ( * -1.0 cavas_y ) ) 10.0 )
41 ( <= ( + holder_y holder_hight ( * -1.0 cavas_y ) ( * -1.0 cavas_hight ) ) -10.0 )
42 ( >= ( + holder_y holder_hight ( * -1.0 cavas_y ) ( * -1.0 cavas_hight ) ) -10.0 )
43 ( >= horizon_x 0.0 )
44 ( >= horizon_y 0.0 )
45 ( >= horizon_width 0.0 )
46 ( >= horizon_hight 0.0 )
47 ( >= vertical_x 0.0 )
48 ( >= vertical_y 0.0 )
49 ( >= vertical_width 0.0 )
50 ( >= vertical_hight 0.0 )
51 horizon_feasible
52 ( <= ( + horizon_x ( * -1.0 holder_x ) ) 0.0 )
53 ( >= ( + horizon_x ( * -1.0 holder_x ) ) 0.0 )
54 ( <= ( + horizon_x horizon_width ( * -1.0 holder_width ) ( * -1.0 holder_x ) ) 0.0 )
55 ( >= ( + horizon_x horizon_width ( * -1.0 holder_width ) ( * -1.0 holder_x ) ) 0.0 )
56 ( <= ( + horizon_y ( * -1.0 holder_y ) ) 0.0 )
57 ( >= ( + horizon_y ( * -1.0 holder_y ) ) 0.0 )
58 ( <= ( + horizon_y horizon_hight ( * -1.0 holder_y ) ( * -1.0 holder_hight ) ) 0.0 )
59 ( >= ( + horizon_y horizon_hight ( * -1.0 holder_y ) ( * -1.0 holder_hight ) ) 0.0 )
60 vertical_feasible
61 ( <= ( + vertical_x ( * -1.0 holder_x ) ) 0.0 )
62 ( >= ( + vertical_x ( * -1.0 holder_x ) ) 0.0 )
63 ( <= ( + vertical_x vertical_width ( * -1.0 holder_width ) ( * -1.0 holder_x ) ) 0.0 )
64 ( >= ( + vertical_x vertical_width ( * -1.0 holder_width ) ( * -1.0 holder_x ) ) 0.0 )
65 ( <= ( + vertical_y ( * -1.0 holder_y ) ) 0.0 )
66 ( >= ( + vertical_y ( * -1.0 holder_y ) ) 0.0 )
67 ( <= ( + vertical_y vertical_hight ( * -1.0 holder_y ) ( * -1.0 holder_hight ) ) 0.0 )
68 ( >= ( + vertical_y vertical_hight ( * -1.0 holder_y ) ( * -1.0 holder_hight ) ) 0.0 )
69 ( >= massage_x 0.0 )
70 ( >= massage_y 0.0 )
71 ( >= follow_x 0.0 )
72 ( >= follow_y 0.0 )
73 ( >= following_x 0.0 )
74 ( >= following_y 0.0 )
75 ( >= followers_x 0.0 )
76 ( >= followers_y 0.0 )
77 ( <= massage_width 100.0 )
78 ( >= massage_width 100.0 )
79 ( <= massage_hight 50.0 )
80 ( >= massage_hight 50.0 )
81 ( <= follow_width 100.0 )
82 ( >= follow_width 100.0 )
83 ( <= follow_hight 50.0 )
84 ( >= follow_hight 50.0 )
85 ( <= following_width 100.0 )
86 ( >= following_width 100.0 )
87 ( <= following_hight 50.0 )
88 ( >= following_hight 50.0 )
89 ( <= followers_width 100.0 )
90 ( >= followers_width 100.0 )
91 ( <= followers_hight 50.0 )
92 ( >= followers_hight 50.0 )
93 ( >= person_x 0.0 )
94 ( >= person_y 0.0 )
95 ( >= person_width 0.0 )
96 ( >= person_hight 0.0 )
97 ( >= person_icon_x 0.0 )
98 ( >= person_icon_y 0.0 )
99 ( <= person_icon_width 200.0 )
100 ( >= person_icon_width 200.0 )
101 ( <= person_icon_hight 200.0 )
102 ( >= person_icon_hight 200.0 )
103 ( >= person_name_x 0.0 )
104 ( >= person_name_y 0.0 )
105 ( <= person_name_width 350.0 )
106 ( >= person_name_width 350.0 )
107 ( <= person_name_hight 50.0 )
108 ( >= person_name_hight 50.0 )
109 ( >= horizon_up_x 0.0 )
110 ( >= horizon_up_y 0.0 )
111 ( >= horizon_up_width 0.0 )
112 ( >= horizon_up_hight 0.0 )
113 ( >= horizon_down_x 0.0 )
114 ( >= horizon_down_y 0.0 )
115 ( >= horizon_down_width 0.0 )
116 ( >= horizon_down_hight 0.0 )
117 ( >= ( + horizon_up_x ( * -1.0 horizon_x ) ) 0.0 )
118 ( <= ( + horizon_up_x horizon_up_width ( * -1.0 horizon_x ) ( * -1.0 horizon_width ) ) 0.0 )
119 ( >= ( + horizon_up_y ( * -1.0 horizon_y ) ) 0.0 )
120 ( <= ( + horizon_up_y horizon_up_hight ( * -1.0 horizon_y ) ( * -1.0 horizon_hight ) ) 0.0 )
121 ( >= ( + horizon_down_x ( * -1.0 horizon_x ) ) 0.0 )
122 ( <= ( + horizon_down_x horizon_down_width ( * -1.0 horizon_x ) ( * -1.0 horizon_width ) ) 0.0 )
123 ( >= ( + horizon_down_y ( * -1.0 horizon_y ) ) 0.0 )
124 ( <= ( + horizon_down_hight horizon_down_y ( * -1.0 horizon_y ) ( * -1.0 horizon_hight ) ) 0.0 )
125 ( <= ( + horizon_up_y horizon_up_hight ( * -1.0 horizon_down_y ) ) 0.0 )
126 ( <= ( + horizon_up_x ( * -1.0 horizon_x ) ) 0.0 )
127 ( <= ( + horizon_down_x ( * -1.0 horizon_x ) ) 0.0 )
128 ( >= ( + horizon_up_x horizon_up_width ( * -1.0 horizon_x ) ( * -1.0 horizon_width ) ) 0.0 )
129 ( >= ( + horizon_down_x horizon_down_width ( * -1.0 horizon_x ) ( * -1.0 horizon_width ) ) 0.0 )
130 ( <= ( + horizon_up_y ( * -1.0 horizon_y ) ) 0.0 )
131 ( >= ( + horizon_down_hight horizon_down_y ( * -1.0 horizon_y ) ( * -1.0 horizon_hight ) ) 0.0 )
132 ( >= ( + horizon_up_y horizon_up_hight ( * -1.0 horizon_down_y ) ) 0.0 )
133 horizon_down_feasible
134 ( >= ( + massage_x ( * -1.0 horizon_down_x ) ) 0.0 )
135 ( <= ( + massage_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -100.0 )
136 ( >= ( + massage_y ( * -1.0 horizon_down_y ) ) 0.0 )
137 ( <= ( + massage_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -50.0 )
138 ( >= ( + follow_x ( * -1.0 horizon_down_x ) ) 0.0 )
139 ( <= ( + follow_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -100.0 )
140 ( >= ( + follow_y ( * -1.0 horizon_down_y ) ) 0.0 )
141 ( <= ( + follow_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -50.0 )
142 ( >= ( + following_x ( * -1.0 horizon_down_x ) ) 0.0 )
143 ( <= ( + following_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -100.0 )
144 ( >= ( + following_y ( * -1.0 horizon_down_y ) ) 0.0 )
145 ( <= ( + following_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -50.0 )
146 ( >= ( + followers_x ( * -1.0 horizon_down_x ) ) 0.0 )
147 ( <= ( + followers_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -100.0 )
148 ( >= ( + followers_y ( * -1.0 horizon_down_y ) ) 0.0 )
149 ( <= ( + followers_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -50.0 )
150 ( >= ( + follow_x ( * -1.0 massage_x ) ) 100.0 )
151 ( <= ( + follow_x ( * -1.0 following_x ) ) -100.0 )
152 ( >= ( + followers_x ( * -1.0 following_x ) ) 100.0 )
153 ( <= ( + massage_x ( * -1.0 horizon_down_x ) ) 10.0 )
154 ( >= ( + massage_x ( * -1.0 horizon_down_x ) ) 10.0 )
155 ( <= ( + followers_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -110.0 )
156 ( >= ( + followers_x ( * -1.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -110.0 )
157 ( <= ( + massage_y ( * -1.0 horizon_down_y ) ) 10.0 )
158 ( >= ( + massage_y ( * -1.0 horizon_down_y ) ) 10.0 )
159 ( <= ( + follow_y ( * -1.0 horizon_down_y ) ) 10.0 )
160 ( >= ( + follow_y ( * -1.0 horizon_down_y ) ) 10.0 )
161 ( <= ( + following_y ( * -1.0 horizon_down_y ) ) 10.0 )
162 ( >= ( + following_y ( * -1.0 horizon_down_y ) ) 10.0 )
163 ( <= ( + followers_y ( * -1.0 horizon_down_y ) ) 10.0 )
164 ( >= ( + followers_y ( * -1.0 horizon_down_y ) ) 10.0 )
165 ( <= ( + massage_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -60.0 )
166 ( >= ( + massage_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -60.0 )
167 ( <= ( + follow_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -60.0 )
168 ( >= ( + follow_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -60.0 )
169 ( <= ( + following_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -60.0 )
170 ( >= ( + following_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -60.0 )
171 ( <= ( + followers_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -60.0 )
172 ( >= ( + followers_y ( * -1.0 horizon_down_hight ) ( * -1.0 horizon_down_y ) ) -60.0 )
173 ( >= ( + follow_x ( * -1.0 massage_x ) ) 150.0 )
174 ( <= ( + follow_x ( * -1.0 following_x ) ) -150.0 )
175 ( >= ( + followers_x ( * -1.0 following_x ) ) 150.0 )
176 soft_var0
177 ( <= ( + ( * 2.0 follow_x ) ( * -2.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -100.0 )
178 ( >= ( + ( * 2.0 follow_x ) ( * -2.0 horizon_down_x ) ( * -1.0 horizon_down_width ) ) -100.0 )
179 or bool_new_var0 -177 -178
180 soft_var1
181 ( >= ( + follow_x ( * -1.0 following_x ) ) -150.0 )
182 or bool_new_var1 -174 -181
183 ( <= ( + followers_x ( * -1.0 following_x ) ) 150.0 )
184 horizon_up_feasible
185 ( >= ( + person_x ( * -1.0 horizon_up_x ) ) 0.0 )
186 ( <= ( + person_x person_width ( * -1.0 horizon_up_x ) ( * -1.0 horizon_up_width ) ) 0.0 )
187 ( >= ( + person_y ( * -1.0 horizon_up_y ) ) 0.0 )
188 ( <= ( + person_y person_hight ( * -1.0 horizon_up_y ) ( * -1.0 horizon_up_hight ) ) 0.0 )
189 ( <= ( + ( * 2.0 person_y ) person_hight ( * -2.0 horizon_up_y ) ( * -1.0 horizon_up_hight ) ) 0.0 )
190 ( >= ( + ( * 2.0 person_y ) person_hight ( * -2.0 horizon_up_y ) ( * -1.0 horizon_up_hight ) ) 0.0 )
191 ( <= ( + ( * 2.0 person_x ) person_width ( * -2.0 horizon_up_x ) ( * -1.0 horizon_up_width ) ) 0.0 )
192 ( >= ( + ( * 2.0 person_x ) person_width ( * -2.0 horizon_up_x ) ( * -1.0 horizon_up_width ) ) 0.0 )
193 ( >= follow_flow_x 0.0 )
194 ( >= follow_flow_y 0.0 )
195 ( >= follow_flow_width 0.0 )
196 ( >= follow_flow_hight 0.0 )
197 ( >= ( + person_x ( * -1.0 vertical_x ) ) 0.0 )
198 ( <= ( + person_x person_width ( * -1.0 vertical_x ) ( * -1.0 vertical_width ) ) 0.0 )
199 ( >= ( + person_y ( * -1.0 vertical_y ) ) 0.0 )
200 ( <= ( + person_y person_hight ( * -1.0 vertical_y ) ( * -1.0 vertical_hight ) ) 0.0 )
201 ( >= ( + follow_flow_x ( * -1.0 vertical_x ) ) 0.0 )
202 ( <= ( + follow_flow_x follow_flow_width ( * -1.0 vertical_x ) ( * -1.0 vertical_width ) ) 0.0 )
203 ( >= ( + follow_flow_y ( * -1.0 vertical_y ) ) 0.0 )
204 ( <= ( + follow_flow_y follow_flow_hight ( * -1.0 vertical_y ) ( * -1.0 vertical_hight ) ) 0.0 )
205 ( <= ( + person_y person_hight ( * -1.0 follow_flow_y ) ) 0.0 )
206 ( <= ( + ( * 2.0 person_x ) person_width ( * -2.0 follow_flow_x ) ( * -1.0 follow_flow_width ) ) 0.0 )
207 ( >= ( + ( * 2.0 person_x ) person_width ( * -2.0 follow_flow_x ) ( * -1.0 follow_flow_width ) ) 0.0 )
208 ( <= ( + ( * 2.0 person_x ) person_width ( * -2.0 vertical_x ) ( * -1.0 vertical_width ) ) 0.0 )
209 ( >= ( + ( * 2.0 person_x ) person_width ( * -2.0 vertical_x ) ( * -1.0 vertical_width ) ) 0.0 )
210 ( <= ( + person_y person_hight ( * -1.0 follow_flow_y ) ) -20.0 )
211 ( >= ( + person_y person_hight ( * -1.0 follow_flow_y ) ) -20.0 )
212 ( <= ( + person_y follow_flow_y follow_flow_hight ( * -2.0 vertical_y ) ( * -1.0 vertical_hight ) ) 0.0 )
213 ( >= ( + person_y follow_flow_y follow_flow_hight ( * -2.0 vertical_y ) ( * -1.0 vertical_hight ) ) 0.0 )
214 follow_flow_feasible
215 ( >= ( + follow_x ( * -1.0 follow_flow_x ) ) 0.0 )
216 ( <= ( + follow_x ( * -1.0 follow_flow_x ) ( * -1.0 follow_flow_width ) ) -100.0 )
217 ( <= ( + follow_flow_y ( * -1.0 follow_y ) ) 0.0 )
218 ( >= ( + follow_flow_y follow_flow_hight ( * -1.0 follow_y ) ) 50.0 )
219 ( <= ( + follow_flow_x ( * -1.0 massage_x ) ) 0.0 )
220 ( >= ( + follow_flow_x follow_flow_width ( * -1.0 massage_x ) ) 100.0 )
221 ( <= ( + follow_flow_y ( * -1.0 massage_y ) ) 0.0 )
222 ( >= ( + follow_flow_y follow_flow_hight ( * -1.0 massage_y ) ) 50.0 )
223 ( <= ( + follow_flow_x ( * -1.0 following_x ) ) 0.0 )
224 ( >= ( + follow_flow_x follow_flow_width ( * -1.0 following_x ) ) 100.0 )
225 ( <= ( + follow_flow_y ( * -1.0 following_y ) ) 0.0 )
226 ( >= ( + follow_flow_y follow_flow_hight ( * -1.0 following_y ) ) 50.0 )
227 ( <= ( + follow_flow_x ( * -1.0 followers_x ) ) 0.0 )
228 ( >= ( + follow_flow_x follow_flow_width ( * -1.0 followers_x ) ) 100.0 )
229 ( <= ( + follow_flow_y ( * -1.0 followers_y ) ) 0.0 )
230 ( >= ( + follow_flow_y ( * -1.0 followers_y ) follow_flow_hight ) 50.0 )
231 ( <= ( + follow_y ( * -1.0 massage_y ) ) -50.0 )
232 ( >= ( + following_y ( * -1.0 massage_y ) ) 50.0 )
233 ( >= ( + followers_y ( * -1.0 following_y ) ) 50.0 )
234 ( <= ( + follow_y ( * -1.0 massage_y ) ) -70.0 )
235 ( >= ( + follow_y ( * -1.0 massage_y ) ) -70.0 )
236 ( <= ( + following_y ( * -1.0 massage_y ) ) 70.0 )
237 ( >= ( + following_y ( * -1.0 massage_y ) ) 70.0 )
238 ( <= ( + followers_y ( * -1.0 following_y ) ) 70.0 )
239 ( >= ( + followers_y ( * -1.0 following_y ) ) 70.0 )
240 ( >= ( + follow_flow_y ( * -1.0 follow_y ) ) 0.0 )
241 ( <= ( + follow_flow_y ( * -1.0 followers_y ) follow_flow_hight ) 50.0 )
242 ( <= ( + ( * 2.0 follow_x ) ( * -2.0 massage_x ) ) 0.0 )
243 ( >= ( + ( * 2.0 follow_x ) ( * -2.0 massage_x ) ) 0.0 )
244 ( <= ( + ( * 2.0 follow_x ) ( * -2.0 following_x ) ) 0.0 )
245 ( >= ( + ( * 2.0 follow_x ) ( * -2.0 following_x ) ) 0.0 )
246 ( <= ( + ( * 2.0 follow_x ) ( * -2.0 followers_x ) ) 0.0 )
247 ( >= ( + ( * 2.0 follow_x ) ( * -2.0 followers_x ) ) 0.0 )
248 ( <= ( + ( * 2.0 follow_x ) ( * -2.0 follow_flow_x ) ( * -1.0 follow_flow_width ) ) -100.0 )
249 ( >= ( + ( * 2.0 follow_x ) ( * -2.0 follow_flow_x ) ( * -1.0 follow_flow_width ) ) -100.0 )
250 person_feasible
251 ( <= ( + person_x ( * -1.0 person_icon_x ) ) 0.0 )
252 ( >= ( + person_x person_width ( * -1.0 person_icon_x ) ) 200.0 )
253 ( <= ( + person_y ( * -1.0 person_icon_y ) ) 0.0 )
254 ( >= ( + person_y person_hight ( * -1.0 person_icon_y ) ) 200.0 )
255 ( >= ( + person_name_x ( * -1.0 person_x ) ) 0.0 )
256 ( <= ( + person_name_x ( * -1.0 person_x ) ( * -1.0 person_width ) ) -350.0 )
257 ( <= ( + person_y ( * -1.0 person_name_y ) ) 0.0 )
258 ( >= ( + person_y person_hight ( * -1.0 person_name_y ) ) 50.0 )
259 ( >= ( + person_name_y ( * -1.0 person_icon_y ) ) 200.0 )
260 ( <= ( + person_name_y ( * -1.0 person_icon_y ) ) 250.0 )
261 ( >= ( + person_name_y ( * -1.0 person_icon_y ) ) 250.0 )
262 ( >= ( + person_y ( * -1.0 person_icon_y ) ) 0.0 )
263 ( <= ( + person_y person_hight ( * -1.0 person_name_y ) ) 50.0 )
264 ( <= ( + ( * 2.0 person_x ) person_width ( * -2.0 person_icon_x ) ) 200.0 )
265 ( >= ( + ( * 2.0 person_x ) person_width ( * -2.0 person_icon_x ) ) 200.0 )
266 ( <= ( + person_name_x ( * -1.0 person_x ) ) 0.0 )
267 ( >= ( + person_name_x ( * -1.0 person_x ) ( * -1.0 person_width ) ) -350.0 )
268 back_ground_feasible
269 cavas_feasible
270 holder_feasible
271 massage_feasible
272 follow_feasible
273 following_feasible
274 followers_feasible
275 person_icon_feasible
276 person_name_feasible
0
315
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
( 50 )
( -51 52 )
( -51 53 )
( -51 54 )
( -51 55 )
( -51 56 )
( -51 57 )
( -51 58 )
( -51 59 )
( -60 61 )
( -60 62 )
( -60 63 )
( -60 64 )
( -60 65 )
( -60 66 )
( -60 67 )
( -60 68 )
( 51 60 )
( -51 -60 )
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
( 95 )
( 96 )
( 97 )
( 98 )
( 99 )
( 100 )
( 101 )
( 102 )
( 103 )
( 104 )
( 105 )
( 106 )
( 107 )
( 108 )
( 109 )
( 110 )
( 111 )
( 112 )
( 113 )
( 114 )
( 115 )
( 116 )
( -51 117 )
( -51 118 )
( -51 119 )
( -51 120 )
( -51 121 )
( -51 122 )
( -51 123 )
( -51 124 )
( -51 125 )
( -51 126 )
( -51 117 )
( -51 127 )
( -51 121 )
( -51 118 )
( -51 128 )
( -51 122 )
( -51 129 )
( -51 130 )
( -51 119 )
( -51 124 )
( -51 131 )
( -51 125 )
( -51 132 )
( -133 134 )
( -133 135 )
( -133 136 )
( -133 137 )
( -133 138 )
( -133 139 )
( -133 140 )
( -133 141 )
( -133 142 )
( -133 143 )
( -133 144 )
( -133 145 )
( -133 146 )
( -133 147 )
( -133 148 )
( -133 149 )
( -133 150 )
( -133 151 )
( -133 152 )
( -133 153 )
( -133 154 )
( -133 155 )
( -133 156 )
( -133 157 )
( -133 158 )
( -133 159 )
( -133 160 )
( -133 161 )
( -133 162 )
( -133 163 )
( -133 164 )
( -133 165 )
( -133 166 )
( -133 167 )
( -133 168 )
( -133 169 )
( -133 170 )
( -133 171 )
( -133 172 )
( 127 -133 )
( 121 -133 )
( 122 -133 )
( 129 -133 )
( -133 173 )
( -133 174 )
( -133 175 )
( 177 179 )
( 178 179 )
( -177 -178 -179 )
( -51 -176 -179 )
( 174 182 )
( 181 182 )
( -174 -181 -182 )
( -133 -180 -182 )
( -133 183 )
( -133 175 )
( -184 185 )
( -184 186 )
( -184 187 )
( -184 188 )
( -51 189 )
( -51 190 )
( -51 191 )
( -51 192 )
( 193 )
( 194 )
( 195 )
( 196 )
( -60 197 )
( -60 198 )
( -60 199 )
( -60 200 )
( -60 201 )
( -60 202 )
( -60 203 )
( -60 204 )
( -60 205 )
( -60 206 )
( -60 207 )
( -60 208 )
( -60 209 )
( -60 210 )
( -60 211 )
( -60 212 )
( -60 213 )
( -214 215 )
( -214 216 )
( -214 217 )
( -214 218 )
( -214 219 )
( -214 220 )
( -214 221 )
( -214 222 )
( -214 223 )
( -214 224 )
( -214 225 )
( -214 226 )
( -214 227 )
( -214 228 )
( -214 229 )
( -214 230 )
( -214 231 )
( -214 232 )
( -214 233 )
( -214 234 )
( -214 235 )
( -214 236 )
( -214 237 )
( -214 238 )
( -214 239 )
( -214 217 )
( -214 240 )
( -214 241 )
( -214 230 )
( -214 242 )
( -214 243 )
( -214 244 )
( -214 245 )
( -214 246 )
( -214 247 )
( -214 248 )
( -214 249 )
( -250 251 )
( -250 252 )
( -250 253 )
( -250 254 )
( -250 255 )
( -250 256 )
( -250 257 )
( -250 258 )
( -250 259 )
( -250 260 )
( -250 261 )
( -250 253 )
( -250 262 )
( -250 263 )
( -250 258 )
( -250 264 )
( -250 265 )
( -250 266 )
( -250 255 )
( -250 256 )
( -250 267 )
( 268 )
( 269 )
( 270 )
( -133 271 )
( -214 271 )
( 133 214 -271 )
( -133 -214 -271 )
( -133 272 )
( -214 272 )
( 133 214 -272 )
( -133 -214 -272 )
( -133 273 )
( -214 273 )
( 133 214 -273 )
( -133 -214 -273 )
( -133 274 )
( -214 274 )
( 133 214 -274 )
( -133 -214 -274 )
( -184 250 )
( -60 250 )
( 60 184 -250 )
( -60 -184 -250 )
( 250 -275 )
( -250 275 )
( 250 -276 )
( -250 276 )
( 51 -184 )
( -51 184 )
( 51 -133 )
( -51 133 )
( 60 -214 )
( -60 214 )
sat
