data lx;
input id lx$;
lx1=tranwrd(lx,"��Ч","��Ч");      /*��lx�����е���Ч�滻Ϊ��Ч*/
lx1=tranwrd(lx1,"Ȭ��","��Ч");     /*��lx1�����е�Ȭ���滻Ϊ��Ч*/
cards;
1 ��Ч
2 ��Ч
3 ��Ч
4 Ȭ��
;
proc print;
run;
