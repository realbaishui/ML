proc report data=bmi nowd headline;
column gender age fbg bmi ;        /*指定输出显示的4个变量*/
define gender/width=10 order;      /*指定gender列宽为10，显示方式为order*/
define age/width=10 order;         /*指定age列宽为10，显示方式为order*/
define fbg/format=6.1;              /*指定fbg的输出格式为6.1*/
define bmi/format=6.2;             /*指定bmi的输出格式为6.2*/
where bmi>=27;                   /*利用where语句仅输出bmi>=27的观测*/
run;
