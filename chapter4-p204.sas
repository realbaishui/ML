data ageg ;
input age$ pop_m;
cards;
<50 308681
>=50 74425
;
run;
proc template;
define statgraph bar;
begingraph;
layout overlay/xaxisopts=(tickvalueattrs=(size=12) label="����" 
labelattrs=(size=12))  yaxisopts=(tickvalueattrs=(size=12) 
linearopts=(includeranges=(0-320000))  label="�����˿�" 
labelattrs=(size=12)) ;
/*xaxisopts��yaxisopts�ֱ��趨���������ǩ���̶�ֵ��С�ͷ�Χ��*/
barchart category=age response=pop_m / dataskin=gloss barwidth=0.5;
/*barchart���ָ����������ͷ��������������ÿ��Ϊ0.5��ɫ����gloss*/
endlayout;
endgraph;
end;
run;
proc sgrender data=ageg template=bar;
run;
