proc report nowd data=bmi headline;
column gender bd fbg,(mean std median qrange);
define gender/group width=6;
define bd/group width=8 order=internal;
define fbg/analysis format=6.2;
compute after gender;                /*��gender�·�������������*/
line @1 gender$ "�ľ�ֵ�ͱ�׼��ֱ�Ϊ" fbg.mean 6.2 "��" fbg.std 6.2;
line @2 gender$ "����λ�����ķ�λ�����ֱ�Ϊ" fbg.median 6.2 "��" 
fbg.qrange 6.2;
endcomp;
run;
