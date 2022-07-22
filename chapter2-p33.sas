data dat;
input date1:yymmdd10. date2:yymmdd10. date3:yymmdd10.;
format date1 yymmdd10. date2 yymmdds8. date3 yymmddp8.;
cards;
13.06.16 130616 20130616
;
proc print;
run;
