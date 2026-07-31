//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>
include <lib/prevody.scad>
//include <lib/sasi.scad>
//include <lib/stylus.scad>
//include <vrut29-bosl2.scad>
//include <lib/vrut29.scad>


rotate([0,90,0])prevod100(rot=0,mont=true,sest=false,mont1=false);
$fn=50;
$vpt=[ 28.70, -17.07, 2.32 ];
$vpr=[68,0,337];
$vpd=250;
