//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>

include <lib/sasi.scad>


sasi100();
translate([-120,-26,115])rotate([0,-90,-90])sasi200(sest=true,mont1=true);
$fn=50;
$vpt=[ -96.00, 128.38, -11.70 ];
$vpr=[70,2,45];
$vpd=850;
