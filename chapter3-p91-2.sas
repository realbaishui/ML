data sasuser.b2;             /*�½����ݼ�sasuser.b2*/
set sasuser.b2;               /*��ԭ���ݼ�sasuser.b2���Ƶ��µ�sasuser.b2��*/
time1=input(time,yymmdd10.); /*��timeתΪ��ֵ�ͣ�����ֵ���±���time1*/
format time1 yymmdd10.;      /*ָ��time1�������ʽ*/
drop time;                   /*ɾ������time*/
rename time1=time;           /*�ѱ���time1����Ϊtime*/
run;
