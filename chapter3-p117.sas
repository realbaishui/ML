%let data=sasuser.xb;               /*�˴���Ϊ�Լ������ݼ�*/
%let id=id;                        /*�˴���Ϊ���ݼ��б�ʾid�ŵı���*/
%macro outline(var=,low=,high=);
data outline;
set &data.(keep=&id. &var.);
length variable $20. reason $20.;
variable="&var.";
value=&var.;
if &var.<&low. and not missing(&var.) then do;
reason="����";
output;
end;
else if &var.>&high. and not missing(&var.) then do;
reason="����";
output;
end;
drop &var.;
proc append base=outliner1 data=outline;
run;
%mend outline;
%outline(var=height,low=150,high=200);
%outline(var=weight,low=40,high=100);
%outline(var=y1,low=1,high=5);
%outline(var=y2,low=1,high=5);
%outline(var=y3,low=1,high=5);
%outline(var=y4,low=1,high=5);
%outline(var=y5,low=1,high=5);
proc print data=outliner1;
run;
