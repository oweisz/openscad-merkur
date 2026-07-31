//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>
include <lib/prevody.scad>
include <lib/sasi.scad>
include <lib/stylus.scad>
//include <vrut29-bosl2.scad>
include <lib/vrut29.scad>

sasi800();
prevody(poz=true);

translate([0,-19,135])rotate([0,0,180])
rameno(xpos=0,ypos=0,zpos=0,xrot=0,zrot=0,ax=30,az=0,mont=false);

$fn=50;
$vpt=[ -19.47, 0.59, 119.63 ];
$vpr=[50,0,305];
$vpd=1000;
