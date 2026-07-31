//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>
include <lib/prevody.scad>
//include <lib/sasi.scad>
//include <lib/stylus.scad>
//include <lib/vrut29-bosl2.scad>
//include <lib/vrut29.scad>

module hr3_pom(){
    translate([0,0,162])rotate([180,0,0]){
      //M2083();
      translate([10,0,0]){
            translate([0,0,30])M1055(50);
            translate([0,0,-23])M1051();
            translate([0,0,-16])M2050();
      }
}}

rotate([0,-90,0]){
    hr_sv3m(mont=true,poz=false);
    color(c=[.9,.5,.5,.2])render(convexity = 2)hr3_pom();
    color("black")translate([10,0,128])axo(62,axo_z,.5);
 }

$fn=50;
$vpt=[ -98.44, -0.70, 3.61 ];
$vpr=[55,0,20];
$vpd=250;
