data outline;
set sasuser.xb;
if (age^=. and(age<18 or age>50)) | (height^=. and(height<150 or height>200))
| (weight^=. and(weight<40 or weight>100)) | (gender not in(1,2,.))
| y1 not in (1,2,3,4,5,.) | y2 not in (1,2,3,4,5,.) | y3 not in (1,2,3,4,5,.)
| y4 not in (1,2,3,4,5,.) | y5 not in (1,2,3,4,5,.);
proc print;
run;
