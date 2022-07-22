data bmi;
input category$ upper_bmi lower_bmi wt;
lower_ht=(wt/lower_bmi)**.5;
upper_ht=(wt/upper_bmi)**.5;
cards;
偏瘦 1 18.5 40
偏瘦 1 18.5 60
偏瘦 1 18.5 80
偏瘦 1 18.5 100
正常 18.5 24.0 40
正常 18.5 24.0 60
正常 18.5 24.0 80
正常 18.5 24.0 100
偏胖 24.0 27.0 40
偏胖 24.0 27.0 60
偏胖 24.0 27.0 80
偏胖 24.0 27.0 100
肥胖 27.0 30.0 40
肥胖 27.0 30.0 60
肥胖 27.0 30.0 80
肥胖 27.0 30.0 100
重度肥胖 30.0 50.0 40
重度肥胖 30.0 50.0 60
重度肥胖 30.0 50.0 80
重度肥胖 30.0 50.0 100
;
proc sgplot data=bmi;
band x=wt upper=upper_ht lower=lower_ht /group=category;
xaxis values=(40 to 100 by 10) label="体重(kg)"; /*指定x轴的刻度值和标题*/
yaxis values=(1.5 to 2 by 0.1) label="身高(m)"; /*指定y轴的刻度值和标题*/
keylegend / position=right down=6; /*指定图例显示位置和行数*/
run;
