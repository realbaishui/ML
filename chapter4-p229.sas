legend1 label=("�˾�GDP(Ԫ)");
proc gmap map=sdcity data=sdpgdp;     
id name;                   /*ָ��id����Ϊname */
area pgdp /legend=legend1;   /*ָ��ƽ��ͼ��GDP�Ĳ�ͬˮƽ��ʾ��ͬ��ɫ*/
block pgdp /legend=legend1;  /*ָ����ͬ����GDPֵ��ʾ��ͬ���Ӹ߶Ⱥ���ɫ*/
run;
