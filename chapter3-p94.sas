data ab;
merge ab1 ab2;
by id; /*ָ����id���������������ݼ�*/
drop a2 b2; /*ɾ������a2��b2*/
proc print;
run;
