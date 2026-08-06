
include <enic-comp.scad>
include <x_axo.scad>
include <NopSCADlib2/core.scad>
include <NopSCADlib2/vitamins/ring_terminals.scad>

//oko pajeci
M3_5_ringterm_crimp1 = ["TEST",6,3.5,11,2.5,0,.5,M3_dome_screw,4];

module nyt_2024(){
color("silver")difference(){
    cylinder(h=15,d=4);
    cylinder(h=16,d=3.5);
  }
}


function ME2024s(pcb_only=false)=["ME2024_1","ME2024_1",
  50, 40, 1.5, // length, width, thickness
  0,      // Corner radius
  3.5,   // Mounting hole diameter
  0,    // Pad around mounting hole
  "green",// Color
  false,   // True if the parts should be separate BOM items
 // hole offsets
  [[45, 5],[5,5],[25,35],[10,30],[40,30]],
  //components
  pcb_only?[]:[
    [25,10,-90,"usb_B"],//X2
  ],
  // accessories
  []
];  



module ME2024_1(dps_only=false){
  pcbs=ME2024s(dps_only);
  let(
      $show_threads = true,
      $solder = pcb_solder(pcbs)
    )
    pcb(pcbs);
  translate([0,5,0])nyt_2024();
  translate([15,0,0])nyt_2024();
  translate([-15,0,0])nyt_2024();
}

//$fn=20;

t_step=.5;

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
        mont?[7.5+dvod/2,100,21.2]:[7.5+dvod/2,80,5],
        mont?[7.5+dvod/2,50,21.2]:[7.5+dvod/2,40,5]
    ];
    vod_mot_bl2=[
        [71,64-dvod/2,45],
        [71,64,19.5],
        [71,64.5,29.5],
        mont?[7.5-dvod/2,100,21.2]:[7.5-dvod/2,80,5],
        mont?[7.5-dvod/2,50,21.2]:[7.5-dvod/2,40,5]
    ];
  color(ca)bezier_wire(vod_mot_br2,dvod);
  color(cb)bezier_wire(vod_mot_bl2,dvod);
    
    //bezier - dvoulinka-dps
  vod_mot_br3=mont?[
    [7.5+dvod/2,50,21.2],
    [7.5+dvod/2,40,21.2],
    [15,40,21.2],
    [15,30,21.2]
  ]:[
    [7.5+dvod/2,40,5],
    [7.5+dvod/2,30,5],
    [15,30,2.8],
    [15,20,2.8]
  ];
  vod_mot_bl3=mont?[
    [7.5-dvod/2,50,21.2],
    [7.5-dvod/2,40,21.2],
    [0,40,21.2],
    [0,35,21.2]
  ]:[
    [7.5-dvod/2,40,5],
    [7.5-dvod/2,30,5],
    [0,35,2.8],
    [0,25,2.8]
  ];
  color(ca)bezier_wire(vod_mot_br3,dvod);
  color(cb)bezier_wire(vod_mot_bl3,dvod);
    
    //vyvody ok
  translate(mont?[15,30,21.2]:[15,20,2.8])rotate([90,0,0])color(ca)cylinder(h=5,d=dvod);
  translate(mont?[0,35,21.2]:[0,25,2.8])rotate([90,0,0])color(cb)cylinder(h=5,d=dvod);

}
//$fn=30;
//mot_vodice(true);

module mot_sv(mont=false,svk=true,pcbonly=false){
  translate([0,mont?30:20,6]){
    translate([0,0,mont?10:0]){
      ME2024_1(pcbonly);
      if(svk){
          //pripojeni motoru
          // oka
        for(i=[[15,10,mont?10:1.5],[0,15,mont?10:1.5]]){
            translate(i)rotate([0,0,180])ring_terminal(M3_5_ringterm_crimp1);
            if(mont){
                translate(i-[0,0,25])rotate([180,0,0])M1052(20);
                translate(i+[0,0,10])rotate([180,0,0])M1051();
                color("black")translate(i-[0,0,30])axo(42,axo_z,.5);
            }else translate(i-[0,0,1.5])rotate([180,0,0])M1052(2);
        }
    }
    for(i=[20,-20])translate([i,-15,mont?-10:0])rotate([0,180,180])v260(mont);
     }
  }
  //vodic
     translate([0,20,6])mot_vodice(mont=mont);

}

module v260(mont=false){
  M1001();
  if(mont){
    translate([0,0,25])M1052(10);
    translate([0,0,-20])M1051();
    color("black")translate([0,0,-23])axo(55,axo_z,.5);
    translate([0,-20,6])rotate([90,0,0])
    {
        M1052(20);
        translate([0,0,-43])M1051();
        color("black")translate([0,0,-47])axo(55,axo_z,.5);
    }
  }else{
    translate([0,0,.8])M1052(1.5+.8);
    translate([0,4.7,6])rotate([90,0,0])M1052(2);
  }
}

//include <../openscad-merkur/merkur.scad>
//translate([124.4,-60,5])rotate([0,0,90])mot_sv(mont=true);
//import("sestava.stl");
//import("prevody.stl");
