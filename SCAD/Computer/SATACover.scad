length = 72;
width = 21;
height = 14;
thickness = 1;
portWidth = 14;
portHeight = 7;
xPortOffset = 4.5;
yPortOffset = 4;

// Shell with ports
 


union() {
    difference() { 
        cube([length, width, height]);
        
        translate([thickness,thickness,thickness])
        cube([(length - thickness*2), 100, (height - thickness*2)]);
        
        xPortOffsetMirror = (length - xPortOffset - portWidth);
        
        translate([xPortOffsetMirror, -50, yPortOffset])
        cube([portWidth,100, portHeight]);
    };
    
    // clips
    translate([length - 5, width-1, 0])
    cube([2,1,2]);
    
    translate([5 - 2, width-1, 0])
    cube([2,1,2]);
    
    translate([length / 2 -1, width-1, 0])
    cube([2,1,2]);    
    
}


