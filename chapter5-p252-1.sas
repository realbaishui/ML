proc report data=bmi nowd headline;
column gender age fbg bmi ;        /*指定输出显示的4个变量*/
define gender/width=10;            /*指定gender列的宽度为10*/
define age/width=10;               /*指定age列的宽度为10*/
define fbg/format=6.1;              /*指定fbg的输出格式为6.1*/
define bmi/format=6.2;             /*指定bmi的输出格式为6.2*/
where bmi>=27;                   /*利用where语句仅输出bmi>=27的观测*/
run;
