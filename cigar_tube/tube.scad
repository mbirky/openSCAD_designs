include <../threads.scad>;
include <../triangles.scad>;

/*
Equilateral Triangle
	Create a Equilateral Triangle.

	l: Length of all sides (a, b & c)
	H: Triangle size will be based on the this 2D height
		When using H, l is ignored.
module Equilateral_Triangle(
			l=10, H=undef, height=1, heights=undef,
			center=undef, centerXYZ=[true,false,false])
{
	L = (H==undef)?l:H/sin(60);
	Triangle(a=L,b=L,angle=60,height=height, heights=heights,
				center=center, centerXYZ=centerXYZ);
}
translate([15,-25,0]) Equilateral_Triangle(l=20);
translate([-15,-25,0]) Equilateral_Triangle(H=20);
*/


difference() {
    union() {
        translate([0, 0, 167.3]) {
            metric_thread(32, 4, 12.7);
        }

        Equilateral_Triangle(l=60, height = 167.3, centerXYZ=[true, true, false]);
    }


    translate([0, 0, 2]) {
        // The +1 is for clipping issues
        cylinder(178 + 1, 12.7, 12.7, false);
    }
    translate([-30, 35.7, 76.3]) {
        // Making wider for cigar holding
        rotate([0, 90, 0]) cylinder(178, 14, 14, false);
    }
}
