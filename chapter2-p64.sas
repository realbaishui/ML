data phone;
input phone:&$20.;
phone1=compress(phone,"(-) ");     /*ȥ��type�е��ĸ��ַ���(-) ��*/
phone2=compress(phone,,"kd");     /*����type�е���������*/
cards;
(010)67658925
010-67665632
010 67685621
;
proc print;
run;
