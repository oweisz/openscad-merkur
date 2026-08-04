
use <dotSCAD/src/polyline_join.scad>
use <dotSCAD/src/bezier_curve.scad>

include <BOSL2/std.scad>
include <BOSL2/beziers.scad>


module mdraw_bezier(b_po=[[0,0,0],[10,10,10]],m_radius=1){
    points = bezier_curve(.2, b_po);
    polyline_join(points)sphere(m_radius);
}

    vod_mot_bl1=[
    [67.6,57.5,55],
    [67.6,57.5,45],
    [60,65.5,50],
    [60,65.5,40]
  ];
  mdraw_bezier(vod_mot_bl1,2);
  
/*
WARNING: undefined operation (vector + number) BOSL2/beziers.scad, line 214:

ERROR: Assertion 'is_int(n)' failed in file BOSL2/math.scad, line 137

BOSL-214: function bezier_curve(bezier,splinesteps=16,endpoint=true) =
    bezier_points(bezier, lerpn(0,1,splinesteps+1,endpoint));



*/