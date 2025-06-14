//IFixit plastic tipped tweezer replacement tips, and notes.
module tw(){
difference(){
difference(){
difference(){

difference(){
cylinder(34,3.6,1.125);
translate([-7,1,0])
cube([15,15,35]);
}

translate([-7,-16,0])
cube([15,15,35]);
}


$fn=10;
translate([0,1.5,10.0])
rotate([90,0,0]) cylinder(3,0.75,0.75);
}
$fn=10;
translate([0,1.5,1.5])
#rotate([90,0,0]) cylinder(3,0.75,0.75);
}
}
//// the ubutment piece...
module ub(){
difference(){
translate([0,0,0])
difference(){
 cylinder(34,3.6,1.125);
translate([-5,-6,0]) cube([9,15,14]);
}


translate([-4,0,0])
cube([9,6,35]);
}
}

tw();
ub();

// AT 2MM theres a hole in the center, and at 10mm holes are ~0.75mm radius
// An ubutment ridge is 14mm up from base.
// OK I fixxed it.
