proc format;
value bdfmt 0="ƫ��" 1="����" 2="ƫ��" 3="����" 4="�ضȷ���";
run;
data bmi;
set sasuser.fbg;
bmi=weight/(height/100)**2;       /*����weight��height�����±���bmi*/
if bmi<18.5 then bd=0;
else if bmi<24 then bd=1;
else if bmi<27 then bd=2;
else if bmi<30 then bd=3;
else bd=4;                       /*����bmiֵ�����������bd*/
format bd bdfmt.;                /*������bd���ʽ����bdfmt��������*/
run;
