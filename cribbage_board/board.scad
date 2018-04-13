/****************************/
// Card Box
/****************************/
card_box_x = 94;
card_box_y = 67;
card_box_z = 22;

module card_box() {
    cube([card_box_x, card_box_y, card_box_z]);
}

/****************************/
// Magnent
/****************************/
magnent_height = 3;
magnent_diameter = 10.5;
magnent_radius = magnent_diameter / 2;

module magnent() {
    cylinder(magnent_height, d1=magnent_diameter, d2=magnent_diameter);
}

/****************************/
// Peg Cache
/****************************/
peg_cache_height = 40;
peg_cache_diameter = 14;

module peg_cache() {
    rotate([-90, 0, 0]) cylinder(peg_cache_height, d1 = peg_cache_diameter, d2 = peg_cache_diameter);
}

/****************************/
// Peg Hole
/****************************/
peg_depth = 3;
peg_radius = 1;
peg_diameter = peg_radius * 2;

module peg_hole() {
    cylinder(peg_depth, d1 = peg_diameter, d2 = peg_diameter);
}

/****************************/
// Side
/****************************/
wall_width = 1;
top_width = peg_depth + wall_width;
side_x = wall_width + magnent_diameter + wall_width + card_box_x + wall_width + peg_cache_diameter + wall_width;
side_y = wall_width + card_box_y + wall_width;
side_z = magnent_diameter + wall_width + wall_width;
side_z = card_box_z / 2 + top_width;

difference() {
    cube([side_x, side_y, side_z]);

    // Add peg spots
    for (y_lane = [1:7]) {
        if (y_lane !=3 && y_lane !=4 && y_lane !=5) {
            y_offset = (side_y - wall_width * 2) / 7 * y_lane - peg_diameter;
            for (i = [1:17]) {
                if (i != 6 && i != 12) {
                    translate([side_x / 19 * (i+1), y_offset, -0.1]) peg_hole();
                }
            }
        }
    }

    // Add Starting hole
    translate([side_x / 19, ((side_y - (wall_width * 2)) / 7) * 1.25, -0.1]) peg_hole();
    translate([side_x / 19, ((side_y - (wall_width * 2)) / 7) * 6.25, -0.1]) peg_hole();

    // add deck box hole
    translate([wall_width + magnent_diameter + wall_width, wall_width, top_width]) card_box();

    // add peg cache
    // x = wall_width + magnent_diameter + wall_width + card_box_x + wall_width
    translate([wall_width * 3 + magnent_diameter + card_box_x + peg_cache_diameter / 2, wall_width * 2 + magnent_diameter, side_z]) peg_cache();

    // Add magnents
    // End
    translate([side_x - magnent_height, magnent_radius + wall_width, magnent_radius + wall_width])rotate([0, 90, 0]) magnent();
    translate([side_x - magnent_height, side_y - (magnent_radius + wall_width), magnent_radius + wall_width])rotate([0, 90, 0]) magnent();
    // Left Side
    translate([wall_width + magnent_radius, wall_width + magnent_radius, side_z - magnent_height]) magnent();
    translate([wall_width + magnent_radius, side_y - (wall_width + magnent_radius), side_z - magnent_height]) magnent();
    // Right Side
    translate([side_x - (wall_width + magnent_radius) - magnent_height, wall_width + magnent_radius, side_z - magnent_height]) magnent();
    translate([side_x - (wall_width + magnent_radius) - magnent_height, side_y - (wall_width + magnent_radius), side_z - magnent_height]) magnent();
}
