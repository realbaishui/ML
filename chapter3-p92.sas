data ab2;
set sasuser.a2(in=a) sasuser.b2(in=b);
a2=a; /*����ʱ����a��ֵ��ֵ������a2*/
b2=b; /*����ʱ����b��ֵ��ֵ������b2*/
proc print;
run;
