data sim;
do i=1 to 5000;
height=rand("normal",170,10);  /*������̬�ֲ��ı�������ֵΪ170����׼��Ϊ10*/
weight=rand("normal",70,5);    /*������̬�ֲ��ı�������ֵΪ70����׼��Ϊ5*/
height=round(height,1);         /*��������������Ϊ����*/
weight=round(weight,1);
output;
end;
run;


