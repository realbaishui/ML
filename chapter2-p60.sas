data computer;
input type$@@;
alpha=anyalpha(type);                    /*���ص�1�γ�����ĸ��λ��*/
digit=anydigit(type);                      /*���ص�1�γ������ֵ�λ��*/
xh=substrn(type,alpha,digit-alpha);          /*��ȡtype�е���ĸ*/
bh=substrn(type,digit,length(type)-digit+1);   /*��ȡtype�е�����*/
cards;
TP340 KS320 B3510 C560 H430
;
proc print;
run;
