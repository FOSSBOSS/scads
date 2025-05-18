/*
Ceaser Codex:
2 wheels of 26 letters
conical extrusions...?

*/
$fn = 100;
h = 10;
//make v shaped cylinders
aLow = 10;
ahig = 13;
blow = ahig;
bhig = aLow;

cylinder(h,aLow,ahig);
rotate([0,180,0])
translate([0,0,2*-aLow])
cylinder(h,aLow,ahig);
