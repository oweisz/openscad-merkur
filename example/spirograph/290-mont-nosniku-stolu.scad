//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>

include <lib/sasi.scad>

//%import ("lib/sasi3.stl");
sasi100();
translate([-120,-6,115])rotate([0,-90,-90])sasi200(sest=true,mont1=false);
translate([120,-6,25])rotate([0,-90,90])sasi210(sest=true,mont1=false);

translate([0,-12.5,101])rotate([0,0,-90])sasi300(false,true,true);
$vpt=[ -66.92, 126.52, 8.41 ];
$vpr=[75,0,30];
$vpd=800;
