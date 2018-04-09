include <../threads.scad>;

difference() {
    cylinder(14.7, 18, 18, false);

    translate([0, 0, 2]) {
        // +1 for clipping issues
        metric_thread(33, 4, 12.7 + 1, internal=true);
    }
}
