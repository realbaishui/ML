data dt;
input dt: ymddttm30.;           /*指定dt为ymddttmw.格式 */
date=datepart(dt);              /*提取dt的日期部分 */
time=timepart(dt);              /*提取dt的时间部分 */
month=month(date);            /*提取date的月 */
hour=hour(time);               /*提取time的小时 */
format dt datetime30.;           /*指定dt的输出格式为datetime30. */
format date yymmdd10.;         /*指定date的输出格式为yymmdd10. */
format time time12.;            /*指定time的输出格式为time12. */
cards;
2009/6/26:11:20:00
2009/5/5:19:30:00
2009/9/12:13:20:00
;
proc print;
run; 
