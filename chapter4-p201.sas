proc template;
define statgraph mosaic;
begingraph;
layout region;
mosaicplotparm category=(gender bd) count=count/ insidevalueattrs =(size=12) 
labelattrs=(size=12) valueattrs =(size=12) colorgroup=bd;
endlayout;
endgraph;
end;
run;
proc sgrender data=bmi1 template=mosaic;
label bd="����" gender="�Ա�";   /*��ͼʱbd��ʾΪ���ͣ�gender��ʾΪ�Ա�*/
run;



