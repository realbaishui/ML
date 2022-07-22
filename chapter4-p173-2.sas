proc sgplot data=sasuser.pop;
vline age/response=pop_m legendlabel="����������" lineattrs=(color=green pattern=2 thickness=10); /*���Ƶ�һ����ͼ*/
vline age/response=mor_m legendlabel="���Է�����" lineattrs=(color=orange pattern=34
thickness=10) y2axis; /*���Ƶڶ�����ͼ*/
xaxis discreteorder=data label="�����";
yaxis values=(0 to 65000 by 5000) label="����������"; /*ָ�����y��̶Ⱥͱ�ǩ*/
y2axis values=(0 to 200 by 20) label="���Է�����"; /*ָ���ұ�y��̶Ⱥͱ�ǩ*/
keylegend /location=inside down=2 position=top;
/*ָ��ͼ����ʾ��ͼ�ڣ�λ�������Ϸ�����������ʾ*/
run;
