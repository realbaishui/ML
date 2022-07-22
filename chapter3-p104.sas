data patients;
input id gender age time yymmdd10. sbp;
format time yymmdd10.;
cards;
1 1 51 2010/01/12 150
1 1 51 2010/02/12 147
1 1 51 2010/03/14 142
2 2 59 2010/01/09 163
2 2 59 2010/02/10 162
2 2 59 2010/03/17 160
2 2 59 2010/04/16 151
;
proc sort;      
by id time;                   /*按id和time升序排序 */
run;
data patients;
set patients;
by id;
retain firstsbp;               /*利用retain语句让firstsbp保留上个观测值 */
if first.id then firstsbp=sbp;    /*对每个人的第一个观测，将sbp值赋给firstsbp */
difsbp=sbp-firstsbp;          /*计算每次测量值与首次测量值的差值 */
proc print;
run;
