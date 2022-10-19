//!OpenSCAD

difference() {
  union(){
    translate([12.5, 29, 12.5]){
      rotate([90, 0, 90]){
        // torus
        rotate_extrude($fn=8) {
          translate([4, 0, 0]) {
            circle(r=3, $fn=16);
          }
        }
      }
    }
    // RELOAD: Tapon_Kayak (1).STL
    
    difference() {
        //translate ([12.5,30,12.5]) rotate([180,0,0])
        import("C:/Users/Bob/Documents/3D Printing/SCAD/Kayak/Tapon_Kayak.stl");
        cube([60,10,60]);
    }
    translate([10, 2.2, 0]){
      color([1,0.8,0]) {
        hull() {
            intersection() {
              translate([2.5, 10, 12.5]){
                rotate([90, 0, 0]){
                  cylinder(r1=12.5, r2=12.5, h=10, center=false);
                }
              }

              translate([-2.5, 0, 0]){
                cube([10, 8, 25], center=false);
              }

            }
            translate([8-1.5,-1,2])
            sphere(1);
            
            translate([-1.5,-1,2])
            sphere(1);
            
            translate([8-1.5,-1,23])
            sphere(1);
            
            translate([-1.5,-1,23])
            sphere(1);
        }
      }
    }
  }


    translate([12.5, 10, 12.5]){
        scale([2.5, 1, 1.5]){
            sphere(r=3.5);
        }
    }
  
    translate([12.5, 30, 13]){
        scale([2.0, .75, 1]){
            sphere(r=3.5);
        }
    }
}