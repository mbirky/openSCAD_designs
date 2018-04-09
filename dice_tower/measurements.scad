tower_x = 50;
tower_y = 50;
tower_z = 125;
wall_thickness = 2;

leg_height = 4;
leg_width = 4;

/*
connector_r = 1;
connector_height = 2;
connector_y_positions = [tower_y - wall_thickness - connector_r - 2, wall_thickness + connector_r + 2];
connector_x_positions = [5, tower_z / 2, tower_z - leg_height - 4];
*/

magnent_diameter = 10.5;

module magnent() {
    translate([0, 0, -1]) cylinder(4, d1=magnent_diameter, d2 = magnent_diameter);
}
