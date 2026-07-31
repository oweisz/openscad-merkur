include <openscad-merkur/merkur_bosl2.scad>
include <lib/stylus.scad>

rameno101(mont=false,pos=5);
//pomocna pozice
color(c=[.9,.5,.5,.2])translate([0,-80,12])import("lib/vyloznik-lozisko.stl");
//sipka
color("orange")translate([9,0,-30])rotate([90,0,0]){
  cylinder(h=5,d1=0,d2=5);
  translate([0,0,5])cylinder(h=60,d=2);
  translate([0,0,65])cylinder(h=5,d1=5,d2=0);
}
$fn=50;
$vpt=[ -2.51, -112.26, 41.63 ];
$vpr=[110,0,122];
$vpd=600;
