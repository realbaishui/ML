ods rtf file="g:\myods\bmi.rtf";       /*ָ������ļ�������ʽ��·��*/
proc print data=bmi;
where bmi>=30;
run;
ods rtf close;
