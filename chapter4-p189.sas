proc sgplot data=sasuser.fbg noautolegend;    /*noautolegend��ʾ����ʾͼ��*/
symbolimage name=Ů image="g:\female.jpg";
symbolimage name=�� image="g:\male.jpg";
styleattrs datasymbols=(Ů ��);
scatter x=height y=fbg/group=gender markerattrs=(size=30);
run;


