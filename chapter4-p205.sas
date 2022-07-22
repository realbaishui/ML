proc template;
define statgraph brokenaxis;
begingraph;
layout overlay/xaxisopts=(tickvalueattrs=(size=12) label="年龄" 
labelattrs=(size=12))  yaxisopts=(tickvalueattrs=(size=12) 
linearopts=(includeranges=(0-100000 280000-320000))  
label="男性人口" labelattrs=(size=12)) ; 
barchart category=age response=pop_m / dataskin=gloss barwidth=0.5;
/*barchart语句指定分类变量和分析变量，并设置宽度为0.5，色泽是gloss*/
endlayout;
endgraph;
end;
run;
proc sgrender data=ageg template= brokenaxis;
run;

