data dm;
input year profit;
plag=lag(profit);            /*返回profit变量的前一个记录 */
pdif=dif(profit);            /*返回profit变量当前记录与前一个记录的差值 */
pratio=profit/plag;          /*计算profit变量当前记录与前一个记录的比值 */
cards;
2008 989
2009 1002
2010 1023
2011 1022
2012 1065
2013 1112
;
proc print;
run;
