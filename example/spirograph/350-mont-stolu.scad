//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>
include <lib/prevody.scad>
include <lib/sasi.scad>
//include <lib/stylus.scad>
//include <lib/vrut29-bosl2.scad>
//include <lib/vrut29.scad>

prevod01(true);
prevod04(false);
sasi800();

$fn=50;
$vpt=[ 15.62, -10.91, 29.50 ];
$vpr=[55,0,125];
$vpd=900;
