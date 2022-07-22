proc report nowd data=bmi headline;
column gender bd age,fbg,(n mean std);      /*�ö�������age��fbg��ͳ����*/
define gender/group width=4 "�Ա�";
define bd/group width=8 "����" order=internal;
define age/across width=8 "����";           /*��age����Ϊacross��ʾ��ʽ*/
define fbg/format=6.2 "�ո�Ѫ��";
define n/ "����" width=6 format=3.0 center;  /*��n��ʾΪ������������ʾ*/
define mean/ "��ֵ" center;                /*����ֵ������ʾ*/
define std/ "��׼��" center;                /*����׼�������ʾ*/
run;
