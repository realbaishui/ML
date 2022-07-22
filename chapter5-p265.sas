ods rtf file="g:\myods\bmi.rtf";       /*指定输出文件名、格式及路径*/
proc print data=bmi;
where bmi>=30;
run;
ods rtf close;
