proc format;
picture pct low-high="000.00%";   /*ָ��pctΪ��%����λС�������ʾ��ʽ*/
run;
proc tabulate;
class gender age bd;                  
table (gender="" all)*age="",(bd="����" all)*(n*f=5.1 rowpctn*f=pct)/ box="�Ա� ����" misstext="ND";
keylabel n="����" rowpctn="����";
run;
