data lx;
input id lx$;
lx1=lx in ("��Ч","��Ч","Ȭ��");
if lx in ("��Ч","��Ч","Ȭ��") then lx2="��Ч";else lx2="��Ч";
cards;
1 ��Ч
2 ��Ч
3 ��Ч
4 Ȭ��
;
proc print;
run;
