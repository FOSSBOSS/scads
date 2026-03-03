/*
Von Karman  cone based spiral wrap tool*/
// Cone Parameters
length = 100;  
radius = 20;       
slices = 200;   
$fn = 100;          
module von_karman_cone(length=100, radius = 20) {
    rotate_extrude()
    polygon(points = concat(
        [ [0, 0] ], // tip of axis
        [ for (i = [0 : slices])
            let (
                x = i / slices,
                z = x * length,
                r = radius * sqrt(x) * (1 - (1/3) * x)
            )
            [r, z]
        ],
        [ [0, length] ] // close axis at the top
    ));
}


// Hull shape module
module hullz(length = 1, w = 3, h = 1) {
    radius = w / 2;

    rotate([90, 90, 0]) {
        hull() {
            translate([-length / 2, 0, 0])
                cylinder(h = h, r = radius, $fn = 32);
            translate([length / 2, 0, 0])
                cylinder(h = h, r = radius, $fn = 32);
        }
    }
}


von_karman_cone();
//hull as scafold
rotate([0,0,90])translate([0,-10,87])
hullz(20,6,20);
translate([30,0,20])
von_karman_cone(80,10);

