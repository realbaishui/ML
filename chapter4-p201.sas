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
label bd="体型" gender="性别";   /*绘图时bd显示为体型，gender显示为性别*/
run;



