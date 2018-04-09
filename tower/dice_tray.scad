Length = 131;
Width = 55;
Height = 67.2;
edge_thickness = 2;
bottom_thickness = 4;
edge_height = 5;

mag_height = 3 + 1; // The 1 is to prevent clipping
mag_radius = 5.25;

difference() {
    // The outer shell of the box
    cube([Length, Width, Height]);
    
    translate([edge_thickness, edge_thickness, bottom_thickness]) {
        cube([Length-(edge_thickness*2), Width-(edge_thickness*2), Height]);
    }

    // Prevent clipping by translating y -1 and making width +2
    translate([0, -1, edge_height + bottom_thickness]) {
        cube([Length-edge_thickness, Width + 2, Height]);
    }

    // Add in the magnent spots
    translate([Length - edge_thickness - 1.6 - mag_radius, 35 + edge_thickness + mag_radius + 1, bottom_thickness - mag_height + 1]) {
        cylinder(mag_height, mag_radius, mag_radius);
    }

    translate([Length - edge_thickness - 1.6 - mag_radius, edge_thickness + 1.7 + mag_radius + 1, bottom_thickness - mag_height + 1]) {
        cylinder(mag_height, mag_radius, mag_radius);
    }

    translate([Length - 41.5 - (edge_thickness + mag_radius), 35 + edge_thickness + mag_radius + 1, bottom_thickness - mag_height + 1]) {
        cylinder(mag_height, mag_radius, mag_radius);
    }

    translate([Length - 41.5 - (edge_thickness + mag_radius), edge_thickness + 1.7 + mag_radius + 1, bottom_thickness - mag_height + 1]) {
        cylinder(mag_height, mag_radius, mag_radius);
    }
}
