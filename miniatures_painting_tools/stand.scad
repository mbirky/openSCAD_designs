include <../threads.scad>;
include <variables.scad>;

tread_width = 2;
tread_height = .4;

difference () {
    // Combine the main body with the attachment threads
    union () {
        // Create main body and hollow it out
        difference () {
            cylinder(h = height, d1 = top_d, d2 = bot_d);
            translate([0, 0, wall_thickness]) cylinder(h = height, d1 = top_d, d2 = bot_d);
        }

        // Create threading for attachments
        difference () {
            cylinder(h = thread_height + 1.5, d = top_d);
            translate([0, 0, 1]) metric_thread(thread_diameter_internal, thread_pitch, thread_height + 1, internal=true);
        }
    }


    // Cut off top so that treads can be added
    translate([0, 0, 0]) cylinder(tread_height, d = 50);
}

// Add treads and only keep the ones in the same area size as the top
intersection () {
    for(i =[-top_d / 2-tread_width / 2:tread_width * 2:top_d / 2]) {
        translate([i, -top_d / 2, 0]) cube([tread_width, top_d, tread_height]);
        translate([-top_d / 2, i, 0]) cube([top_d, tread_width, tread_height]);
    }

    cylinder(1, d = top_d);
}

// Add an outer ring to the top. This is mostly here to help with build plate adhesion.
difference () {
    cylinder(tread_height, d = top_d);
    cylinder(tread_height, d = top_d - 2);
}
