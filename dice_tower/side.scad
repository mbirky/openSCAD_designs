// Matthew Birky
// 4/9/2018

include <measurements.scad>

difference() {
    cube([tower_z, tower_y, wall_thickness]);

    // The + 1 is to prevent clipping issues
    translate([tower_z - leg_height, leg_width, 0]) cube([leg_height + 1, tower_y - 2 * leg_width, wall_thickness + 1]);
}

/*
for(pos_y = connector_y_positions) {
    for(pos_x = connector_x_positions) {
        translate([pos_x, pos_y, wall_thickness]) {
            cylinder(connector_height, connector_r, connector_r);
        }
    }
}
*/
