data sasuser.b2;             /*新建数据集sasuser.b2*/
set sasuser.b2;               /*把原数据集sasuser.b2复制到新的sasuser.b2中*/
time1=input(time,yymmdd10.); /*把time转为数值型，并赋值给新变量time1*/
format time1 yymmdd10.;      /*指定time1的输出格式*/
drop time;                   /*删除变量time*/
rename time1=time;           /*把变量time1改名为time*/
run;
