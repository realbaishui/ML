data fh;
input name&:$50. city&:$50.;
cards;
Peter Parker 山东省 蓬莱市
Ross Geller 山东省 青岛市 市南区
;
proc print;
run;
