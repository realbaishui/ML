ods rtf file="g:\myods\bmi1.rtf" style=fgs bodytitle startpage=never;       
proc tabulate data=bmi;
class gender bd;       
var fbg;              
table fbg*(n mean std) bd*(n colpctn),gender=""/ misstext="--";
label fbg="Ѫ��" gender="�Ա�" bd="����";                
keylabel n="����" mean="����" std="��׼��" colpctn="�ٷֱ�(%)";     
title "��1 ����������ϱȽ�";
run;
ods rtf close;