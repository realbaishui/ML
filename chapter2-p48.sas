data lx;
input id lx$;
if lx="��Ч" then lx2="��Ч";  
else lx2="��Ч+��Ч+Ȭ��";
cards;
1 ��Ч
2 ��Ч
3 ��Ч
4 Ȭ��
;
proc print;
run;
data lx;
input id lx$;
length lx2 $16.;
if lx="��Ч" then lx2="��Ч";  
else lx2="��Ч+��Ч+Ȭ��";
cards;
1 ��Ч
2 ��Ч
3 ��Ч
4 Ȭ��
;
proc print;
run;

