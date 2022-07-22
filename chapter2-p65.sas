data code;
input prov$ city$ county$;
code1=cats(prov,city,county);
code2=catx("-",prov,city,county);
code3=prov||city||county;
cards;
37 05 02
37 03 21
37 06 13
37 06 85
;
proc print;
run;
