ods html file="g:\myods\fbg.xls";     /*指定输出为xls后缀的文件*/
proc report data=bmi;              /*用report做一个简单的表*/
column gender age,fbg;
define gender/width=6 group;
define age/width=6 across;
define fbg/format=6.2 mean;
run;
ods html close;
ods pdf file="g:\myods\fbg.pdf";      /*指定输出为pdf后缀的文件*/
proc report data=bmi;               /*用report做一个简单的表*/
column gender age,fbg;
define gender/width=6 group;
define age/width=6 across;
define fbg/format=6.2 mean;
run;
ods pdf close;
