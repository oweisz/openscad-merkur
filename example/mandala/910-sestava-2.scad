//include <openscad-merkur/merkur.scad>
//include <lib/vrut29.scad>

include <openscad-merkur/merkur_bosl2.scad>
include <lib/vrut29-bosl2.scad>


include <lib/prevody.scad>
include <lib/sasi.scad>
include <lib/stylus.scad>
include <lib/ME2024-1_redukce.scad>


translate([0,-19,135])rotate([0,0,180])rameno(xpos=12.7,ypos=34,zpos=0,xrot=-1.5,zrot=-23.7,ax=48.5,az=-2);

prevody(poz=true);

sasi800();

translate([124.4,-60,5])rotate([0,0,90])mot_sv();


$fn=50;
$vpt=[ -13.69, 32.72, 106.20 ];
$vpr=[45,0,280];
$vpd=1000;
