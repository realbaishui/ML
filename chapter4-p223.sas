legend1 label=("����(��)");        /*��ͼ����ʾΪ������(��)�������Ǳ�����*/
proc gmap map=maps.china data=profit density=2;
/* density���ñ߽���̶ܳ�Ϊ2������Ϊ��ɢ*/
id id;                 
prism profit/legend=legend1 midpoints=150 250 350 range; 
where id in (1,2,3,4,7,23,25);       /*����where���ѡ����ʡһ�е�id��*/
run;

