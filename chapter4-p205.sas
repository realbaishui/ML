proc template;
define statgraph brokenaxis;
begingraph;
layout overlay/xaxisopts=(tickvalueattrs=(size=12) label="����" 
labelattrs=(size=12))  yaxisopts=(tickvalueattrs=(size=12) 
linearopts=(includeranges=(0-100000 280000-320000))  
label="�����˿�" labelattrs=(size=12)) ; 
barchart category=age response=pop_m / dataskin=gloss barwidth=0.5;
/*barchart���ָ����������ͷ��������������ÿ��Ϊ0.5��ɫ����gloss*/
endlayout;
endgraph;
end;
run;
proc sgrender data=ageg template= brokenaxis;
run;

