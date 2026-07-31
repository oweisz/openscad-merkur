//simple
//include <openscad-merkur/merkur.scad>
//include <lib/vrut29.scad>

//full
include <openscad-merkur/merkur_bosl2.scad>
include <lib/vrut29-bosl2.scad>
include <lib/x_axo.scad>

include <lib/stul.scad>


stul_sest(false,true);

$vpt=[ -9.16, -6.79, -14.78 ];
$vpr=[245,0,245];
$vpd=500;
$fn=100;