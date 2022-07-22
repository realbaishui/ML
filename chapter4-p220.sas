%annomac;
%maplabel (maps.china,hum,labelout,prov,id,font=Arial,color=red,size=2,hsys=3);
proc gmap map=maps.china data=hum;  
id id;
choro humidity/annotate=labelout;    
run;


