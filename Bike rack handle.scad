// Thule 2" Lift Handle

width = 45;
bodyWidth = 43;

length = 60;

edgeBevel = 2.5;

//cube([45,45,45]);

module innerBody() {
  translate([-bodyWidth/2, 0, 0]) 
    
  difference() {
    hull() {
        translate([edgeBevel, 0, edgeBevel]) 
        rotate([-90, 0, 0]) 
        cylinder(length,edgeBevel,edgeBevel);

        translate([bodyWidth - edgeBevel, 0, bodyWidth - edgeBevel]) 
        rotate([-90, 0, 0]) 
        cylinder(length,edgeBevel,edgeBevel);

        translate([edgeBevel, 0, bodyWidth - edgeBevel]) 
        rotate([-90, 0, 0]) 
        cylinder(length,edgeBevel,edgeBevel);

        translate([bodyWidth - edgeBevel, 0, edgeBevel]) 
        rotate([-90, 0, 0]) 
        cylinder(length,edgeBevel,edgeBevel);
    }

    // remove the pin hole
    //color("#AA0000") translate([-0.5, bodyWidth, bodyWidth/2]) rotate([0,90,0]) cylinder(bodyWidth + 1, 7.5, 7.5);
 
  }
}


module handle() {
    hull() {
        translate([-width/2, 0, 0])  
        hull() {

            translate([edgeBevel, -1, edgeBevel]) 
            rotate([-90, 0, 0]) 
            cylinder(1,edgeBevel,edgeBevel);

            translate([width - edgeBevel, -1, width - edgeBevel]) 
            rotate([-90, 0, 0]) 
            cylinder(1,edgeBevel,edgeBevel);

            translate([edgeBevel, -1, width - edgeBevel]) 
            rotate([-90, 0, 0]) 
            cylinder(1,edgeBevel,edgeBevel);

            translate([width - edgeBevel, -1, edgeBevel]) 
            rotate([-90, 0, 0]) 
            cylinder(1,edgeBevel,edgeBevel);
        }
        
        translate([-45,-60,0]) cylinder(30, 15, 15);
        translate([45,-60,0]) cylinder(30, 15, 15);
    }
}

difference() {
    union() {
        handle();
        innerBody();
    }
    
    translate([0, -20, -1])
    color("#00aa00")
    scale([0.65,0.5,2]) 
        handle();

    
}


    





