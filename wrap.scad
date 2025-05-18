// Spiral Wrap Gear Tool - OpenSCAD Design

$fn=100; // High-resolution circles

// === Parameters ===
gear_diameter = 80;
gear_thickness = 20;
slot_width = 4;
slot_length = 48;
shaft_diameter = 10;
cuff_diameter = 90;
cuff_height = 10;
shaft_clearance = 1;
flange_thickness = 5;
standoff_height = 2;

// === Modules ===
module gear_with_slot() {
    difference() {
        cylinder(d=gear_diameter, h=gear_thickness);
        translate([-(slot_length/2), -(slot_width/2), 0])
            cube([slot_length, slot_width, gear_thickness + 1]);
    }
}

module gear_with_hex_drive() {
    difference() {
        cylinder(d=gear_diameter, h=gear_thickness);
        translate([0,0,-1])
            rotate([0,0,30])
                cylinder(h=gear_thickness + 2, d=6.5, $fn=6); // Hex shaft socket
    }
}

module flange_base() {
    difference() {
        cylinder(d=cuff_diameter, h=flange_thickness);
        translate([0,0,-1])
            cylinder(d=shaft_diameter + 2*shaft_clearance, h=flange_thickness + 2);
    }
}

//module support_shaft() {
//    cylinder(d=shaft_diameter, h=gear_thickness + standoff_height);
//}

// === Assembly ===
translate([-45, 0, flange_thickness]) {
    gear_with_hex_drive();
}

translate([45, 0, flange_thickness]) {
    gear_with_slot();
}

// Standoffs to lift gears above flange
translate([-45, 0, 0])
    support_shaft();

translate([45, 0, 0])
    support_shaft();

// Flange base to hold shafts
//flange_base();