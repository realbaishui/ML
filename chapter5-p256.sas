proc sort data=bmi;              
by gender;                        /*�Ȱ�gender�����Ա����ʹ��by���*/
run;
proc report data=bmi nowd headline;
column gender age fbg bmi bmi=bmin; /*ָ�������ʾ��5������*/
define gender/width=10 order;       /*ָ��gender�п�Ϊ10����ʾ��ʽΪorder*/
define age/width=10 order;          /*ָ��age�п�Ϊ10����ʾ��ʽΪorder*/
define fbg/format=6.1;              /*ָ��fbg�������ʽΪ6.1*/
define bmi/format=6.2;             /*ָ��bmi�������ʽΪ6.2*/
define bmin/noprint n;             /*��bmin��ʾΪ����������������ʾ*/
where bmi>=27;                  /*����where�������bmi>=27�Ĺ۲�*/
by gender;                       /*��gender�ֱ���ʾ���Ժ�Ů��������*/
compute after;
line "BMI>=27������Ϊ"bmin;
endcomp;
run;
