; benchmark generated from python API
(set-info :status unknown)
(declare-fun change_feasible () Bool)
(declare-fun change_kid_6_feasible () Bool)
(declare-fun change_kid_5_feasible () Bool)
(declare-fun change_kid_4_feasible () Bool)
(declare-fun change_kid_3_feasible () Bool)
(declare-fun change_kid_2_feasible () Bool)
(declare-fun change_kid_1_feasible () Bool)
(declare-fun change_kid_0_feasible () Bool)
(declare-fun change_kid_6_width () Real)
(declare-fun change_kid_0_width () Real)
(declare-fun change_kid_5_width () Real)
(declare-fun change_kid_4_width () Real)
(declare-fun change_kid_3_width () Real)
(declare-fun change_kid_2_width () Real)
(declare-fun change_kid_1_width () Real)
(declare-fun change_kid_5_x () Real)
(declare-fun change_kid_6_x () Real)
(declare-fun change_kid_4_x () Real)
(declare-fun change_kid_3_x () Real)
(declare-fun change_kid_2_x () Real)
(declare-fun change_kid_1_x () Real)
(declare-fun change_kid_0_x () Real)
(declare-fun change_kid_6_y () Real)
(declare-fun change_hight () Real)
(declare-fun change_kid_6_hight () Real)
(declare-fun change_kid_5_hight () Real)
(declare-fun change_kid_5_y () Real)
(declare-fun change_kid_4_hight () Real)
(declare-fun change_kid_4_y () Real)
(declare-fun change_kid_3_hight () Real)
(declare-fun change_kid_3_y () Real)
(declare-fun change_kid_2_hight () Real)
(declare-fun change_kid_2_y () Real)
(declare-fun change_kid_1_y () Real)
(declare-fun change_kid_1_hight () Real)
(declare-fun change_kid_0_y () Real)
(declare-fun change_kid_0_hight () Real)
(declare-fun change_width () Real)
(assert
 (let (($x5609 (= change_kid_6_width 100.0)))
 (let (($x5608 (= change_kid_0_width 100.0)))
 (let (($x5607 (= change_kid_5_width 50.0)))
 (let (($x5606 (= change_kid_4_width 50.0)))
 (let (($x5605 (= change_kid_3_width 50.0)))
 (let (($x5604 (= change_kid_2_width 50.0)))
 (let (($x5603 (= change_kid_1_width 50.0)))
 (let (($x5602 (= (- (- change_kid_6_x change_kid_5_x) change_kid_5_width) 10.0)))
 (let (($x5599 (= (- (- change_kid_5_x change_kid_4_x) change_kid_4_width) 10.0)))
 (let (($x5596 (= (- (+ (- change_kid_3_x) change_kid_4_x) change_kid_3_width) 10.0)))
 (let (($x5592 (= (- (+ (- change_kid_2_width) change_kid_3_x) change_kid_2_x) 10.0)))
 (let (($x5588 (= (+ (- (- change_kid_1_x) change_kid_1_width) change_kid_2_x) 10.0)))
 (let (($x5584 (= (- (+ (- change_kid_0_x) change_kid_1_x) change_kid_0_width) 10.0)))
 (let (($x5580 (= (+ (- change_kid_6_hight change_hight) change_kid_6_y) (- 10.0))))
 (let (($x5577 (= (- (+ change_kid_5_y change_kid_5_hight) change_hight) (- 10.0))))
 (let (($x5574 (= (- (+ change_kid_4_y change_kid_4_hight) change_hight) (- 10.0))))
 (let (($x5571 (= (- (+ change_kid_3_y change_kid_3_hight) change_hight) (- 10.0))))
 (let (($x5568 (= (- (+ change_kid_2_y change_kid_2_hight) change_hight) (- 10.0))))
 (let (($x5565 (= (- (+ change_kid_1_hight change_kid_1_y) change_hight) (- 10.0))))
 (let (($x5562 (= (- (+ change_kid_0_hight change_kid_0_y) change_hight) (- 10.0))))
 (let (($x5559 (= change_kid_6_y 10.0)))
 (let (($x5558 (= change_kid_5_y 10.0)))
 (let (($x5557 (= change_kid_4_y 10.0)))
 (let (($x5556 (= change_kid_3_y 10.0)))
 (let (($x5555 (= change_kid_2_y 10.0)))
 (let (($x5554 (= change_kid_1_y 10.0)))
 (let (($x5553 (= change_kid_0_y 10.0)))
 (let (($x5552 (= (+ (+ (- change_width) change_kid_6_x) change_kid_6_width) (- 10.0))))
 (let (($x5548 (= change_kid_0_x 10.0)))
 (let (($x5547 (>= change_kid_6_hight 0.0)))
 (let (($x5546 (>= change_kid_6_width 0.0)))
 (let (($x5545 (>= change_kid_6_y 0.0)))
 (let (($x5544 (>= change_kid_6_x 0.0)))
 (let (($x5543 (>= change_kid_5_hight 0.0)))
 (let (($x5542 (>= change_kid_5_width 0.0)))
 (let (($x5541 (>= change_kid_5_y 0.0)))
 (let (($x5540 (>= change_kid_5_x 0.0)))
 (let (($x5539 (>= change_kid_4_hight 0.0)))
 (let (($x5538 (>= change_kid_4_width 0.0)))
 (let (($x5537 (>= change_kid_4_y 0.0)))
 (let (($x5536 (>= change_kid_4_x 0.0)))
 (let (($x5535 (>= change_kid_3_hight 0.0)))
 (let (($x5534 (>= change_kid_3_width 0.0)))
 (let (($x5533 (>= change_kid_3_y 0.0)))
 (let (($x5532 (>= change_kid_3_x 0.0)))
 (let (($x5531 (>= change_kid_2_hight 0.0)))
 (let (($x5530 (>= change_kid_2_width 0.0)))
 (let (($x5529 (>= change_kid_2_y 0.0)))
 (let (($x5528 (>= change_kid_2_x 0.0)))
 (let (($x5527 (>= change_kid_1_hight 0.0)))
 (let (($x5526 (>= change_kid_1_width 0.0)))
 (let (($x5525 (>= change_kid_1_y 0.0)))
 (let (($x5524 (>= change_kid_1_x 0.0)))
 (let (($x5523 (>= change_kid_0_hight 0.0)))
 (let (($x5522 (>= change_kid_0_width 0.0)))
 (let (($x5521 (>= change_kid_0_y 0.0)))
 (let (($x5520 (>= change_kid_0_x 0.0)))
 (and $x5520 $x5521 $x5522 $x5523 $x5524 $x5525 $x5526 $x5527 $x5528 $x5529 $x5530 $x5531 $x5532 $x5533 $x5534 $x5535 $x5536 $x5537 $x5538 $x5539 $x5540 $x5541 $x5542 $x5543 $x5544 $x5545 $x5546 $x5547 $x5548 $x5552 $x5553 $x5554 $x5555 $x5556 $x5557 $x5558 $x5559 $x5562 $x5565 $x5568 $x5571 $x5574 $x5577 $x5580 $x5584 $x5588 $x5592 $x5596 $x5599 $x5602 $x5603 $x5604 $x5605 $x5606 $x5607 $x5608 $x5609 change_kid_0_feasible change_kid_1_feasible change_kid_2_feasible change_kid_3_feasible change_kid_4_feasible change_kid_5_feasible change_kid_6_feasible change_feasible)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)

