// Parameters
ring_thickness = 10;    // Thickness of the ring (radial)
ring_height = 5;       // Height of the ring
letter_count = 26;
angle_step = 360 / letter_count;
font_size = 6;
font_name = "Liberation Sans";  // Change if needed
text_depth = 1.0;  // How deep the engraving goes

module ring_with_letters(ring_radius) {
    difference() {
        // Base ring
        cylinder(h = ring_height, r = ring_radius + ring_thickness / 2, $fn = 200);
        //r = ring_radius + ring_thickness / 2;
        //echo ("outer ", r);
        cylinder(h = ring_height + 1, r = ring_radius - ring_thickness / 2, $fn = 200);
        //r = ring_radius - ring_thickness / 2;
        //echo ("inner ", r);
        // Engraved letters (subtracted)
        for (i = [0 : letter_count - 1]) {
            angle = i * angle_step;
            letter = chr(65 + i);  // 65 = 'A'

            rotate([0, 0, angle])
            translate([ring_radius, 0, ring_height - text_depth])  // Start near top
            rotate([0, 0, 0])
            linear_extrude(height = text_depth)
                text(letter, size = font_size, font = font_name, halign = "center", valign = "bottom");
        }
    }
}

// Example usage
ring_with_letters(50);
ring_with_letters(39.9);
