proc template;
define statgraph pie;
begingraph;
layout region;                    
piechart category=bd response=fbg/group=gender dataskin=sheen stat=mean;
endlayout;
endgraph;
end;
run;
proc sgrender data=bmi template=pie;
run;



