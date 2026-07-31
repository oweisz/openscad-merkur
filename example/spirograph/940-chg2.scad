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

//sasi800();

$fn=50;
$vpt=[ -12.34, -43.99, 122.00 ];
$vpr=[255,0,140];
$vpd=900;
