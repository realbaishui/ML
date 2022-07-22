data age;
input id birth: yymmdd10. death: yymmdd10.;
age=(death-birth)/365;
if age<60 then age1=50;
else if age<70 then age1=60;
else age1=70;
format birth death yymmdd10.;
cards;
1 1954-12-06 2014-02-03
2 1938-02-18 2014-01-07
3 1947-07-10 2014-01-11
4 1943-08-21 2014-03-03
;
proc print;
run;
