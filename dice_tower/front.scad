include <measurements.scad>

mag_wall_thickness = 5;
mag_wall_height = magnent_diameter + 2;

difference() {
    union() {
        cube([tower_z, tower_x, wall_thickness]);
        translate([tower_z - mag_wall_height, 0, 0]) cube([mag_wall_height, tower_x, mag_wall_thickness]);
        translate([0, tower_x / 2 - mag_wall_height / 2, 0]) cube([mag_wall_height, mag_wall_height, mag_wall_thickness]);
        
        translate([0, 0, 1]) {
            rotate([0, 30, 0]) cube([wall_thickness, tower_x, tower_y / 2 * 1.1547]);

            translate([tower_z / 2, 0, 0]) rotate([0, 30, 0]) cube([wall_thickness, tower_x, tower_y / 2 * 1.1547]);
        }
    }

    // the opening for the dice
    // The +1 is for clipping issues
    translate([tower_z - tower_z / 4 - mag_wall_height, wall_thickness, 0]) {
        cube([tower_z / 4, tower_x - wall_thickness * 2, wall_thickness + 1]);
    }

    // The holes for magnents
    translate([tower_z - mag_wall_height /2, magnent_diameter / 2 + wall_thickness, 0]) magnent();
    translate([tower_z - mag_wall_height /2, tower_x - (magnent_diameter / 2 + wall_thickness), 0]) magnent();
    translate([mag_wall_height / 2, tower_x / 2, 0]) magnent();
}

