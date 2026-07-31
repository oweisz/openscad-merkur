//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>
include <lib/prevody.scad>
include <lib/sasi.scad>
//include <lib/stylus.scad>
include <lib/vrut29-bosl2.scad>
//include <lib/vrut29.scad>


prevod09(prevod=2);
sasi800();
prevod16(false);

$fn=50;
$vpt=[ 2.64, -0.08, 43.91 ];
$vpr=[85,0,200];
$vpd=700;
