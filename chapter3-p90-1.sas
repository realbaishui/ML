data ab1;
set sasuser.a1 sasuser.b1(rename=(ht=height wt=weight));
proc print;
run;
