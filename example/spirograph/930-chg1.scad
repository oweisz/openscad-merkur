//include <openscad-merkur/merkur.scad>
//include <lib/vrut29.scad>

include <openscad-merkur/merkur_bosl2.scad>
include <lib/vrut29-bosl2.scad>


include <lib/prevody.scad>
include <lib/sasi.scad>
include <lib/stylus.scad>
include <lib/ME2024-1_redukce.scad>


translate([0,-19,135])rotate([0,0,180])rameno(xpos=15.8,ypos=34.24,zpos=0,xrot=0,zrot=-13.6,ax=-73.7,az=-2);

prevody(poz=true);

sasi800(mux=true);

translate([124.4,-60,5])rotate([0,0,90])mot_sv();


$fn=50;
$vpt=[ 13.40, 53.15, 112.21 ];
$vpr=[100,0,180];
$vpd=1000;
