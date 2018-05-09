include <../threads.scad>;

cap_radius = 18;
cap_thickness = 2;
thread_height = 12.7;

difference() {
    cylinder(cap_radius + cap_thickness + thread_height, cap_radius, cap_radius, false);

    translate([0, 0, cap_radius + cap_thickness]) {
        // +1 for clipping issues
        metric_thread(33, 4, thread_height + 1, internal=true);
    }

    rotate([90, 0, 0]) cylinder(40, cap_radius, cap_radius, true);

    translate([-20, -20, 0]) cube([40, 40, cap_radius / 2]);
}
