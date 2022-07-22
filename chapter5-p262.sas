proc report nowd data=bmi headline;
column gender age,fbg,(mean std);            /*用逗号连接age和fbg及统计量*/
define gender/group width=4 "性别";          /*将gender显示为性别*/
define age/across width=8 "年龄";             /*将age显示为年龄*/
define fbg/analysis format=6.2 "空腹血糖";     /*将fbg显示为空腹血糖*/
define mean/ "均值";                        /*将mean显示为均值*/
define std/ "标准差";                        /*将std显示为标准差*/
run;
