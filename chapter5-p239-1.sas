proc tabulate;
class gender age bd;                  
table (gender="" all)*age="",(bd="����" all)*(n rowpctn)/ box="�Ա� ����"
misstext="ND";
keylabel n="����" rowpctn="����";
run;
