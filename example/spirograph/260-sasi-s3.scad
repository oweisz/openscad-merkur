include <openscad-merkur/merkur_bosl2.scad>

include <lib/sasi.scad>


sasi100();
translate([-120,-6,115])rotate([0,-90,-90])sasi200(sest=true,mont1=false);
translate([120,-6,25])rotate([0,-90,90])sasi210(sest=true,mont1=false);
$fn=50;

$vpt=[ -40.15, 146.18, 83.25 ];
$vpr=[75,2,205];
$vpd=500;
