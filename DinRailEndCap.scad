/*
A end cap for 35mm din rail. intentionaly loose for poor cut tolerance
the mounting hole was intended to take a push in screw fitting to 
act like a set screw

min_height=7.52mm
width = 35 mm
railwidth = 5.1mm
inner = 24.4mm
rail_hole = 5.4mm
max_dist_zwichen_holes == 11.11mm
bogus_messy_end_length == 20mm
*/
$fn  = 100;
w=39;//35+4
h=9;
d = 20;
inner = 24;
deep = 5;
module hole() {
    cylinder(h = deep + 0.3, r = 2.0);
}
module body(){
union(){
difference(){

difference(){
cube([d,w,h], center = true);

cube([d,w-4,h-2], center = true);
}
translate([0,0,-2])cube([d,w-10,h-2], center = true);
}

cube([d,inner,h-2], center = true);
}
}

module clip(){
//clip
difference(){
translate([10,0,-2])cube([d,inner,3], center = true);
translate([15,0,-5])hole();
}}

//end_cap()
translate([-10,0,0])cube([d-18,w,h], center = true);

clip();
body();
