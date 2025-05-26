$fn =100;
d = 5.3; // plate depth
w = 76.75;
u = w/2;

difference(){
cube([w,d,210]);
translate([39.88,d,41.5]){
rotate([90,0,0])
    cylinder(h = d+2, r1 = 2.5, r2 = 2.5, $fn = 100);
}
translate([28.5,d,190.48]){
rotate([90,0,0])
    cylinder(h = d+2, r1 = 2.5, r2 = 2.5, $fn = 100);
}
}
//
difference(){

translate([w/2,0,0]){
cylinder(h = d, r1 = w/2, r2 = w/2, $fn = 100);
}

translate([0,-u,0])
cube([w,u,d+1]);
}