proc report nowd data=bmi headline;
column gender bd height weight;           /*指定输出显示的4个变量*/
define gender/group width=10;             /*指定gender的显示方式为group*/
define bd/group width=10 order=internal;    /*指定bd的显示方式为group*/
define height/analysis mean format=6.2;     /*指定height显示方式为analysis*/
define weight/ analysis mean format=6.2;    /*指定weight显示方式为analysis*/
run;

