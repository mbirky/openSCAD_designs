// Spheres for grip
translate([0, 0, 2.5]) sphere(d = 5);
translate([0, 0, 8.5]) sphere(d = 5);
translate([0, 0, 14.5]) sphere(d = 5);

// main shaft
translate([0, 0, 2]) cylinder(25.75, 1.5, 1.5);

// point
translate([0, 0, 27.75]) cylinder(1, 1, 1);
translate([0, 0, 28.75]) cylinder(1, 1, 0.5);
