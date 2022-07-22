data computer;
input type$@@;
xh=compress(type,,"d");     /*去除type中的所有数字*/
bh=compress(type,,"a");     /*去除type中的所有字母*/
cards;
TP340 KS320 B3510 C560 H430
;
proc print;
run;
