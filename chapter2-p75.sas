data date;
input year1$ month1$ day1$ year2$ month2$ day2$;
date1=catx("/",year1,month1,day1);    
date2=catx("/",year2,month2,day2);   
d1=input(date1,yymmdd10.);      /*将date1按yymmdd10.的格式转为日期型 */
d2=input(date2,yymmdd10.);      /*将date2按yymmdd10.的格式转为日期型 */
format d1 d2 yymmdd8.;    
dif=d2-d1;
cards;
2013 05 21 2014 03 11
2013 03 10 2014 01 22
2013 06 05 2014 05 06
2013 07 08 2014 04 13
;
proc print;
run;

