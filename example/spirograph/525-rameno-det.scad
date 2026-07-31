//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>
include <lib/prevody.scad>
include <lib/sasi.scad>
include <lib/stylus.scad>
include <lib/arrows.scad>
//include <vrut29-bosl2.scad>
include <lib/vrut29.scad>

//sasi800();
//prevody(poz=true,simple=false);

color(c=[.9,.5,.5,.2])import("lib/sasi.stl");
color(c=[.9,.5,.5,.2])import("lib/prevody.stl");

translate([0,-19,135])rotate([0,0,180]){
rameno(xpos=50,ypos=60,zpos=6,xrot=10,zrot=20,ax=50,az=-10,mont=false);
}

$fn=50;
$vpt=[ -29.62, -23.51, 94.94 ];
$vpr=[50,0,333];
$vpd=800;

color("orange")translate([-160,-35,135])rotate([0,90,0])scale([2,2,2])arrow1(45);
color("orange")translate([-65,-20,170])rotate([-10,0,0])scale([2,2,2])arrow1(20);
color("orange")translate([-12,-130,185])rotate([-5,100,95])scale([2,2,2])arrow2(40,40);
color("orange")translate([-95,40,150])rotate([0,90,120])scale([2,2,2])arrow1(40);
color("orange")translate([-160,60,160])rotate([-5,80,130])scale([2,2,2])arrow2(30,30);
