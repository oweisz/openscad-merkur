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


//$fn=30;

translate([0,-19,135])rotate([0,0,180])rameno(xpos=26,ypos=48,zpos=1,xrot=-2,zrot=-27.5,ax=-74.6,az=-2,fix=true,fxcolor="green");

prevody(poz=true,pap=1,angle=151,scale=1.055,color="green");

sasi800();

translate([124.4,-60,5])rotate([0,0,90])mot_sv();

$fn=50;
$vpt=[ -15.32, 38.67, 53.66 ];
$vpr=[60,0,55];
$vpd=900;
