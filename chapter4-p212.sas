proc gradar data=finance;
chart item/sumvar=index overlayvar=class spiderweb noframe cstars=(red,black);
run;
