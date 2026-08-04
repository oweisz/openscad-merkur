//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>

include <lib/sasi.scad>


sasi100(true,true);

translate([125,0,5])rotate([0,90,0])mirror([1,0,0])color(c=[.9,.5,.5,.2])render()sasi101();
 // translate([120,mont?160:146,25])rotate([0,90,90])

$fn=50;
$vpt=[ 17.38, 66.67, 42.42 ];
$vpr=[60,0,125];
$vpd=650;
