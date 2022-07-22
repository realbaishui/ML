proc report data=bmi nowd headline;
column gender age fbg bmi diagnosis; /*ָ�������ʾ��5������*/
define gender/width=10 order;      /*ָ��gender�п�Ϊ10����ʾ��ʽΪorder*/
define age/width=10 order;         /*ָ��age�п�Ϊ10����ʾ��ʽΪorder*/
define fbg/format=6.1;             /*ָ��fbg�������ʽΪ6.1*/
define bmi/format=6.2;            /*ָ��bmi�������ʽΪ6.2*/
define diagnosis/computed;         /*ָ��diagnosis����ʾ��ʽΪcomputed*/
where bmi>=27;                  /*����where�������bmi>=27�Ĺ۲�*/
compute diagnosis/char length=16;
if fbg.sum>=9 then diagnosis="�߶Ȼ�������";
else diagnosis ="";                /*����if�������diagnosis��ֵ*/
endcomp;
run;
