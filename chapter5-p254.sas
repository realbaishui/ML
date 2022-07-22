proc report data=bmi nowd headline;
column gender age fbg bmi ;
define gender/order width=10;
define age/order width=10;
define fbg/format=6.1 display;     /*ָ��fbg����ʾ��ʽΪdisplay*/
define bmi/format=6.2 display;    /*ָ��bmi����ʾ��ʽΪdisplay*/
compute fbg;
if fbg>=10 then 
call define(_row_, "style", "style=[backgroundcolor=green color=yellow]");
endcomp;
where bmi>=27;
run;
