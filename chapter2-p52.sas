data score;
input gender$ id score;
cards;
M 1 86
M 2 90
M 3 83
M 4 79
F 1 85
F 2 93
F 3 90
;
proc print;
run;
data score;
input gender$ n@;
do id=1 to n;
input score@@;
output;
end;
cards;
M 4 86 90 83 79
F 3 85 93 90
;
proc print;
run;
