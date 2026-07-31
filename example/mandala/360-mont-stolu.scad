//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>
include <lib/prevody.scad>
include <lib/sasi.scad>
//include <lib/stylus.scad>
include <lib/vrut29-bosl2.scad>
//include <lib/vrut29.scad>

prevod02(true);
prevod04(false);
sasi800();

$fn=50;
$vpt=[ -12.34, -43.99, 122.00 ];
$vpr=[255,0,140];
$vpd=900;
