//Din Clip D20 (The fatty)
//https://www.winford.com/products/dinm12-15.php
//https://www.winford.com/products/cad/dinm15v2-rc_rev_a_dwg.pdf
$fn = 100;
deep = 6;
w = 48;
m = 50; //margin show all the things
module hole() {
    cylinder(h = deep + 0.3, r = 2.0);
}

module B(){
//Braket
difference() {
    cube([w, 68.5, deep]);

    translate([w/2, 7, -0.5])  hole();
    translate([5+5, 62.5, -0.5])  hole();
    translate([43-4, 62.5, -0.5]) hole();
}
}

module mkTR(){
//TR Bracket 
B();
difference(){
translate([0,0,deep])cube([w,68.5,deep]);
translate([10,10,deep])cube([w,68.5,deep]);
}

}
module mkTL(){
//TL Bracket 
B();
difference(){
translate([0,0,deep])cube([w,68.5,deep]);
translate([-10,10,deep])cube([w,68.5,deep]);
}
}
module mkBL(){
//BL Bracket 
B();
difference(){
translate([0,0,deep])cube([w,68.5,deep]);
translate([-10,-10,deep])cube([w,68.5,deep]);
}
}

module mkBR(){
//BR Bracket 
B();
difference(){
translate([0,0,deep])cube([w,68.5,deep]);
translate([10,-10,deep])cube([w,68.5,deep]);
}

}

module mkBC(){
//BC Bracket Bottom Center
B();
difference(){
translate([0,0,deep])cube([w,68.5,deep]);
translate([0,10,deep])cube([w,68.5,deep]);
}

}

module mkTC(){
//TC Bracket Top Center
B();
difference(){
translate([0,0,deep])cube([w,68.5,deep]);
translate([0,-10,deep])cube([w,68.5,deep]);
}
}


mkTR();
translate([m,0,0]) mkTL();
translate([m*2,0,0]) mkBL();
translate([m*3,0,0]) mkBR();
translate([m*4,0,0]) mkBC(); 
translate([m*5,0,0]) mkTC();
