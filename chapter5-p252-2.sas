proc report data=bmi nowd headline;
column fbg bmi ;                   /*ָ�������ʾ��2����ֵ����*/
define fbg/format=6.1;              /*ָ��fbg�������ʽΪ6.1*/
define bmi/format=6.2;             /*ָ��bmi�������ʽΪ6.2*/
where bmi>=27;                   /*����where�������bmi>=27�Ĺ۲�*/
run;
