proc sgplot data=sasuser.price noautolegend;    /*noautolegend��ʾ����ʾͼ��*/
symbolimage name=price1 image="g:\house.jpg";
symbolimage name=salary1 image="g:\rmb.jpg";
vline year/ response=price markers markerattrs=(symbol=price1 size=35);
vline year/ response=salary markers markerattrs=(symbol=salary1 size=35);
xaxis label="���";
yaxis label="�����빤��" values=((0 to 20000 by 2000));
where city="����";
run;

