#!/usr/bin/env python3
import sys
import math
import re
from pathlib import Path

VALID_UNITS = ['mm', 'cm', 'in']
'''
# prolly ought to makesure there are vectors in the svg. if there isnt, this will fail.

Other notes:
might do well to make the translations programtic functions based on the other Variables. 

Box offset Y-axis is 0 to make your box set flat. 
'''
def extract_dimensions(svg_path):
    with open(svg_path, 'r') as f:
        svg_content = f.read()

    width_match = re.search(r'width="([\d.]+)(mm|cm|in)"', svg_content)
    height_match = re.search(r'height="([\d.]+)(mm|cm|in)"', svg_content)

    if not width_match or not height_match:
        print("SVG must have width and height with physical units (mm, cm, or in).")
        sys.exit(1)

    width_val, width_unit = float(width_match[1]), width_match[2]
    height_val, height_unit = float(height_match[1]), height_match[2]

    if width_unit != height_unit:
        print("Width and height must use the same unit.")
        sys.exit(1)

    # Convert all to mm because thats what openscad uses.
    conversion = {
        "mm": 1,
        "cm": 10,
        "in": 25.4
    }
    unit = width_unit
    width_mm = width_val * conversion[unit]
    height_mm = height_val * conversion[unit]

    return width_mm, height_mm

def generate_openscad(svg_path, width, height):
    linear_extrusion = math.sqrt(width * height)
    hole_width = width - 10
    hole_height = height 
    hole_depth = linear_extrusion - 10
    inner_holeD = hole_depth - 10
    inner_holeW = hole_width - 10
    inner_holeH = height - 10 
    scad_code = f"""
// Auto-generated OpenSCAD from {Path(svg_path).name}
difference() {{
    linear_extrude(height = {linear_extrusion:.2f})
        import("{svg_path}");

    // Centered hole inside the extrusion
    translate([5, 0, 5])
        cube([{hole_width:.2f}, {hole_height:.2f}, {hole_depth:.2f}]);
}}
// Hollow box
difference() {{
    translate([5, 5, 5])
        cube([{hole_width:.2f}, {hole_height:.2f}, {hole_depth:.2f}]);

    translate([10,15,10])
        cube([{inner_holeW:.2f}, {inner_holeH:.2f}, {inner_holeD:.2f}]);
}}


"""
    return scad_code



def main():
    if len(sys.argv) != 2:
        print("Usage: python3 generate_trough_scad.py <input.svg>")
        sys.exit(1)

    svg_path = sys.argv[1]
    if not Path(svg_path).exists():
        print(f"File not found: {svg_path}")
        sys.exit(1)

    width, height = extract_dimensions(svg_path)
    scad_code = generate_openscad(svg_path, width, height)

    output_path = Path(svg_path).with_suffix(".scad")
    with open(output_path, "w") as f:
        f.write(scad_code)

    print(f"OpenSCAD file written to: {output_path}")

if __name__ == "__main__":
    main()
