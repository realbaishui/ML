proc report nowd data=bmi headline;
column gender age,fbg,(mean std);            /*�ö�������age��fbg��ͳ����*/
define gender/group width=4 "�Ա�";          /*��gender��ʾΪ�Ա�*/
define age/across width=8 "����";             /*��age��ʾΪ����*/
define fbg/analysis format=6.2 "�ո�Ѫ��";     /*��fbg��ʾΪ�ո�Ѫ��*/
define mean/ "��ֵ";                        /*��mean��ʾΪ��ֵ*/
define std/ "��׼��";                        /*��std��ʾΪ��׼��*/
run;
