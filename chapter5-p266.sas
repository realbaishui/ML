ods html file="g:\myods\fbg.xls";     /*ָ�����Ϊxls��׺���ļ�*/
proc report data=bmi;              /*��report��һ���򵥵ı�*/
column gender age,fbg;
define gender/width=6 group;
define age/width=6 across;
define fbg/format=6.2 mean;
run;
ods html close;
ods pdf file="g:\myods\fbg.pdf";      /*ָ�����Ϊpdf��׺���ļ�*/
proc report data=bmi;               /*��report��һ���򵥵ı�*/
column gender age,fbg;
define gender/width=6 group;
define age/width=6 across;
define fbg/format=6.2 mean;
run;
ods pdf close;
