data profit;
input prov$ id profit;
cards;
���� 1 178.4
�㽭 2 279.2
���� 3 154.4
���� 4 239.1
���� 7 166.5
�Ϻ� 23 341.1
ɽ�� 25 213.5
;	
run;
%annomac;
%maplabel (maps.china,profit,labelout,prov,id,font=Arial,color=red,size=3,hsys=3);
proc gmap map=maps.china data=profit;
id id;                           
choro profit/annotate=labelout;          
where id in (1,2,3,4,7,23,25);       /*����where���ѡ����ʡһ�е�id��*/
run;

