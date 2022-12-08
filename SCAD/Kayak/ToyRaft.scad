length = 156;
width = 76.5;
tubeR = 9.5;
tubeCenterToCenter = 57.5;
straightSectionL = 72;
thwartD = 12;
thwartL = 38;
bowRise = 10.5;
bowTubeR = 8.5;
bowTubeL = 10;
corner1XOffset = (length-straightSectionL)/3 + straightSectionL/2;
corner2XOffset = (length-straightSectionL)/2/3 + straightSectionL/2;
corner1YOffset = (width-bowTubeL)/2/3 + bowTubeL/2 - 2;
corner2YOffset = (width-bowTubeL)/3 + bowTubeL/2 - 2;
cornerTubeR = 9;

thwartW = 38;
thwartR = 6;
thwartX = [straightSectionL/2-thwartR, 0, -straightSectionL/2+thwartR];

// the floor length divided by the base diameter of it's parts is 20, so the arrays have 20 values each.
floorW = [20,28,32,38,38,38,38,38,38,38,38,38,38,38,38,38,38,32,28,20];
floorZ = [6,4.5,3,1.5,0,0,0,0,0,0,0,0,0,0,0,0,1.5,3,4.5,6];
floorL = 120;
floorR = 3;

union(){
    
// thwarts
for(i=[0:2]) {
    hull() {
        translate([thwartX[i], thwartW/2, (tubeR*2)-thwartR])
        sphere(thwartR);
        translate([thwartX[i], -thwartW/2, (tubeR*2)-thwartR])
        sphere(thwartR);
    }
}
    
// floor
for(i=[0:19]) {
    hull() {
        translate([(-1*floorL/2 + (i*floorR*2)+floorR), floorW[i]/2, floorZ[i]+floorR])
        scale([2,1,1])
        sphere(floorR);
        translate([(-1*floorL/2 + (i*floorR*2)+floorR), -floorW[i]/2, floorZ[i]+floorR])
        scale([2,1,1])
        sphere(floorR);
    }
}
    
// bow tube
hull() {
    circle(bowTubeR, (length/2 - bowTubeR), bowTubeL/2, bowRise, 90);
    circle(bowTubeR, (length/2 - bowTubeR), -bowTubeL/2, bowRise, 90);
}

// bow left corner #1
hull() {
    circle(bowTubeR, (length/2 - bowTubeR), bowTubeL/2, bowRise, 90);
    circle(cornerTubeR, corner1XOffset, corner1YOffset, 2*bowRise/3, -60);
}

// bow left corner #2
hull() {
    circle(cornerTubeR, corner1XOffset, corner1YOffset, 2*bowRise/3, -60);
    circle(tubeR, corner2XOffset, corner2YOffset, bowRise/3, -30);
}

// bow left corner #3
hull() {
    circle(tubeR, corner2XOffset, corner2YOffset, bowRise/3, -30);
    circle(tubeR, straightSectionL/2, tubeCenterToCenter/2, 0, 0);
}

// bow right corner #1
hull() {
    circle(bowTubeR, (length/2 - bowTubeR), -bowTubeL/2, bowRise, 90);
    circle(cornerTubeR, corner1XOffset, -corner1YOffset, 2*bowRise/3, 60);
}

// bow right corner #2
hull() {
    circle(cornerTubeR, corner1XOffset, -corner1YOffset, 2*bowRise/3, 60);
    circle(tubeR, corner2XOffset, -corner2YOffset, bowRise/3, 30);
}

// bow right corner #3
hull() {
    circle(tubeR, corner2XOffset, -corner2YOffset, bowRise/3, 30);
    circle(tubeR, straightSectionL/2, -tubeCenterToCenter/2, 0, 0);
}

//left side tube
hull() {
    circle(tubeR, straightSectionL/2, tubeCenterToCenter/2, 0, 0);
    circle(tubeR, -straightSectionL/2, tubeCenterToCenter/2, 0, 0);
}

// right side tube
hull() {
    circle(tubeR, straightSectionL/2, -tubeCenterToCenter/2, 0, 0);
    circle(tubeR, -straightSectionL/2, -tubeCenterToCenter/2, 0, 0);
}



// stern left corner #1
hull() {
    circle(bowTubeR, -(length/2 - bowTubeR), -bowTubeL/2, bowRise, 90);
    circle(cornerTubeR, -corner1XOffset, -corner1YOffset, 2*bowRise/3, -60);
}

// stern left corner #2
hull() {
    circle(cornerTubeR, -corner1XOffset, -corner1YOffset, 2*bowRise/3, -60);
    circle(tubeR, -corner2XOffset, -corner2YOffset, bowRise/3, -30);
}

// stern left corner #3
hull() {
    circle(tubeR, -corner2XOffset, -corner2YOffset, bowRise/3, -30);
    circle(tubeR, -straightSectionL/2, -tubeCenterToCenter/2, 0, 0);
}

// stern right corner #1
hull() {
    circle(bowTubeR, -(length/2 - bowTubeR), bowTubeL/2, bowRise, 90);
    circle(cornerTubeR, -corner1XOffset, corner1YOffset, 2*bowRise/3, 60);
}

// stern right corner #2
hull() {
    circle(cornerTubeR, -corner1XOffset, corner1YOffset, 2*bowRise/3, 60);
    circle(tubeR, -corner2XOffset, corner2YOffset, bowRise/3, 30);
}

// stern right corner #3
hull() {
    circle(tubeR, -corner2XOffset, corner2YOffset, bowRise/3, 30);
    circle(tubeR, -straightSectionL/2, tubeCenterToCenter/2, 0, 0);
}

// stern tube
hull() {
    circle(bowTubeR, -(length/2 - bowTubeR), bowTubeL/2, bowRise, 90);
    circle(bowTubeR, -(length/2 - bowTubeR), -bowTubeL/2, bowRise, 90);
}
}


/// write a very thin disk to an arbitrary location. then hull the disks together to create conjoined cylinders /// 
module circle(R, xShift, yShift, zShift, zRotate) {
    //shift
    translate([xShift,yShift,zShift])
    rotate([0,0,zRotate])
    //center
    translate([0,0,R])
    rotate([0,90,0])
    cylinder(0.01, R, R);
}

