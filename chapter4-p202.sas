proc means data=bmi nway;
class gender age bd; /*指定分类变量包括gender、age和bd*/
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
label bd="体型" gender="性别"  age="年龄";       /*为3个变量指定标签*/
run;
