data date;
input year1$ month1$ day1$ year2$ month2$ day2$;
date1=mdy(month1,day1,year1);   
date2=mdy(month2,day2,year2);   
format date1 date2 yymmdd10.;    
ydif=yrdif(date1,date2,"actual");     /*计算以年为单位的日期差值*/
ddif=datdif(date1,date2,"actual");    /*计算以天为单位的日期差值*/
cards;
2013 05 21 2014 03 11
2013 03 10 2014 01 22
2013 06 05 2014 05 06
2013 07 08 2014 04 13
;
proc print;
run;
