proc format;                   /*�Զ���������Ҫ�������ʽgfmt*/
value gfmt 100-<200="100-199" 200-<300="200-299" 300-high=">=300";
run;
legend1 label=("����(��)");      /*��ͼ����ʾΪ������(��)�������Ǳ�����*/
proc gmap map=maps.china data=profit density=2;
id id;                 
prism profit/legend=legend1 discrete;          
/*����һ��Ҫ����discreteѡ���profit��Ϊ��ɢֵ��ʾ */
where id in (1,2,3,4,7,23,25);      /*����where���ѡ����ʡһ�е�id��*/
format profit gfmt.;             /*��profit�붨���gfmt��ʽ��������*/
run;

