//vrtane dno kosiku
//
module deska_vrt(simple=true){
  ha=3.05;
  color("brown")translate([0,0,-ha/2])difference(){
    cylinder(h=ha,d=225);
    if(!simple){
        for(i=[0:360/56:360])rotate([0,0,i])translate([105.5,0,-.1])cylinder(h=ha+.2,d=9);
        translate([0,0,-.1])cylinder(ha+.2,d=3.75);
        for(i=[0:120:360])rotate([0,0,i])translate([20,0,-.1])cylinder(h=ha+.2,d=2);
    }
    else;
  }
}
