//include <openscad-merkur/merkur.scad>
//include <lib/vrut29.scad>

include <openscad-merkur/merkur_bosl2.scad>
include <lib/vrut29-bosl2.scad>

include <lib/prevody.scad>
include <lib/sasi.scad>
include <lib/stylus.scad>
include <lib/ME2024-1_redukce.scad>


//import("lib/sasi.stl");
//import("lib/prevody.stl");

translate([0,-19,135])rotate([0,0,180])rameno(xpos=12.7,ypos=46.43,zpos=0,xrot=0,zrot=-11.43,ax=49,az=-2);

prevody(poz=true);

sasi800();

translate([124.4,-60,5])rotate([0,0,90])mot_sv(mont=true);


$fn=50;
$vpt=[ -5.65, 35.23, 78.25 ];
$vpr=[68,0,110];
$vpd=900;