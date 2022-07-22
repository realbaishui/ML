proc report data=bmi nowd headline;
column gender age fbg bmi diagnosis; /*指定输出显示的5个变量*/
define gender/width=10 order;      /*指定gender列宽为10，显示方式为order*/
define age/width=10 order;         /*指定age列宽为10，显示方式为order*/
define fbg/format=6.1;             /*指定fbg的输出格式为6.1*/
define bmi/format=6.2;            /*指定bmi的输出格式为6.2*/
define diagnosis/computed;         /*指定diagnosis的显示形式为computed*/
where bmi>=27;                  /*利用where语句仅输出bmi>=27的观测*/
compute diagnosis/char length=16;
if fbg.sum>=9 then diagnosis="高度怀疑糖尿病";
else diagnosis ="";                /*利用if语句生成diagnosis的值*/
endcomp;
run;
