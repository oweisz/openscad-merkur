//include <openscad-merkur/merkur.scad>
//include <lib/vrut29.scad>
include <openscad-merkur/merkur_bosl2.scad>
include <lib/vrut29-bosl2.scad>
include <lib/prevody.scad>
//include <lib/sasi.scad>
//include <lib/stylus.scad>

prevod09(2,mux=true);
translate([0,40,18])color(c=[.9,.5,.5,.2])hr_guma(1);
translate([0,40,18])color(c=[.9,.5,.5,.2])hr_guma(3);

hr_sv3(pre=false,mux=true);
//color(c=[.9,.5,.5,.2])render()prevod17(true);
//sasi800();

$fn=50;
$vpt=[ -25.72, -7.66, 84.73 ];
$vpr=[50,0,130];
$vpd=900;

