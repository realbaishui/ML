proc sgplot data=sasuser.pop;
vline age/response=pop_m legendlabel="����������"; /*���Ƶ�һ����ͼ*/
vline age/response=mor_m y2axis legendlabel="���Է�����" ; /*���Ƶڶ�����ͼ*/
xaxis discreteorder=data label="�����";
yaxis values=(0 to 65000 by 5000) label="����������"; /*ָ�����y��̶Ⱥͱ�ǩ*/
y2axis values=(0 to 200 by 20) label="���Է�����"; /*ָ���ұ�y��̶Ⱥͱ�ǩ*/
keylegend /location=inside down=2 position=top;
/*ָ��ͼ����ʾ��ͼ�ڣ�λ�������Ϸ�����������ʾ*/
run;
