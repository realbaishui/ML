data date;
input year1$ month1$ day1$ year2$ month2$ day2$;
date1=cats(year1,month1,day1);    
date2=cats(year2,month2,day2);   
d1=input(date1,yymmdd10.);    /*��date1��yymmdd10.�ĸ�ʽתΪ������ */
d2=input(date2,yymmdd10.);    /*��date2��yymmdd10.�ĸ�ʽתΪ������ */
d3=input(date1,8.);            /*��date1��8.�ĸ�ʽתΪ��ֵ�� */
d4=input(date2,8.);            /*��date2��8.�ĸ�ʽתΪ��ֵ�� */
format d1 d2 yymmdd10.;      
dif1=d2-d1;
dif2=d4-d3;
cards;
2013 05 21 2014 03 11
;
proc print;
run;
