proc report data=bmi nowd headline;
column gender age fbg bmi ;        /*ָ�������ʾ��4������*/
define gender/width=10;            /*ָ��gender�еĿ��Ϊ10*/
define age/width=10;               /*ָ��age�еĿ��Ϊ10*/
define fbg/format=6.1;              /*ָ��fbg�������ʽΪ6.1*/
define bmi/format=6.2;             /*ָ��bmi�������ʽΪ6.2*/
where bmi>=27;                   /*����where�������bmi>=27�Ĺ۲�*/
run;
