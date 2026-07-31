//include <openscad-merkur/merkur.scad>
//include <lib/vrut29.scad>

include <openscad-merkur/merkur_bosl2.scad>
include <lib/vrut29-bosl2.scad>


include <lib/prevody.scad>
include <lib/sasi.scad>
include <lib/stylus.scad>
include <lib/ME2024-1_redukce.scad>


translate([0,-19,135])rotate([0,0,180]){
rameno(xpos=50,ypos=60,zpos=6,xrot=10,zrot=20,ax=50,az=-10,mont=false,fix=true);
}

prevody(poz=true);

sasi800();

translate([124.4,-60,5])rotate([0,0,90])mot_sv();

$fn=50;
$vpt=[ -30.31, 17.58, 108.10 ];
$vpr=[77,0,310];
$vpd=850;