data fh;
input city: $18. zone$; /*在city后加了一个冒号*/
cards;
山东省蓬莱市 0536
山东省青岛市市南区 0532
;
proc print;
run;
