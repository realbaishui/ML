data ques;
input id (y1-y10) ($);      /*输入变量y1-y10，均为字符型，统一加上$符号 */
y=cats(of y1-y10);        /*将y1-y10合并为一个变量y */
cy=count(y,"y","i");      /*统计变量y中的“y”的个数，忽略大小写 */
cn=count(y,"n","i");      /*统计变量y中的“n”的个数，忽略大小写 */
cards;
1 y y n Y n y n Y n n
2 y n y Y n y y Y n y
3 n y N y y y n Y y n
4 n n Y y y y N Y n y
;
proc print;
run;
