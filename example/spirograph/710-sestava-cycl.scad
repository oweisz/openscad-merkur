//include <openscad-merkur/merkur.scad>
//include <lib/vrut29.scad>

include <openscad-merkur/merkur_bosl2.scad>
include <lib/vrut29-bosl2.scad>


include <lib/prevody.scad>
include <lib/sasi.scad>
include <lib/stylus.scad>
include <lib/ME2024-1_redukce.scad>

//Type
//circle = 1, sine = 2, cycloid = 3, combi = 4



translate([0,-19,135])rotate([0,0,180])rameno(xpos=-5,ypos=47.5,zpos=0,xrot=0,zrot=-6,ax=-69,az=-2,fix=true,fxcolor="green");

prevody(poz=true,pap=3,angle=147,color="green");


sasi800();

translate([124.4,-60,5])rotate([0,0,90])mot_sv();

$fn=50;
$vpt=[ -15.32, 38.67, 53.66 ];
$vpr=[60,0,55];
$vpd=900;
