proc means data=sim nway completetypes noprint;
class height weight;
var height;
output out=count(keep=height weight count) n=count;
run;
proc template; 
define statgraph bihistogram; 
begingraph; 
layout overlay3d / cube=false zaxisopts=(griddisplay=on);
bihistogram3dparm x=height y=weight z=count/display=all; 
endlayout; 
endgraph; 
end; 
run; 
proc sgrender data=count template=bihistogram;
run;

