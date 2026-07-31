//include <openscad-merkur/merkur.scad>
//include <lib/vrut29.scad>

include <openscad-merkur/merkur_bosl2.scad>
include <lib/vrut29-bosl2.scad>


include <lib/prevody.scad>
include <lib/sasi.scad>
include <lib/stylus.scad>
include <lib/ME2024-1_redukce.scad>


$fn=30;
translate([0,-19,135])rotate([0,0,180])rameno(xpos=12.7,ypos=46.43,zpos=0,xrot=0,zrot=-11.43,ax=49,az=-2,fix=true);

prevody(poz=true);

sasi800();

translate([124.4,-60,5])rotate([0,0,90])mot_sv();

$vpt=[ -37.83, 30.35, 82.01 ];
$vpr=[66,0,280];
$vpd=800;