data bmi;
set sasuser.fbg;
bmi=weight/(height/100)**2;       /*����weight��height�����±���bmi*/
length bd $8.;                    /*ָ���±���bd�ĳ���Ϊ8*/
if bmi<18.5 then bd="ƫ��";
else if bmi<24 then bd="����";
else if bmi<27 then bd="ƫ��";
else if bmi<30 then bd="����";
else bd="�ضȷ���";              /*����bmiֵ�����������bd*/
run;
proc template;            /*����ģ����ͼ����*/
define statgraph pie;       /*ָ��������ģ������Ϊbar*/
begingraph;              /*�̶���䣬��ʾ��ʼ��ͼ*/
layout region;             /*layoutָ����ʾ��ʽΪregion*/
piechart category=bd/group=gender start=90 dataskin=crisp stat=pct;
endlayout;              /*�̶���䣬����layout����ǰ���layout��Ӧ*/
endgraph;              /*�̶���䣬����graph����ǰ���begingraph��Ӧ*/
end;                   /*�̶���䣬������ͼ*/
run;
proc sgrender data=bmi template=pie; 
run;


