proc tabulate formchar=" ----------" noseps;
class gender bd;       
var fbg;              
table fbg*(n mean std) bd*(n colpctn),gender/ misstext="--";
label fbg="Ѫ��" gender="�Ա�" bd="����";                
keylabel n="����" mean="����" std="��׼��" colpctn="�ٷֱ�(%)";     
run;
