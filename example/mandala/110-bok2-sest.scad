//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>

include <lib/sasi.scad>


sasi101(false);
translate([-25,0,0])mirror([1,0,0])sasi101(false);
$fn=50;
$vpt=[ 54.04, 48.39, -44.64 ];
$vpr=[225,0,270];
$vpd=400;
