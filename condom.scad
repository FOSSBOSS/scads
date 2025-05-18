$fn = 500;

x=0;
y=0;
z=45;
//rotate(x,y,z);
difference(){
  cylinder(63,27.5,27.5,center=true);
  cylinder(63,6,6,center=true);
}
/*
i = 27.5;
o = 36;
h = 66;
translate([66,0,0]){
difference(){
  cylinder(h,o,o,center=true);
  cylinder(h,i,i,center=true);
}}
*/