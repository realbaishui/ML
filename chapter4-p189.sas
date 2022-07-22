proc sgplot data=sasuser.fbg noautolegend;    /*noautolegend表示不显示图例*/
symbolimage name=女 image="g:\female.jpg";
symbolimage name=男 image="g:\male.jpg";
styleattrs datasymbols=(女 男);
scatter x=height y=fbg/group=gender markerattrs=(size=30);
run;


