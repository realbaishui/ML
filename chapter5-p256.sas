proc sort data=bmi;              
by gender;                        /*先按gender排序，以便后面使用by语句*/
run;
proc report data=bmi nowd headline;
column gender age fbg bmi bmi=bmin; /*指定输出显示的5个变量*/
define gender/width=10 order;       /*指定gender列宽为10，显示方式为order*/
define age/width=10 order;          /*指定age列宽为10，显示方式为order*/
define fbg/format=6.1;              /*指定fbg的输出格式为6.1*/
define bmi/format=6.2;             /*指定bmi的输出格式为6.2*/
define bmin/noprint n;             /*将bmin显示为例数，并抑制其显示*/
where bmi>=27;                  /*利用where语句仅输出bmi>=27的观测*/
by gender;                       /*按gender分别显示男性和女性两个表*/
compute after;
line "BMI>=27的例数为"bmin;
endcomp;
run;
