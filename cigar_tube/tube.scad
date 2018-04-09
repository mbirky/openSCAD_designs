include <../threads.scad>;
include <../triangles.scad>;

tube_diameter = 32;
tube_height = 180;
thread_height = 12.7;
bottom_thickness = 2;
inside_diameter = 25.4;

difference() {
    union() {
        translate([0, 0, tube_height - thread_height]) {
            metric_thread(tube_diameter, 4, thread_height);
        }

        cylinder(tube_height - thread_height, d1 = tube_diameter, d2 = tube_diameter);
    }


    translate([0, 0, bottom_thickness]) {
        // The +1 is for clipping issues
        cylinder(tube_height, d1 = inside_diameter, d2 = inside_diameter);
    }
}
