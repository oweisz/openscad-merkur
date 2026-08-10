include <BOSL2/std.scad>

include <x_axo.scad>

//oko pajeci

module ring_terminal(){
    color("silver"){
    difference(){
        cylinder(h=.4,d=6);
        translate([0,0,-.05])cylinder(h=.5,d=3.5);
    }
    translate([0,-5.25,0.2])cube([1.5,5.5,.4],center=true);
    translate([0,-8,1.25])rotate([-90,0,0])
        difference(){
            cylinder(h=4,d=2.5);
            translate([0,0,-.2])cylinder(h=6,d=1.5);
        }
   }
}

module bezier_wire(bc=bez,d=d){
    echo($fn);
    FF=$fn==0?8:$fn;
    bezier_sweep(circle(r=d/2,$fn=FF), bc,FF);
}

module mot_vodice(mont=false){
    dvod=1;
    ca="red";
    cb="black";
    //hneda ke stredu
    //vyvody motoru
    translate([75.7,71,55])color(ca)cylinder(h=5,d=dvod);
    translate([67.6,57.5,55])color(cb)cylinder(h=5,d=dvod);

    //bezier - motor-dvoulinka
  vod_mot_br1=[
    [75.7,71,55],
   [75.7,71,50],
   [71,64+dvod/2,50],
    [71,64+dvod/2,45]
  ];

    vod_mot_bl1=[
    [67.6,57.5,55],
   [67.6,57.5,50],
   [71,64-dvod/2,50],
    [71,64-dvod/2,45]
  ];
  color(ca)bezier_wire(vod_mot_br1,dvod);
  color(cb)bezier_wire(vod_mot_bl1,dvod);
    
    //bezier - dvoulinka
    vod_mot_br2=[
        [71,64+dvod/2,45],
        [71,64,20.5],
        [71,63.5,30.5],
        mont?[dvod/2,100,21.2]:[dvod/2,80,2.8],
        mont?[dvod/2,30,21.2]:[dvod/2,20,2.8]
    ];
    vod_mot_bl2=[
        [71,64-dvod/2,45],
        [71,64,19.5],
        [71,64.5,29.5],
        mont?[-dvod/2,100,21.2]:[-dvod/2,80,2.8],
        mont?[-dvod/2,30,21.2]:[-dvod/2,20,2.8]
    ];
  color(ca)bezier_wire(vod_mot_br2,dvod);
  color(cb)bezier_wire(vod_mot_bl2,dvod);
    
    //bezier - dvoulinka-dps
  vod_mot_br3=mont?[
    [dvod/2,30,21.2],
    [dvod/2,20,21.2],
    [10,30,21.2],
    [10,17,21.2]
  ]:[
    [dvod/2,20,2.8],
    [dvod/2,10,2.8],
    [10,20,2.8],
    [10,7,2.8]
  ];
  vod_mot_bl3=mont?[
    [-dvod/2,30,21.2],
    [-dvod/2,20,21.2],
    [-10,30,21.2],
    [-10,17,21.2]
  ]:[
    [-dvod/2,20,2.8],
    [-dvod/2,10,2.8],
    [-10,20,2.8],
    [-10,7,2.8]
  ];
  color(ca)bezier_wire(vod_mot_br3,dvod);
  color(cb)bezier_wire(vod_mot_bl3,dvod);
    
    //vyvody ok
  translate(mont?[10,17,21.2]:[10,7,2.8])rotate([90,0,0])color(ca)cylinder(h=5,d=dvod);
  translate(mont?[-10,17,21.2]:[-10,7,2.8])rotate([90,0,0])color(cb)cylinder(h=5,d=dvod);

}

//$fn=30;
//mot_vodice(true);


module mot_sv(mont=false){
  translate([0,mont?30:20,6]){
  translate(-[20,4,mont?-5:0])rotate([0,0,-90])M2020();
  translate(-[20,4,mont?-10:-0.4])rotate([0,0,-90])M2020();
    translate([0,0,mont?10:0]){
        for(i=[[-10,-4,mont?10:1.5],[10,-4,mont?10:1.5]]){
            translate(i)rotate([0,0,180])ring_terminal();
            if(mont){
                translate(i-[0,0,60])rotate([180,0,0])M2053(40);
                translate(i+[0,0,10])rotate([180,0,0])M1051();
                color("black")translate(i-[0,0,65])axo(78,axo_z,.5);
            }else translate(i-[0,0,1.5])rotate([180,0,0])M2053(2);
        }
    }
    for(i=[20,-20])translate([i,-15,mont?-10:0])rotate([0,180,180])v260(mont);
     }
  
  //vodic
     translate([0,20,6])mot_vodice(mont=mont);
}

module v260(mont=false){
  if(mont){
    translate([0,0,-10])M1001();
    translate([0,0,15])M1052(10);
    translate([0,0,-30])M1051();
    color("black")translate([0,0,-23])axo(55,axo_z,.5);
    translate([0,-20,-4])rotate([90,0,0])
    {
        M1052(20);
        translate([0,0,-43])M1051();
        color("black")translate([0,0,-47])axo(55,axo_z,.5);
    }
  }else{
    M1001();
    translate([0,0,.8])M1052(1.6);
    translate([0,4.7,6])rotate([90,0,0])M1052(2);
  }
}

//include <openscad-merkur/merkur.scad>
//translate([124.4,-60,5])rotate([0,0,90])mot_sv(mont=false);
//import("sestava.stl");
//import("prevody.stl");
