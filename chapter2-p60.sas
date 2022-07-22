data computer;
input type$@@;
alpha=anyalpha(type);                    /*返回第1次出现字母的位置*/
digit=anydigit(type);                      /*返回第1次出现数字的位置*/
xh=substrn(type,alpha,digit-alpha);          /*提取type中的字母*/
bh=substrn(type,digit,length(type)-digit+1);   /*提取type中的数字*/
cards;
TP340 KS320 B3510 C560 H430
;
proc print;
run;
