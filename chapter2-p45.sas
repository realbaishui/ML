data fsh;
input amount;
retain year 2000             /*对year赋初始值为2000*/
year+1;                    /*用累加语句指定year变量*/
total+amount;              /*用累加语句指定total变量*/
cards;
100
200
300
;
proc print;
run;
