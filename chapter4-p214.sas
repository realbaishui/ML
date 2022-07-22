data hfm;
do city="重庆","北京";
do month="Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct",
 "Nov","Dec";           /*利用两个do循环输入数据*/
input hfm@@;
output;
end;
end;
cards;
2.50	1.25	4.55	14.24 14.21 10.5	5.91	 1.24  2.06	3.86	5.01	4.52
0.78	0.76	6.14	24.71 53.77 67.73	47.26 19.37 15.28	9.88	9.11	3.96
;
proc gradar;
chart month/sumvar=hfm calendar overlayvar=city nlevels=7 noframe; 
run;
