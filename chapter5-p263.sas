proc report nowd data=bmi headline;
column gender bd age,fbg,(n mean std);      /*用逗号连接age和fbg及统计量*/
define gender/group width=4 "性别";
define bd/group width=8 "体型" order=internal;
define age/across width=8 "年龄";           /*将age定义为across显示方式*/
define fbg/format=6.2 "空腹血糖";
define n/ "例数" width=6 format=3.0 center;  /*将n显示为整数，居中显示*/
define mean/ "均值" center;                /*将均值居中显示*/
define std/ "标准差" center;                /*将标准差居中显示*/
run;
