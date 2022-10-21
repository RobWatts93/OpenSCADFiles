    
// LeafieldValveWrench

thickness = 3;
socketH = 4;
//socketExternalRadius = 48.9 / 2;
socketExternalRadius = 50/2;
socketInternalRadius = 35/2;
socketTooth = 15;
toolR = 35;
toolHandle = 100;

difference() { 
    
hull() {
    cylinder(thickness, toolR, toolR);
    
    translate([toolHandle, 0,0])
    cylinder(thickness, 15, 15);
}

intersection() {

    cylinder(socketH, socketExternalRadius, socketExternalRadius);

    union() {
        cylinder(socketH, socketInternalRadius, socketInternalRadius);
        
        translate([socketExternalRadius - socketTooth/2,0,0])
        translate([-socketTooth/2, -socketTooth/2, 0])
        cube([socketTooth, socketTooth, socketH]);

        rotate([0,0,60])
        translate([socketExternalRadius - socketTooth/2,0,0])
        translate([-socketTooth/2, -socketTooth/2, 0])
        cube([socketTooth, socketTooth, socketH]);

        rotate([0,0,120])
        translate([socketExternalRadius - socketTooth/2,0,0])
        translate([-socketTooth/2, -socketTooth/2, 0])
        cube([socketTooth, socketTooth, socketH]);

        rotate([0,0,180])
        translate([socketExternalRadius - socketTooth/2,0,0])
        translate([-socketTooth/2, -socketTooth/2, 0])
        cube([socketTooth, socketTooth, socketH]);

        rotate([0,0,240])
        translate([socketExternalRadius - socketTooth/2,0,0])
        translate([-socketTooth/2, -socketTooth/2, 0])
        cube([socketTooth, socketTooth, socketH]);

        rotate([0,0,300])
        translate([socketExternalRadius - socketTooth/2,0,0])
        translate([-socketTooth/2, -socketTooth/2, 0])
        cube([socketTooth, socketTooth, socketH]);

    }
}
}


