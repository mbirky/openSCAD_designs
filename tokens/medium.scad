
radius = 12.5;
wall = 2;

difference() {
    cylinder(1.5, radius, radius);
    translate([0, 0, 1]) cylinder(1, radius - wall, radius - wall);
}
