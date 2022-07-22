data phone;
input phone:&$20.;
phone1=compress(phone,"(-) ");     /*去除type中的四个字符“(-) ”*/
phone2=compress(phone,,"kd");     /*保留type中的所有数字*/
cards;
(010)67658925
010-67665632
010 67685621
;
proc print;
run;
