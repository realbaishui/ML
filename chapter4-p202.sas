proc means data=bmi nway;
class gender age bd; /*ָ�������������gender��age��bd*/
var bmi;
output out=bmi1 n=count;
proc print data=bmi2;
run;

proc template;
define statgraph mosaic;
begingraph;
layout region;
mosaicplotparm category=(gender bd age) count=count/ insidevalueattrs =(size=12) 
labelattrs=(size=12) valueattrs =(size=12) colorgroup=bd;
endlayout;
endgraph;
end;
run;
proc sgrender data=bmi2 template=mosaic;
label bd="����" gender="�Ա�"  age="����";       /*Ϊ3������ָ����ǩ*/
run;
