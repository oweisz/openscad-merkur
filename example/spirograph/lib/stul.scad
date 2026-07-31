include <deska_vrt.scad>

module stul_sest(simple=true,sest=false){
    deska_vrt(simple);
    translate([0,0,sest?-20:-2])rotate([180,0,0])M2083();
    translate([0,0,sest?-35:1.6])rotate([-90,0,0])M1061();
    color("silver")for(i=[0,120,240])rotate([180,0,i])translate([20,0,sest?70:2.5])vrut_29();
    color("black")if(sest){
        translate([0,0,-40])axo(40,axo_z,.7);
        for(i=[0:120:360])rotate([180,0,i])translate([20,0,-5])axo(70,axo_z,0.7);
    }
}
//stul_sest(simple=true);

