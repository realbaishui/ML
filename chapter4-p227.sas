legend1 down=10 label=("GDP(��Ԫ)") position=(middle right outside);
proc gmap map=chinacity data=gdp;
id name;               /*ָ��id����Ϊname�����ǵ�ͼ�ļ��е�id����*/
choro gdp/legend=legend1 levels=10;          /*��ͼ���ķ�10�������ʾ*/  
run;
