465
0 true
1 ( >= icon_hight 0.0 )
2 ( >= search_bar_x 0.0 )
3 ( >= search_bar_width 0.0 )
4 ( >= search_bar_hight 0.0 )
5 ( >= search_go_x 0.0 )
6 ( >= search_go_hight 0.0 )
7 ( >= accounts_x 0.0 )
8 ( >= accounts_width 0.0 )
9 ( >= accounts_hight 0.0 )
10 ( >= search_width 160.0 )
11 ( <= ( + search_bar_width search_bar_x ( * -1.0 search_width ) ) 0.0 )
12 ( <= ( + search_go_x ( * -1.0 search_width ) ) -50.0 )
13 ( <= icon_x 10.0 )
14 ( >= icon_x 10.0 )
15 ( <= ( + accounts_x accounts_width ( * -1.0 search_width ) ) -10.0 )
16 ( >= ( + accounts_x accounts_width ( * -1.0 search_width ) ) -10.0 )
17 ( <= icon_y 10.0 )
18 ( >= icon_y 10.0 )
19 ( <= search_bar_y 10.0 )
20 ( >= search_bar_y 10.0 )
21 ( <= search_go_y 10.0 )
22 ( >= search_go_y 10.0 )
23 ( <= accounts_y 10.0 )
24 ( >= accounts_y 10.0 )
25 ( <= ( + search_hight ( * -1.0 icon_hight ) ( * -1.0 icon_y ) ) 10.0 )
26 ( >= ( + search_hight ( * -1.0 icon_hight ) ( * -1.0 icon_y ) ) 10.0 )
27 ( <= ( + search_hight ( * -1.0 search_bar_y ) ( * -1.0 search_bar_hight ) ) 10.0 )
28 ( >= ( + search_hight ( * -1.0 search_bar_y ) ( * -1.0 search_bar_hight ) ) 10.0 )
29 ( <= ( + search_hight ( * -1.0 search_go_y ) ( * -1.0 search_go_hight ) ) 10.0 )
30 ( >= ( + search_hight ( * -1.0 search_go_y ) ( * -1.0 search_go_hight ) ) 10.0 )
31 ( <= ( + accounts_y accounts_hight ( * -1.0 search_hight ) ) -10.0 )
32 ( >= ( + accounts_y accounts_hight ( * -1.0 search_hight ) ) -10.0 )
33 ( <= icon_width 150.0 )
34 ( >= icon_width 150.0 )
35 ( >= your_account_x 0.0 )
36 ( >= your_account_hight 0.0 )
37 ( >= Help_x 0.0 )
38 ( >= Help_hight 0.0 )
39 ( >= Basket_x 0.0 )
40 ( >= Basket_hight 0.0 )
41 ( >= ( + accounts_x ( * -1.0 your_account_x ) accounts_width ) 100.0 )
42 ( <= ( + accounts_x ( * -1.0 Help_x ) ) 0.0 )
43 ( >= ( + accounts_x ( * -1.0 Help_width ) ( * -1.0 Help_x ) accounts_width ) 0.0 )
44 ( <= ( + accounts_x ( * -1.0 Basket_x ) ) 0.0 )
45 ( >= ( + Help_x ( * -1.0 your_account_x ) ) 100.0 )
46 ( <= ( + Help_x ( * -1.0 Basket_x ) ) -100.0 )
47 ( <= ( + accounts_x ( * -1.0 your_account_x ) ) 0.0 )
48 ( >= ( + accounts_x ( * -1.0 your_account_x ) ) 0.0 )
49 ( <= ( + accounts_x ( * -1.0 Basket_width ) ( * -1.0 Basket_x ) accounts_width ) 0.0 )
50 ( >= ( + accounts_x ( * -1.0 Basket_width ) ( * -1.0 Basket_x ) accounts_width ) 0.0 )
51 ( <= your_account_y 10.0 )
52 ( >= your_account_y 10.0 )
53 ( <= Help_y 10.0 )
54 ( >= Help_y 10.0 )
55 ( <= Basket_y 10.0 )
56 ( >= Basket_y 10.0 )
57 ( <= ( + accounts_hight ( * -1.0 your_account_y ) ( * -1.0 your_account_hight ) ) -10.0 )
58 ( >= ( + accounts_hight ( * -1.0 your_account_y ) ( * -1.0 your_account_hight ) ) -10.0 )
59 ( <= ( + accounts_hight ( * -1.0 Help_hight ) ( * -1.0 Help_y ) ) -10.0 )
60 ( >= ( + accounts_hight ( * -1.0 Help_hight ) ( * -1.0 Help_y ) ) -10.0 )
61 ( <= ( + Basket_hight ( * -1.0 accounts_hight ) Basket_y ) 10.0 )
62 ( >= ( + Basket_hight ( * -1.0 accounts_hight ) Basket_y ) 10.0 )
63 ( <= ( + Help_x ( * -1.0 your_account_x ) ) 100.0 )
64 ( >= ( + Help_x ( * -1.0 Basket_x ) ) -100.0 )
65 ( <= Help_width 100.0 )
66 ( >= Help_width 100.0 )
67 ( <= Basket_width 100.0 )
68 ( >= Basket_width 100.0 )
69 ( <= your_account_width 100.0 )
70 ( >= your_account_width 100.0 )
71 ( <= search_go_width 50.0 )
72 ( >= search_go_width 50.0 )
73 ( <= ( + search_bar_x ( * -1.0 icon_x ) ( * -1.0 icon_width ) ) 100.0 )
74 ( >= ( + search_bar_x ( * -1.0 icon_x ) ( * -1.0 icon_width ) ) 100.0 )
75 ( <= ( + search_go_x ( * -1.0 search_bar_width ) ( * -1.0 search_bar_x ) ) 0.0 )
76 ( >= ( + search_go_x ( * -1.0 search_bar_width ) ( * -1.0 search_bar_x ) ) 0.0 )
77 ( <= ( + search_go_width ( * -1.0 accounts_x ) search_go_x ) -100.0 )
78 ( >= ( + search_go_width ( * -1.0 accounts_x ) search_go_x ) -100.0 )
79 icon_feasible
80 search_bar_feasible
81 search_go_feasible
82 accounts_feasible
83 your_account_feasible
84 Help_feasible
85 Basket_feasible
86 ( >= icon2_x 0.0 )
87 ( >= icon2_y 0.0 )
88 ( <= ( + ( * 2.0 icon2_y ) ( * -1.0 bottom_hight ) ) -50.0 )
89 ( >= ( + ( * 2.0 icon2_y ) ( * -1.0 bottom_hight ) ) -50.0 )
90 ( <= ( + ( * 2.0 icon2_x ) ( * -1.0 bottom_width ) ) -100.0 )
91 ( >= ( + ( * 2.0 icon2_x ) ( * -1.0 bottom_width ) ) -100.0 )
92 ( <= icon2_width 100.0 )
93 ( >= icon2_width 100.0 )
94 ( <= icon2_hight 50.0 )
95 ( >= icon2_hight 50.0 )
96 icon2_feasible
97 ( >= tbl4_kid_0_kid_0_x 0.0 )
98 ( >= tbl4_kid_0_kid_0_y 0.0 )
99 ( >= tbl4_kid_0_kid_0_width 0.0 )
100 ( >= tbl4_kid_0_kid_0_hight 0.0 )
101 ( >= tbl4_kid_0_kid_1_x 0.0 )
102 ( >= tbl4_kid_0_kid_1_y 0.0 )
103 ( >= tbl4_kid_0_kid_1_width 0.0 )
104 ( >= tbl4_kid_0_kid_1_hight 0.0 )
105 ( >= tbl4_kid_0_kid_2_x 0.0 )
106 ( >= tbl4_kid_0_kid_2_y 0.0 )
107 ( >= tbl4_kid_0_kid_2_width 0.0 )
108 ( >= tbl4_kid_0_kid_2_hight 0.0 )
109 tbl4_kid_0_feasible
110 ( <= tbl4_kid_0_kid_0_x 20.0 )
111 ( >= tbl4_kid_0_kid_0_x 20.0 )
112 ( <= tbl4_kid_0_kid_1_x 20.0 )
113 ( >= tbl4_kid_0_kid_1_x 20.0 )
114 ( <= tbl4_kid_0_kid_2_x 20.0 )
115 ( >= tbl4_kid_0_kid_2_x 20.0 )
116 ( <= ( + tbl4_kid_0_width ( * -1.0 tbl4_kid_0_kid_0_x ) ( * -1.0 tbl4_kid_0_kid_0_width ) ) 20.0 )
117 ( >= ( + tbl4_kid_0_width ( * -1.0 tbl4_kid_0_kid_0_x ) ( * -1.0 tbl4_kid_0_kid_0_width ) ) 20.0 )
118 ( <= ( + tbl4_kid_0_width ( * -1.0 tbl4_kid_0_kid_1_x ) ( * -1.0 tbl4_kid_0_kid_1_width ) ) 20.0 )
119 ( >= ( + tbl4_kid_0_width ( * -1.0 tbl4_kid_0_kid_1_x ) ( * -1.0 tbl4_kid_0_kid_1_width ) ) 20.0 )
120 ( <= ( + tbl4_kid_0_kid_2_width ( * -1.0 tbl4_kid_0_width ) tbl4_kid_0_kid_2_x ) -20.0 )
121 ( >= ( + tbl4_kid_0_kid_2_width ( * -1.0 tbl4_kid_0_width ) tbl4_kid_0_kid_2_x ) -20.0 )
122 ( <= tbl4_kid_0_kid_0_y 20.0 )
123 ( >= tbl4_kid_0_kid_0_y 20.0 )
124 ( <= ( + tbl4_kid_0_kid_2_hight tbl4_kid_0_kid_2_y ( * -1.0 tbl4_kid_0_hight ) ) -20.0 )
125 ( >= ( + tbl4_kid_0_kid_2_hight tbl4_kid_0_kid_2_y ( * -1.0 tbl4_kid_0_hight ) ) -20.0 )
126 ( <= ( + tbl4_kid_0_kid_0_hight tbl4_kid_0_kid_0_y ( * -1.0 tbl4_kid_0_hight ) ) -20.0 )
127 ( >= tbl4_kid_0_kid_1_y 20.0 )
128 ( <= ( + tbl4_kid_0_kid_1_y tbl4_kid_0_kid_1_hight ( * -1.0 tbl4_kid_0_hight ) ) -20.0 )
129 ( >= tbl4_kid_0_kid_2_y 20.0 )
130 ( <= ( + tbl4_kid_0_kid_0_hight ( * -1.0 tbl4_kid_0_kid_1_y ) tbl4_kid_0_kid_0_y ) 0.0 )
131 ( >= ( + tbl4_kid_0_kid_2_y ( * -1.0 tbl4_kid_0_kid_1_y ) ( * -1.0 tbl4_kid_0_kid_1_hight ) ) 0.0 )
132 ( <= ( + tbl4_kid_0_kid_0_hight ( * -1.0 tbl4_kid_0_kid_1_y ) tbl4_kid_0_kid_0_y ) -10.0 )
133 ( >= ( + tbl4_kid_0_kid_0_hight ( * -1.0 tbl4_kid_0_kid_1_y ) tbl4_kid_0_kid_0_y ) -10.0 )
134 ( <= ( + tbl4_kid_0_kid_2_y ( * -1.0 tbl4_kid_0_kid_1_y ) ( * -1.0 tbl4_kid_0_kid_1_hight ) ) 10.0 )
135 ( >= ( + tbl4_kid_0_kid_2_y ( * -1.0 tbl4_kid_0_kid_1_y ) ( * -1.0 tbl4_kid_0_kid_1_hight ) ) 10.0 )
136 ( <= tbl4_kid_0_kid_0_hight 30.0 )
137 ( >= tbl4_kid_0_kid_0_hight 30.0 )
138 ( <= tbl4_kid_0_kid_2_hight 30.0 )
139 ( >= tbl4_kid_0_kid_2_hight 30.0 )
140 tbl4_kid_0_kid_0_feasible
141 tbl4_kid_0_kid_1_feasible
142 tbl4_kid_0_kid_2_feasible
143 ( >= tbl4_kid_1_kid_0_x 0.0 )
144 ( >= tbl4_kid_1_kid_0_y 0.0 )
145 ( >= tbl4_kid_1_kid_0_width 0.0 )
146 ( >= tbl4_kid_1_kid_0_hight 0.0 )
147 ( >= tbl4_kid_1_kid_1_x 0.0 )
148 ( >= tbl4_kid_1_kid_1_y 0.0 )
149 ( >= tbl4_kid_1_kid_1_width 0.0 )
150 ( >= tbl4_kid_1_kid_1_hight 0.0 )
151 ( >= tbl4_kid_1_kid_2_x 0.0 )
152 ( >= tbl4_kid_1_kid_2_y 0.0 )
153 ( >= tbl4_kid_1_kid_2_width 0.0 )
154 ( >= tbl4_kid_1_kid_2_hight 0.0 )
155 tbl4_kid_1_feasible
156 ( <= tbl4_kid_1_kid_0_x 20.0 )
157 ( >= tbl4_kid_1_kid_0_x 20.0 )
158 ( <= tbl4_kid_1_kid_1_x 20.0 )
159 ( >= tbl4_kid_1_kid_1_x 20.0 )
160 ( <= tbl4_kid_1_kid_2_x 20.0 )
161 ( >= tbl4_kid_1_kid_2_x 20.0 )
162 ( <= ( + tbl4_kid_1_width ( * -1.0 tbl4_kid_1_kid_0_width ) ( * -1.0 tbl4_kid_1_kid_0_x ) ) 20.0 )
163 ( >= ( + tbl4_kid_1_width ( * -1.0 tbl4_kid_1_kid_0_width ) ( * -1.0 tbl4_kid_1_kid_0_x ) ) 20.0 )
164 ( <= ( + tbl4_kid_1_width ( * -1.0 tbl4_kid_1_kid_1_x ) ( * -1.0 tbl4_kid_1_kid_1_width ) ) 20.0 )
165 ( >= ( + tbl4_kid_1_width ( * -1.0 tbl4_kid_1_kid_1_x ) ( * -1.0 tbl4_kid_1_kid_1_width ) ) 20.0 )
166 ( <= ( + tbl4_kid_1_kid_2_x ( * -1.0 tbl4_kid_1_width ) tbl4_kid_1_kid_2_width ) -20.0 )
167 ( >= ( + tbl4_kid_1_kid_2_x ( * -1.0 tbl4_kid_1_width ) tbl4_kid_1_kid_2_width ) -20.0 )
168 ( <= tbl4_kid_1_kid_0_y 20.0 )
169 ( >= tbl4_kid_1_kid_0_y 20.0 )
170 ( <= ( + tbl4_kid_1_kid_2_hight tbl4_kid_1_kid_2_y ( * -1.0 tbl4_kid_1_hight ) ) -20.0 )
171 ( >= ( + tbl4_kid_1_kid_2_hight tbl4_kid_1_kid_2_y ( * -1.0 tbl4_kid_1_hight ) ) -20.0 )
172 ( <= ( + tbl4_kid_1_kid_0_hight tbl4_kid_1_kid_0_y ( * -1.0 tbl4_kid_1_hight ) ) -20.0 )
173 ( >= tbl4_kid_1_kid_1_y 20.0 )
174 ( <= ( + tbl4_kid_1_kid_1_y tbl4_kid_1_kid_1_hight ( * -1.0 tbl4_kid_1_hight ) ) -20.0 )
175 ( >= tbl4_kid_1_kid_2_y 20.0 )
176 ( <= ( + tbl4_kid_1_kid_0_hight ( * -1.0 tbl4_kid_1_kid_1_y ) tbl4_kid_1_kid_0_y ) 0.0 )
177 ( >= ( + tbl4_kid_1_kid_2_y ( * -1.0 tbl4_kid_1_kid_1_y ) ( * -1.0 tbl4_kid_1_kid_1_hight ) ) 0.0 )
178 ( <= ( + tbl4_kid_1_kid_0_hight ( * -1.0 tbl4_kid_1_kid_1_y ) tbl4_kid_1_kid_0_y ) -10.0 )
179 ( >= ( + tbl4_kid_1_kid_0_hight ( * -1.0 tbl4_kid_1_kid_1_y ) tbl4_kid_1_kid_0_y ) -10.0 )
180 ( <= ( + tbl4_kid_1_kid_2_y ( * -1.0 tbl4_kid_1_kid_1_y ) ( * -1.0 tbl4_kid_1_kid_1_hight ) ) 10.0 )
181 ( >= ( + tbl4_kid_1_kid_2_y ( * -1.0 tbl4_kid_1_kid_1_y ) ( * -1.0 tbl4_kid_1_kid_1_hight ) ) 10.0 )
182 ( <= tbl4_kid_1_kid_0_hight 30.0 )
183 ( >= tbl4_kid_1_kid_0_hight 30.0 )
184 ( <= tbl4_kid_1_kid_2_hight 30.0 )
185 ( >= tbl4_kid_1_kid_2_hight 30.0 )
186 tbl4_kid_1_kid_0_feasible
187 tbl4_kid_1_kid_1_feasible
188 tbl4_kid_1_kid_2_feasible
189 ( >= tbl4_kid_2_kid_0_x 0.0 )
190 ( >= tbl4_kid_2_kid_0_y 0.0 )
191 ( >= tbl4_kid_2_kid_0_width 0.0 )
192 ( >= tbl4_kid_2_kid_0_hight 0.0 )
193 ( >= tbl4_kid_2_kid_1_x 0.0 )
194 ( >= tbl4_kid_2_kid_1_y 0.0 )
195 ( >= tbl4_kid_2_kid_1_width 0.0 )
196 ( >= tbl4_kid_2_kid_1_hight 0.0 )
197 ( >= tbl4_kid_2_kid_2_x 0.0 )
198 ( >= tbl4_kid_2_kid_2_y 0.0 )
199 ( >= tbl4_kid_2_kid_2_width 0.0 )
200 ( >= tbl4_kid_2_kid_2_hight 0.0 )
201 tbl4_kid_2_feasible
202 ( <= tbl4_kid_2_kid_0_x 20.0 )
203 ( >= tbl4_kid_2_kid_0_x 20.0 )
204 ( <= tbl4_kid_2_kid_1_x 20.0 )
205 ( >= tbl4_kid_2_kid_1_x 20.0 )
206 ( <= tbl4_kid_2_kid_2_x 20.0 )
207 ( >= tbl4_kid_2_kid_2_x 20.0 )
208 ( <= ( + tbl4_kid_2_width ( * -1.0 tbl4_kid_2_kid_0_x ) ( * -1.0 tbl4_kid_2_kid_0_width ) ) 20.0 )
209 ( >= ( + tbl4_kid_2_width ( * -1.0 tbl4_kid_2_kid_0_x ) ( * -1.0 tbl4_kid_2_kid_0_width ) ) 20.0 )
210 ( <= ( + tbl4_kid_2_width ( * -1.0 tbl4_kid_2_kid_1_x ) ( * -1.0 tbl4_kid_2_kid_1_width ) ) 20.0 )
211 ( >= ( + tbl4_kid_2_width ( * -1.0 tbl4_kid_2_kid_1_x ) ( * -1.0 tbl4_kid_2_kid_1_width ) ) 20.0 )
212 ( <= ( + tbl4_kid_2_kid_2_x tbl4_kid_2_kid_2_width ( * -1.0 tbl4_kid_2_width ) ) -20.0 )
213 ( >= ( + tbl4_kid_2_kid_2_x tbl4_kid_2_kid_2_width ( * -1.0 tbl4_kid_2_width ) ) -20.0 )
214 ( <= tbl4_kid_2_kid_0_y 20.0 )
215 ( >= tbl4_kid_2_kid_0_y 20.0 )
216 ( <= ( + tbl4_kid_2_kid_2_hight tbl4_kid_2_kid_2_y ( * -1.0 tbl4_kid_2_hight ) ) -20.0 )
217 ( >= ( + tbl4_kid_2_kid_2_hight tbl4_kid_2_kid_2_y ( * -1.0 tbl4_kid_2_hight ) ) -20.0 )
218 ( <= ( + tbl4_kid_2_kid_0_hight tbl4_kid_2_kid_0_y ( * -1.0 tbl4_kid_2_hight ) ) -20.0 )
219 ( >= tbl4_kid_2_kid_1_y 20.0 )
220 ( <= ( + tbl4_kid_2_kid_1_hight tbl4_kid_2_kid_1_y ( * -1.0 tbl4_kid_2_hight ) ) -20.0 )
221 ( >= tbl4_kid_2_kid_2_y 20.0 )
222 ( <= ( + tbl4_kid_2_kid_0_hight ( * -1.0 tbl4_kid_2_kid_1_y ) tbl4_kid_2_kid_0_y ) 0.0 )
223 ( <= ( + tbl4_kid_2_kid_1_hight ( * -1.0 tbl4_kid_2_kid_2_y ) tbl4_kid_2_kid_1_y ) 0.0 )
224 ( <= ( + tbl4_kid_2_kid_0_hight ( * -1.0 tbl4_kid_2_kid_1_y ) tbl4_kid_2_kid_0_y ) -10.0 )
225 ( >= ( + tbl4_kid_2_kid_0_hight ( * -1.0 tbl4_kid_2_kid_1_y ) tbl4_kid_2_kid_0_y ) -10.0 )
226 ( <= ( + tbl4_kid_2_kid_1_hight ( * -1.0 tbl4_kid_2_kid_2_y ) tbl4_kid_2_kid_1_y ) -10.0 )
227 ( >= ( + tbl4_kid_2_kid_1_hight ( * -1.0 tbl4_kid_2_kid_2_y ) tbl4_kid_2_kid_1_y ) -10.0 )
228 ( <= tbl4_kid_2_kid_0_hight 30.0 )
229 ( >= tbl4_kid_2_kid_0_hight 30.0 )
230 ( <= tbl4_kid_2_kid_2_hight 30.0 )
231 ( >= tbl4_kid_2_kid_2_hight 30.0 )
232 tbl4_kid_2_kid_0_feasible
233 tbl4_kid_2_kid_1_feasible
234 tbl4_kid_2_kid_2_feasible
235 ( >= tbl4_kid_3_kid_0_x 0.0 )
236 ( >= tbl4_kid_3_kid_0_y 0.0 )
237 ( >= tbl4_kid_3_kid_0_width 0.0 )
238 ( >= tbl4_kid_3_kid_0_hight 0.0 )
239 ( >= tbl4_kid_3_kid_1_x 0.0 )
240 ( >= tbl4_kid_3_kid_1_y 0.0 )
241 ( >= tbl4_kid_3_kid_1_width 0.0 )
242 ( >= tbl4_kid_3_kid_1_hight 0.0 )
243 ( >= tbl4_kid_3_kid_2_x 0.0 )
244 ( >= tbl4_kid_3_kid_2_y 0.0 )
245 ( >= tbl4_kid_3_kid_2_width 0.0 )
246 ( >= tbl4_kid_3_kid_2_hight 0.0 )
247 tbl4_kid_3_feasible
248 ( <= tbl4_kid_3_kid_0_x 20.0 )
249 ( >= tbl4_kid_3_kid_0_x 20.0 )
250 ( <= tbl4_kid_3_kid_1_x 20.0 )
251 ( >= tbl4_kid_3_kid_1_x 20.0 )
252 ( <= tbl4_kid_3_kid_2_x 20.0 )
253 ( >= tbl4_kid_3_kid_2_x 20.0 )
254 ( <= ( + tbl4_kid_3_width ( * -1.0 tbl4_kid_3_kid_0_width ) ( * -1.0 tbl4_kid_3_kid_0_x ) ) 20.0 )
255 ( >= ( + tbl4_kid_3_width ( * -1.0 tbl4_kid_3_kid_0_width ) ( * -1.0 tbl4_kid_3_kid_0_x ) ) 20.0 )
256 ( <= ( + tbl4_kid_3_width ( * -1.0 tbl4_kid_3_kid_1_width ) ( * -1.0 tbl4_kid_3_kid_1_x ) ) 20.0 )
257 ( >= ( + tbl4_kid_3_width ( * -1.0 tbl4_kid_3_kid_1_width ) ( * -1.0 tbl4_kid_3_kid_1_x ) ) 20.0 )
258 ( <= ( + tbl4_kid_3_width ( * -1.0 tbl4_kid_3_kid_2_x ) ( * -1.0 tbl4_kid_3_kid_2_width ) ) 20.0 )
259 ( >= ( + tbl4_kid_3_width ( * -1.0 tbl4_kid_3_kid_2_x ) ( * -1.0 tbl4_kid_3_kid_2_width ) ) 20.0 )
260 ( <= tbl4_kid_3_kid_0_y 20.0 )
261 ( >= tbl4_kid_3_kid_0_y 20.0 )
262 ( <= ( + tbl4_kid_3_kid_2_hight tbl4_kid_3_kid_2_y ( * -1.0 tbl4_kid_3_hight ) ) -20.0 )
263 ( >= ( + tbl4_kid_3_kid_2_hight tbl4_kid_3_kid_2_y ( * -1.0 tbl4_kid_3_hight ) ) -20.0 )
264 ( <= ( + tbl4_kid_3_kid_0_hight tbl4_kid_3_kid_0_y ( * -1.0 tbl4_kid_3_hight ) ) -20.0 )
265 ( >= tbl4_kid_3_kid_1_y 20.0 )
266 ( <= ( + tbl4_kid_3_kid_1_y tbl4_kid_3_kid_1_hight ( * -1.0 tbl4_kid_3_hight ) ) -20.0 )
267 ( >= tbl4_kid_3_kid_2_y 20.0 )
268 ( <= ( + tbl4_kid_3_kid_0_hight ( * -1.0 tbl4_kid_3_kid_1_y ) tbl4_kid_3_kid_0_y ) 0.0 )
269 ( >= ( + tbl4_kid_3_kid_2_y ( * -1.0 tbl4_kid_3_kid_1_y ) ( * -1.0 tbl4_kid_3_kid_1_hight ) ) 0.0 )
270 ( <= ( + tbl4_kid_3_kid_0_hight ( * -1.0 tbl4_kid_3_kid_1_y ) tbl4_kid_3_kid_0_y ) -10.0 )
271 ( >= ( + tbl4_kid_3_kid_0_hight ( * -1.0 tbl4_kid_3_kid_1_y ) tbl4_kid_3_kid_0_y ) -10.0 )
272 ( <= ( + tbl4_kid_3_kid_2_y ( * -1.0 tbl4_kid_3_kid_1_y ) ( * -1.0 tbl4_kid_3_kid_1_hight ) ) 10.0 )
273 ( >= ( + tbl4_kid_3_kid_2_y ( * -1.0 tbl4_kid_3_kid_1_y ) ( * -1.0 tbl4_kid_3_kid_1_hight ) ) 10.0 )
274 ( <= tbl4_kid_3_kid_0_hight 30.0 )
275 ( >= tbl4_kid_3_kid_0_hight 30.0 )
276 ( <= tbl4_kid_3_kid_2_hight 30.0 )
277 ( >= tbl4_kid_3_kid_2_hight 30.0 )
278 tbl4_kid_3_kid_0_feasible
279 tbl4_kid_3_kid_1_feasible
280 tbl4_kid_3_kid_2_feasible
281 ( >= tbl4_kid_4_kid_0_x 0.0 )
282 ( >= tbl4_kid_4_kid_0_y 0.0 )
283 ( >= tbl4_kid_4_kid_0_width 0.0 )
284 ( >= tbl4_kid_4_kid_0_hight 0.0 )
285 ( >= tbl4_kid_4_kid_1_x 0.0 )
286 ( >= tbl4_kid_4_kid_1_y 0.0 )
287 ( >= tbl4_kid_4_kid_1_width 0.0 )
288 ( >= tbl4_kid_4_kid_1_hight 0.0 )
289 ( >= tbl4_kid_4_kid_2_x 0.0 )
290 ( >= tbl4_kid_4_kid_2_y 0.0 )
291 ( >= tbl4_kid_4_kid_2_width 0.0 )
292 ( >= tbl4_kid_4_kid_2_hight 0.0 )
293 tbl4_kid_4_feasible
294 ( <= tbl4_kid_4_kid_0_x 20.0 )
295 ( >= tbl4_kid_4_kid_0_x 20.0 )
296 ( <= tbl4_kid_4_kid_1_x 20.0 )
297 ( >= tbl4_kid_4_kid_1_x 20.0 )
298 ( <= tbl4_kid_4_kid_2_x 20.0 )
299 ( >= tbl4_kid_4_kid_2_x 20.0 )
300 ( <= ( + tbl4_kid_4_width ( * -1.0 tbl4_kid_4_kid_0_x ) ( * -1.0 tbl4_kid_4_kid_0_width ) ) 20.0 )
301 ( >= ( + tbl4_kid_4_width ( * -1.0 tbl4_kid_4_kid_0_x ) ( * -1.0 tbl4_kid_4_kid_0_width ) ) 20.0 )
302 ( <= ( + tbl4_kid_4_width ( * -1.0 tbl4_kid_4_kid_1_x ) ( * -1.0 tbl4_kid_4_kid_1_width ) ) 20.0 )
303 ( >= ( + tbl4_kid_4_width ( * -1.0 tbl4_kid_4_kid_1_x ) ( * -1.0 tbl4_kid_4_kid_1_width ) ) 20.0 )
304 ( <= ( + tbl4_kid_4_width ( * -1.0 tbl4_kid_4_kid_2_x ) ( * -1.0 tbl4_kid_4_kid_2_width ) ) 20.0 )
305 ( >= ( + tbl4_kid_4_width ( * -1.0 tbl4_kid_4_kid_2_x ) ( * -1.0 tbl4_kid_4_kid_2_width ) ) 20.0 )
306 ( <= tbl4_kid_4_kid_0_y 20.0 )
307 ( >= tbl4_kid_4_kid_0_y 20.0 )
308 ( <= ( + tbl4_kid_4_kid_2_hight tbl4_kid_4_kid_2_y ( * -1.0 tbl4_kid_4_hight ) ) -20.0 )
309 ( >= ( + tbl4_kid_4_kid_2_hight tbl4_kid_4_kid_2_y ( * -1.0 tbl4_kid_4_hight ) ) -20.0 )
310 ( <= ( + tbl4_kid_4_kid_0_hight tbl4_kid_4_kid_0_y ( * -1.0 tbl4_kid_4_hight ) ) -20.0 )
311 ( >= tbl4_kid_4_kid_1_y 20.0 )
312 ( <= ( + tbl4_kid_4_kid_1_hight tbl4_kid_4_kid_1_y ( * -1.0 tbl4_kid_4_hight ) ) -20.0 )
313 ( >= tbl4_kid_4_kid_2_y 20.0 )
314 ( <= ( + tbl4_kid_4_kid_0_hight ( * -1.0 tbl4_kid_4_kid_1_y ) tbl4_kid_4_kid_0_y ) 0.0 )
315 ( <= ( + tbl4_kid_4_kid_1_hight tbl4_kid_4_kid_1_y ( * -1.0 tbl4_kid_4_kid_2_y ) ) 0.0 )
316 ( <= ( + tbl4_kid_4_kid_0_hight ( * -1.0 tbl4_kid_4_kid_1_y ) tbl4_kid_4_kid_0_y ) -10.0 )
317 ( >= ( + tbl4_kid_4_kid_0_hight ( * -1.0 tbl4_kid_4_kid_1_y ) tbl4_kid_4_kid_0_y ) -10.0 )
318 ( <= ( + tbl4_kid_4_kid_1_hight tbl4_kid_4_kid_1_y ( * -1.0 tbl4_kid_4_kid_2_y ) ) -10.0 )
319 ( >= ( + tbl4_kid_4_kid_1_hight tbl4_kid_4_kid_1_y ( * -1.0 tbl4_kid_4_kid_2_y ) ) -10.0 )
320 ( <= tbl4_kid_4_kid_0_hight 30.0 )
321 ( >= tbl4_kid_4_kid_0_hight 30.0 )
322 ( <= tbl4_kid_4_kid_2_hight 30.0 )
323 ( >= tbl4_kid_4_kid_2_hight 30.0 )
324 tbl4_kid_4_kid_0_feasible
325 tbl4_kid_4_kid_1_feasible
326 tbl4_kid_4_kid_2_feasible
327 ( >= tbl4_kid_5_kid_0_x 0.0 )
328 ( >= tbl4_kid_5_kid_0_y 0.0 )
329 ( >= tbl4_kid_5_kid_0_width 0.0 )
330 ( >= tbl4_kid_5_kid_0_hight 0.0 )
331 ( >= tbl4_kid_5_kid_1_x 0.0 )
332 ( >= tbl4_kid_5_kid_1_y 0.0 )
333 ( >= tbl4_kid_5_kid_1_width 0.0 )
334 ( >= tbl4_kid_5_kid_1_hight 0.0 )
335 ( >= tbl4_kid_5_kid_2_x 0.0 )
336 ( >= tbl4_kid_5_kid_2_y 0.0 )
337 ( >= tbl4_kid_5_kid_2_width 0.0 )
338 ( >= tbl4_kid_5_kid_2_hight 0.0 )
339 tbl4_kid_5_feasible
340 ( <= tbl4_kid_5_kid_0_x 20.0 )
341 ( >= tbl4_kid_5_kid_0_x 20.0 )
342 ( <= tbl4_kid_5_kid_1_x 20.0 )
343 ( >= tbl4_kid_5_kid_1_x 20.0 )
344 ( <= tbl4_kid_5_kid_2_x 20.0 )
345 ( >= tbl4_kid_5_kid_2_x 20.0 )
346 ( <= ( + tbl4_kid_5_width ( * -1.0 tbl4_kid_5_kid_0_width ) ( * -1.0 tbl4_kid_5_kid_0_x ) ) 20.0 )
347 ( >= ( + tbl4_kid_5_width ( * -1.0 tbl4_kid_5_kid_0_width ) ( * -1.0 tbl4_kid_5_kid_0_x ) ) 20.0 )
348 ( <= ( + tbl4_kid_5_width ( * -1.0 tbl4_kid_5_kid_1_x ) ( * -1.0 tbl4_kid_5_kid_1_width ) ) 20.0 )
349 ( >= ( + tbl4_kid_5_width ( * -1.0 tbl4_kid_5_kid_1_x ) ( * -1.0 tbl4_kid_5_kid_1_width ) ) 20.0 )
350 ( <= ( + tbl4_kid_5_kid_2_width tbl4_kid_5_kid_2_x ( * -1.0 tbl4_kid_5_width ) ) -20.0 )
351 ( >= ( + tbl4_kid_5_kid_2_width tbl4_kid_5_kid_2_x ( * -1.0 tbl4_kid_5_width ) ) -20.0 )
352 ( <= tbl4_kid_5_kid_0_y 20.0 )
353 ( >= tbl4_kid_5_kid_0_y 20.0 )
354 ( <= ( + tbl4_kid_5_kid_2_hight tbl4_kid_5_kid_2_y ( * -1.0 tbl4_kid_5_hight ) ) -20.0 )
355 ( >= ( + tbl4_kid_5_kid_2_hight tbl4_kid_5_kid_2_y ( * -1.0 tbl4_kid_5_hight ) ) -20.0 )
356 ( <= ( + tbl4_kid_5_kid_0_hight tbl4_kid_5_kid_0_y ( * -1.0 tbl4_kid_5_hight ) ) -20.0 )
357 ( >= tbl4_kid_5_kid_1_y 20.0 )
358 ( <= ( + tbl4_kid_5_kid_1_y tbl4_kid_5_kid_1_hight ( * -1.0 tbl4_kid_5_hight ) ) -20.0 )
359 ( >= tbl4_kid_5_kid_2_y 20.0 )
360 ( <= ( + tbl4_kid_5_kid_0_hight ( * -1.0 tbl4_kid_5_kid_1_y ) tbl4_kid_5_kid_0_y ) 0.0 )
361 ( >= ( + tbl4_kid_5_kid_2_y ( * -1.0 tbl4_kid_5_kid_1_y ) ( * -1.0 tbl4_kid_5_kid_1_hight ) ) 0.0 )
362 ( <= ( + tbl4_kid_5_kid_0_hight ( * -1.0 tbl4_kid_5_kid_1_y ) tbl4_kid_5_kid_0_y ) -10.0 )
363 ( >= ( + tbl4_kid_5_kid_0_hight ( * -1.0 tbl4_kid_5_kid_1_y ) tbl4_kid_5_kid_0_y ) -10.0 )
364 ( <= ( + tbl4_kid_5_kid_2_y ( * -1.0 tbl4_kid_5_kid_1_y ) ( * -1.0 tbl4_kid_5_kid_1_hight ) ) 10.0 )
365 ( >= ( + tbl4_kid_5_kid_2_y ( * -1.0 tbl4_kid_5_kid_1_y ) ( * -1.0 tbl4_kid_5_kid_1_hight ) ) 10.0 )
366 ( <= tbl4_kid_5_kid_0_hight 30.0 )
367 ( >= tbl4_kid_5_kid_0_hight 30.0 )
368 ( <= tbl4_kid_5_kid_2_hight 30.0 )
369 ( >= tbl4_kid_5_kid_2_hight 30.0 )
370 tbl4_kid_5_kid_0_feasible
371 tbl4_kid_5_kid_1_feasible
372 tbl4_kid_5_kid_2_feasible
373 ( >= tbl4_kid_6_kid_0_x 0.0 )
374 ( >= tbl4_kid_6_kid_0_y 0.0 )
375 ( >= tbl4_kid_6_kid_0_width 0.0 )
376 ( >= tbl4_kid_6_kid_0_hight 0.0 )
377 ( >= tbl4_kid_6_kid_1_x 0.0 )
378 ( >= tbl4_kid_6_kid_1_y 0.0 )
379 ( >= tbl4_kid_6_kid_1_width 0.0 )
380 ( >= tbl4_kid_6_kid_1_hight 0.0 )
381 ( >= tbl4_kid_6_kid_2_x 0.0 )
382 ( >= tbl4_kid_6_kid_2_y 0.0 )
383 ( >= tbl4_kid_6_kid_2_width 0.0 )
384 ( >= tbl4_kid_6_kid_2_hight 0.0 )
385 tbl4_kid_6_feasible
386 ( <= tbl4_kid_6_kid_0_x 20.0 )
387 ( >= tbl4_kid_6_kid_0_x 20.0 )
388 ( <= tbl4_kid_6_kid_1_x 20.0 )
389 ( >= tbl4_kid_6_kid_1_x 20.0 )
390 ( <= tbl4_kid_6_kid_2_x 20.0 )
391 ( >= tbl4_kid_6_kid_2_x 20.0 )
392 ( <= ( + tbl4_kid_6_width ( * -1.0 tbl4_kid_6_kid_0_x ) ( * -1.0 tbl4_kid_6_kid_0_width ) ) 20.0 )
393 ( >= ( + tbl4_kid_6_width ( * -1.0 tbl4_kid_6_kid_0_x ) ( * -1.0 tbl4_kid_6_kid_0_width ) ) 20.0 )
394 ( <= ( + tbl4_kid_6_width ( * -1.0 tbl4_kid_6_kid_1_x ) ( * -1.0 tbl4_kid_6_kid_1_width ) ) 20.0 )
395 ( >= ( + tbl4_kid_6_width ( * -1.0 tbl4_kid_6_kid_1_x ) ( * -1.0 tbl4_kid_6_kid_1_width ) ) 20.0 )
396 ( <= ( + tbl4_kid_6_kid_2_x tbl4_kid_6_kid_2_width ( * -1.0 tbl4_kid_6_width ) ) -20.0 )
397 ( >= ( + tbl4_kid_6_kid_2_x tbl4_kid_6_kid_2_width ( * -1.0 tbl4_kid_6_width ) ) -20.0 )
398 ( <= tbl4_kid_6_kid_0_y 20.0 )
399 ( >= tbl4_kid_6_kid_0_y 20.0 )
400 ( <= ( + tbl4_kid_6_kid_2_hight tbl4_kid_6_kid_2_y ( * -1.0 tbl4_kid_6_hight ) ) -20.0 )
401 ( >= ( + tbl4_kid_6_kid_2_hight tbl4_kid_6_kid_2_y ( * -1.0 tbl4_kid_6_hight ) ) -20.0 )
402 ( <= ( + tbl4_kid_6_kid_0_hight tbl4_kid_6_kid_0_y ( * -1.0 tbl4_kid_6_hight ) ) -20.0 )
403 ( >= tbl4_kid_6_kid_1_y 20.0 )
404 ( <= ( + tbl4_kid_6_kid_1_y tbl4_kid_6_kid_1_hight ( * -1.0 tbl4_kid_6_hight ) ) -20.0 )
405 ( >= tbl4_kid_6_kid_2_y 20.0 )
406 ( <= ( + tbl4_kid_6_kid_0_hight ( * -1.0 tbl4_kid_6_kid_1_y ) tbl4_kid_6_kid_0_y ) 0.0 )
407 ( <= ( + tbl4_kid_6_kid_1_y tbl4_kid_6_kid_1_hight ( * -1.0 tbl4_kid_6_kid_2_y ) ) 0.0 )
408 ( <= ( + tbl4_kid_6_kid_0_hight ( * -1.0 tbl4_kid_6_kid_1_y ) tbl4_kid_6_kid_0_y ) -10.0 )
409 ( >= ( + tbl4_kid_6_kid_0_hight ( * -1.0 tbl4_kid_6_kid_1_y ) tbl4_kid_6_kid_0_y ) -10.0 )
410 ( <= ( + tbl4_kid_6_kid_1_y tbl4_kid_6_kid_1_hight ( * -1.0 tbl4_kid_6_kid_2_y ) ) -10.0 )
411 ( >= ( + tbl4_kid_6_kid_1_y tbl4_kid_6_kid_1_hight ( * -1.0 tbl4_kid_6_kid_2_y ) ) -10.0 )
412 ( <= tbl4_kid_6_kid_0_hight 30.0 )
413 ( >= tbl4_kid_6_kid_0_hight 30.0 )
414 ( <= tbl4_kid_6_kid_2_hight 30.0 )
415 ( >= tbl4_kid_6_kid_2_hight 30.0 )
416 tbl4_kid_6_kid_0_feasible
417 tbl4_kid_6_kid_1_feasible
418 tbl4_kid_6_kid_2_feasible
419 ( >= tbl4_kid_7_kid_0_x 0.0 )
420 ( >= tbl4_kid_7_kid_0_y 0.0 )
421 ( >= tbl4_kid_7_kid_0_width 0.0 )
422 ( >= tbl4_kid_7_kid_0_hight 0.0 )
423 ( >= tbl4_kid_7_kid_1_x 0.0 )
424 ( >= tbl4_kid_7_kid_1_y 0.0 )
425 ( >= tbl4_kid_7_kid_1_width 0.0 )
426 ( >= tbl4_kid_7_kid_1_hight 0.0 )
427 ( >= tbl4_kid_7_kid_2_x 0.0 )
428 ( >= tbl4_kid_7_kid_2_y 0.0 )
429 ( >= tbl4_kid_7_kid_2_width 0.0 )
430 ( >= tbl4_kid_7_kid_2_hight 0.0 )
431 tbl4_kid_7_feasible
432 ( <= tbl4_kid_7_kid_0_x 20.0 )
433 ( >= tbl4_kid_7_kid_0_x 20.0 )
434 ( <= tbl4_kid_7_kid_1_x 20.0 )
435 ( >= tbl4_kid_7_kid_1_x 20.0 )
436 ( <= tbl4_kid_7_kid_2_x 20.0 )
437 ( >= tbl4_kid_7_kid_2_x 20.0 )
438 ( <= ( + tbl4_kid_7_width ( * -1.0 tbl4_kid_7_kid_0_x ) ( * -1.0 tbl4_kid_7_kid_0_width ) ) 20.0 )
439 ( >= ( + tbl4_kid_7_width ( * -1.0 tbl4_kid_7_kid_0_x ) ( * -1.0 tbl4_kid_7_kid_0_width ) ) 20.0 )
440 ( <= ( + tbl4_kid_7_width ( * -1.0 tbl4_kid_7_kid_1_width ) ( * -1.0 tbl4_kid_7_kid_1_x ) ) 20.0 )
441 ( >= ( + tbl4_kid_7_width ( * -1.0 tbl4_kid_7_kid_1_width ) ( * -1.0 tbl4_kid_7_kid_1_x ) ) 20.0 )
442 ( <= ( + tbl4_kid_7_kid_2_width ( * -1.0 tbl4_kid_7_width ) tbl4_kid_7_kid_2_x ) -20.0 )
443 ( >= ( + tbl4_kid_7_kid_2_width ( * -1.0 tbl4_kid_7_width ) tbl4_kid_7_kid_2_x ) -20.0 )
444 ( <= tbl4_kid_7_kid_0_y 20.0 )
445 ( >= tbl4_kid_7_kid_0_y 20.0 )
446 ( <= ( + tbl4_kid_7_kid_2_hight tbl4_kid_7_kid_2_y ( * -1.0 tbl4_kid_7_hight ) ) -20.0 )
447 ( >= ( + tbl4_kid_7_kid_2_hight tbl4_kid_7_kid_2_y ( * -1.0 tbl4_kid_7_hight ) ) -20.0 )
448 ( <= ( + tbl4_kid_7_kid_0_hight tbl4_kid_7_kid_0_y ( * -1.0 tbl4_kid_7_hight ) ) -20.0 )
449 ( >= tbl4_kid_7_kid_1_y 20.0 )
450 ( <= ( + tbl4_kid_7_kid_1_y tbl4_kid_7_kid_1_hight ( * -1.0 tbl4_kid_7_hight ) ) -20.0 )
451 ( >= tbl4_kid_7_kid_2_y 20.0 )
452 ( <= ( + tbl4_kid_7_kid_0_hight ( * -1.0 tbl4_kid_7_kid_1_y ) tbl4_kid_7_kid_0_y ) 0.0 )
453 ( >= ( + tbl4_kid_7_kid_2_y ( * -1.0 tbl4_kid_7_kid_1_y ) ( * -1.0 tbl4_kid_7_kid_1_hight ) ) 0.0 )
454 ( <= ( + tbl4_kid_7_kid_0_hight ( * -1.0 tbl4_kid_7_kid_1_y ) tbl4_kid_7_kid_0_y ) -10.0 )
455 ( >= ( + tbl4_kid_7_kid_0_hight ( * -1.0 tbl4_kid_7_kid_1_y ) tbl4_kid_7_kid_0_y ) -10.0 )
456 ( <= ( + tbl4_kid_7_kid_2_y ( * -1.0 tbl4_kid_7_kid_1_y ) ( * -1.0 tbl4_kid_7_kid_1_hight ) ) 10.0 )
457 ( >= ( + tbl4_kid_7_kid_2_y ( * -1.0 tbl4_kid_7_kid_1_y ) ( * -1.0 tbl4_kid_7_kid_1_hight ) ) 10.0 )
458 ( <= tbl4_kid_7_kid_0_hight 30.0 )
459 ( >= tbl4_kid_7_kid_0_hight 30.0 )
460 ( <= tbl4_kid_7_kid_2_hight 30.0 )
461 ( >= tbl4_kid_7_kid_2_hight 30.0 )
462 tbl4_kid_7_kid_0_feasible
463 tbl4_kid_7_kid_1_feasible
464 tbl4_kid_7_kid_2_feasible
0
546
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
( 51 )
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
( 45 )
( 46 )
( 64 )
( 65 )
( 66 )
( 67 )
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
( -109 110 )
( -109 111 )
( -109 112 )
( -109 113 )
( -109 114 )
( -109 115 )
( -109 116 )
( -109 117 )
( -109 118 )
( -109 119 )
( -109 120 )
( -109 121 )
( -109 122 )
( -109 123 )
( -109 124 )
( -109 125 )
( -109 111 )
( -109 117 )
( -109 123 )
( -109 126 )
( -109 113 )
( -109 119 )
( -109 127 )
( -109 128 )
( -109 115 )
( -109 120 )
( -109 129 )
( -109 124 )
( -109 130 )
( -109 131 )
( -109 132 )
( -109 133 )
( -109 134 )
( -109 135 )
( -109 136 )
( -109 137 )
( -109 138 )
( -109 139 )
( 109 -140 )
( -109 140 )
( 109 -141 )
( -109 141 )
( 109 -142 )
( -109 142 )
( 143 )
( 144 )
( 145 )
( 146 )
( 147 )
( 148 )
( 149 )
( 150 )
( 151 )
( 152 )
( 153 )
( 154 )
( -155 156 )
( -155 157 )
( -155 158 )
( -155 159 )
( -155 160 )
( -155 161 )
( -155 162 )
( -155 163 )
( -155 164 )
( -155 165 )
( -155 166 )
( -155 167 )
( -155 168 )
( -155 169 )
( -155 170 )
( -155 171 )
( -155 157 )
( -155 163 )
( -155 169 )
( -155 172 )
( -155 159 )
( -155 165 )
( -155 173 )
( -155 174 )
( -155 161 )
( -155 166 )
( -155 175 )
( -155 170 )
( -155 176 )
( -155 177 )
( -155 178 )
( -155 179 )
( -155 180 )
( -155 181 )
( -155 182 )
( -155 183 )
( -155 184 )
( -155 185 )
( 155 -186 )
( -155 186 )
( 155 -187 )
( -155 187 )
( 155 -188 )
( -155 188 )
( 189 )
( 190 )
( 191 )
( 192 )
( 193 )
( 194 )
( 195 )
( 196 )
( 197 )
( 198 )
( 199 )
( 200 )
( -201 202 )
( -201 203 )
( -201 204 )
( -201 205 )
( -201 206 )
( -201 207 )
( -201 208 )
( -201 209 )
( -201 210 )
( -201 211 )
( -201 212 )
( -201 213 )
( -201 214 )
( -201 215 )
( -201 216 )
( -201 217 )
( -201 203 )
( -201 209 )
( -201 215 )
( -201 218 )
( -201 205 )
( -201 211 )
( -201 219 )
( -201 220 )
( -201 207 )
( -201 212 )
( -201 221 )
( -201 216 )
( -201 222 )
( -201 223 )
( -201 224 )
( -201 225 )
( -201 226 )
( -201 227 )
( -201 228 )
( -201 229 )
( -201 230 )
( -201 231 )
( 201 -232 )
( -201 232 )
( 201 -233 )
( -201 233 )
( 201 -234 )
( -201 234 )
( 235 )
( 236 )
( 237 )
( 238 )
( 239 )
( 240 )
( 241 )
( 242 )
( 243 )
( 244 )
( 245 )
( 246 )
( -247 248 )
( -247 249 )
( -247 250 )
( -247 251 )
( -247 252 )
( -247 253 )
( -247 254 )
( -247 255 )
( -247 256 )
( -247 257 )
( -247 258 )
( -247 259 )
( -247 260 )
( -247 261 )
( -247 262 )
( -247 263 )
( -247 249 )
( -247 255 )
( -247 261 )
( -247 264 )
( -247 251 )
( -247 257 )
( -247 265 )
( -247 266 )
( -247 253 )
( -247 259 )
( -247 267 )
( -247 262 )
( -247 268 )
( -247 269 )
( -247 270 )
( -247 271 )
( -247 272 )
( -247 273 )
( -247 274 )
( -247 275 )
( -247 276 )
( -247 277 )
( 247 -278 )
( -247 278 )
( 247 -279 )
( -247 279 )
( 247 -280 )
( -247 280 )
( 281 )
( 282 )
( 283 )
( 284 )
( 285 )
( 286 )
( 287 )
( 288 )
( 289 )
( 290 )
( 291 )
( 292 )
( -293 294 )
( -293 295 )
( -293 296 )
( -293 297 )
( -293 298 )
( -293 299 )
( -293 300 )
( -293 301 )
( -293 302 )
( -293 303 )
( -293 304 )
( -293 305 )
( -293 306 )
( -293 307 )
( -293 308 )
( -293 309 )
( -293 295 )
( -293 301 )
( -293 307 )
( -293 310 )
( -293 297 )
( -293 303 )
( -293 311 )
( -293 312 )
( -293 299 )
( -293 305 )
( -293 313 )
( -293 308 )
( -293 314 )
( -293 315 )
( -293 316 )
( -293 317 )
( -293 318 )
( -293 319 )
( -293 320 )
( -293 321 )
( -293 322 )
( -293 323 )
( 293 -324 )
( -293 324 )
( 293 -325 )
( -293 325 )
( 293 -326 )
( -293 326 )
( 327 )
( 328 )
( 329 )
( 330 )
( 331 )
( 332 )
( 333 )
( 334 )
( 335 )
( 336 )
( 337 )
( 338 )
( -339 340 )
( -339 341 )
( -339 342 )
( -339 343 )
( -339 344 )
( -339 345 )
( -339 346 )
( -339 347 )
( -339 348 )
( -339 349 )
( -339 350 )
( -339 351 )
( -339 352 )
( -339 353 )
( -339 354 )
( -339 355 )
( -339 341 )
( -339 347 )
( -339 353 )
( -339 356 )
( -339 343 )
( -339 349 )
( -339 357 )
( -339 358 )
( -339 345 )
( -339 350 )
( -339 359 )
( -339 354 )
( -339 360 )
( -339 361 )
( -339 362 )
( -339 363 )
( -339 364 )
( -339 365 )
( -339 366 )
( -339 367 )
( -339 368 )
( -339 369 )
( 339 -370 )
( -339 370 )
( 339 -371 )
( -339 371 )
( 339 -372 )
( -339 372 )
( 373 )
( 374 )
( 375 )
( 376 )
( 377 )
( 378 )
( 379 )
( 380 )
( 381 )
( 382 )
( 383 )
( 384 )
( -385 386 )
( -385 387 )
( -385 388 )
( -385 389 )
( -385 390 )
( -385 391 )
( -385 392 )
( -385 393 )
( -385 394 )
( -385 395 )
( -385 396 )
( -385 397 )
( -385 398 )
( -385 399 )
( -385 400 )
( -385 401 )
( -385 387 )
( -385 393 )
( -385 399 )
( -385 402 )
( -385 389 )
( -385 395 )
( -385 403 )
( -385 404 )
( -385 391 )
( -385 396 )
( -385 405 )
( -385 400 )
( -385 406 )
( -385 407 )
( -385 408 )
( -385 409 )
( -385 410 )
( -385 411 )
( -385 412 )
( -385 413 )
( -385 414 )
( -385 415 )
( 385 -416 )
( -385 416 )
( 385 -417 )
( -385 417 )
( 385 -418 )
( -385 418 )
( 419 )
( 420 )
( 421 )
( 422 )
( 423 )
( 424 )
( 425 )
( 426 )
( 427 )
( 428 )
( 429 )
( 430 )
( -431 432 )
( -431 433 )
( -431 434 )
( -431 435 )
( -431 436 )
( -431 437 )
( -431 438 )
( -431 439 )
( -431 440 )
( -431 441 )
( -431 442 )
( -431 443 )
( -431 444 )
( -431 445 )
( -431 446 )
( -431 447 )
( -431 433 )
( -431 439 )
( -431 445 )
( -431 448 )
( -431 435 )
( -431 441 )
( -431 449 )
( -431 450 )
( -431 437 )
( -431 442 )
( -431 451 )
( -431 446 )
( -431 452 )
( -431 453 )
( -431 454 )
( -431 455 )
( -431 456 )
( -431 457 )
( -431 458 )
( -431 459 )
( -431 460 )
( -431 461 )
( 431 -462 )
( -431 462 )
( 431 -463 )
( -431 463 )
( 431 -464 )
( -431 464 )
sat
