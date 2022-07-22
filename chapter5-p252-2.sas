proc report data=bmi nowd headline;
column fbg bmi ;                   /*指定输出显示的2个数值变量*/
define fbg/format=6.1;              /*指定fbg的输出格式为6.1*/
define bmi/format=6.2;             /*指定bmi的输出格式为6.2*/
where bmi>=27;                   /*利用where语句仅输出bmi>=27的观测*/
run;
