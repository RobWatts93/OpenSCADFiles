// KuatRackPedal

handleLength = 120;
pedalLength = 75;
bevel = 2;
innerThickness = 25;
thickness = innerThickness - 2*bevel;
width = 10;
eqTriA = sqrt(pow(handleLength,2)/2); // length of the equilateral triangle side A from the handle length.
hexWidth = 14;
hexSide = 8.1;

difference() {
union() {
// Handle
hull() {
    rotate([90, 0, -135]) cylinder(handleLength, bevel,bevel);
    translate([0, 0, thickness]) rotate([90, 0, -135]) cylinder(handleLength, bevel,bevel);
    translate([0,0,-bevel]) cylinder(innerThickness, bevel, bevel);
    translate([-eqTriA, eqTriA, 0]) cylinder(thickness, bevel, bevel);
    
    translate([0,width,0]) {
        rotate([90, 0, -135]) cylinder(handleLength, bevel,bevel);
        translate([0, 0, thickness]) rotate([90, 0, -135]) cylinder(handleLength, bevel,bevel);
        translate([0,0,-bevel]) cylinder(innerThickness, bevel, bevel);
        translate([-eqTriA, eqTriA, 0]) cylinder(thickness, bevel, bevel);
    }
};

// Pedal
hull() {
    translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(pedalLength, bevel,bevel);
    translate([0, 0, thickness]) rotate([90, 0, 90]) cylinder(pedalLength, bevel,bevel);
    translate([0,0,-bevel]) cylinder(innerThickness, bevel, bevel);
    translate([pedalLength, 0, 0]) cylinder(thickness, bevel, bevel);
    
    translate([0, width, 0]) {
        translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(pedalLength, bevel,bevel);
        translate([0, 0, thickness]) rotate([90, 0, 90]) cylinder(pedalLength, bevel,bevel);
        translate([0,0,-bevel]) cylinder(innerThickness, bevel, bevel);
        translate([pedalLength, 0, 0]) cylinder(thickness, bevel, bevel);
    }
};

// Support
hull() {
    translate([50, width-2, -bevel]) cylinder(innerThickness, 1, 1);
    translate([-60, 60, -bevel]) cylinder(innerThickness, 1, 1);
    translate([0, 0, -bevel]) cylinder(innerThickness, 1, 1);
};

};

// Axis 

translate([3,15,-bevel]) {
    rotate([0,0,45]) union() {
        translate([-hexWidth/2, -hexSide/2,-1]) cube([hexWidth,hexSide,13]);
        rotate([0,0, 120]) translate([-hexWidth/2, -hexSide/2,-1]) cube([hexWidth,hexSide,13]);
        rotate([0,0, 240]) translate([-hexWidth/2, -hexSide/2,-1]) cube([hexWidth,hexSide,13]);
        cylinder(30, 4,4);
    }
}

}







