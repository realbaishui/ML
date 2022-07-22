data fh;
input count time;
cards;
1 23
2 29
3 49
4 64
5 87
;
run;
data fh;
do count=1 to 5;
input time;
output;
end;
cards;
23
29
49
64
87
;
run;
