proc tabulate;
class gender age bd;                  
table gender*age,bd*(n rowpctn)/nocellmerge;   /*nocellmergeȡ����Ԫ��ϲ�*/
label gender="�Ա�" age="����" bd="����";   /*ָ���������ı�ǩ*/
keylabel n="����" rowpctn="����";           /*ָ���ؼ��ʵı�ǩ*/
run;
