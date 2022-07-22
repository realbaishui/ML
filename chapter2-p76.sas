data date;
input year1$ month1$ day1$ year2$ month2$ day2$;
date1=cats(year1,month1,day1);    
date2=cats(year2,month2,day2);   
d1=input(date1,yymmdd10.);    /*将date1按yymmdd10.的格式转为日期型 */
d2=input(date2,yymmdd10.);    /*将date2按yymmdd10.的格式转为日期型 */
d3=input(date1,8.);            /*将date1按8.的格式转为数值型 */
d4=input(date2,8.);            /*将date2按8.的格式转为数值型 */
format d1 d2 yymmdd10.;      
dif1=d2-d1;
dif2=d4-d3;
cards;
2013 05 21 2014 03 11
;
proc print;
run;
