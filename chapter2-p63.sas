data computer;
input type$@@;
xh=compress(type,,"d");     /*ȥ��type�е���������*/
bh=compress(type,,"a");     /*ȥ��type�е�������ĸ*/
cards;
TP340 KS320 B3510 C560 H430
;
proc print;
run;
