data profit;
input prov$ id profit;
cards;
安徽 1 178.4
浙江 2 279.2
江西 3 154.4
江苏 4 239.1
福建 7 166.5
上海 23 341.1
山东 25 213.5
;	
run;
%annomac;
%maplabel (maps.china,profit,labelout,prov,id,font=Arial,color=red,size=3,hsys=3);
proc gmap map=maps.china data=profit;
id id;                           
choro profit/annotate=labelout;          
where id in (1,2,3,4,7,23,25);       /*利用where语句选择六省一市的id号*/
run;

