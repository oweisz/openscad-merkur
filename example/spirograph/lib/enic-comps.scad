//ELECTRONIC COMPONENTS
//GPL3.0 LICENCING

//USE FOR BEZIER WIRE
use <dotSCAD/src/polyline_join.scad>
use <dotSCAD/src/bezier_curve.scad>
use <dotSCAD/src/path_extrude.scad>
include <NopSCADlib/lib.scad>
include <enic-comp.scad>


translate([0,0,0])B6F22(0);
translate([-10,-10,10])CLIPS6F22();
translate([30,0,0])CONN60_1094_11_0030(false);
translate([20,15,0])CONN61_1512_11_0031(false);
translate([0,20,10])CONN_VT01();
translate([20,0,10])FC68148();
translate([0,10,20])RN460XX();
translate([0,30,0])PT15V12();
translate([0,45,0])PT15GW("red");
translate([40,10,0])RKT6V();
translate([50,10,0])HSK2301DP();
translate([28,10,0])TO220_H_EAGLE();
translate([30,-10,0])TC38H(true,2);
translate([-40,10,0])pot_R16148(true,true,3);
translate([-20,10,0])TSM202A2();
