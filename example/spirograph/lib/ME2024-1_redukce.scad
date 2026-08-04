
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
    ca="brown";
    cb="black";
    //hneda ke stredu
    //vyvody motoru
    translate(mont?[75.7,61,45]:[75.7,71,55])color(ca)cylinder(h=5,d=dvod);
    translate(mont?[67.6,47.5,45]:[67.6,57.5,55])color(cb)cylinder(h=5,d=dvod);

    //bezier - motor-dvoulinka
  vod_mot_br1=mont?[
    [75.7,61,45],
    [75.7,61,35],
    [70,66.5,35],
    [70,66.5,30]
  ]:[
    [75.7,71,55],
    [75.7,71,45],
    [60,66.5,50],
    [60,66.5,40]
  ];

    vod_mot_bl1=mont?[
    [67.6,47.5,45],
    [67.6,47.5,35],
    [70,65.5,35],
    [70,65.5,30]
  ]:[
    [67.6,57.5,55],
    [67.6,57.5,45],
    [60,65.5,50],
    [60,65.5,40]
  ];
  color(ca)bezier_wire(vod_mot_br1,dvod);
  color(cb)bezier_wire(vod_mot_bl1,dvod);
    
    //bezier - dvoulinka
    vod_mot_br2=mont?[
        [70,66.5,30],
        [70,66.5,0],
        [-0.5,80,15],
        [-0.5,40,15]
    ]:[
        [60,66.5,40],
        [60,66.5,0],
        [-0.5,80,5],
        [-0.5,40,5]
    ];
    vod_mot_bl2=mont?[
        [70,65.5,30],
        [70,65.5,0],
        [0.5,80,15],
        [0.5,40,15]
    ]:[
        [60,65.5,40],
        [60,65.5,0],
        [0.5,80,5],
        [0.5,40,5]
    ];
  color(ca)bezier_wire(vod_mot_br2,dvod);
  color(cb)bezier_wire(vod_mot_bl2,dvod);
    
    //bezier - dvoulinka-dps
  vod_mot_br3=mont?[
    [-0.5,40,15],
    [-0.5,20,15],
    [-15,30,11.2],
    [-15,20,11.2]
  ]:[
    [-0.5,40,5],
    [-0.5,20,5],
    [-15,30,2.8],
    [-15,20,2.8]
  ];
    vod_mot_bl3=mont?[
    [0.5,40,15],
    [0.5,20,15],
    [15,30,11.2],
    [15,20,11.2]
  ]:[
    [0.5,40,5],
    [0.5,20,5],
    [15,30,2.8],
    [15,20,2.8]
  ];
  color(ca)bezier_wire(vod_mot_br3,dvod);
  color(cb)bezier_wire(vod_mot_bl3,dvod);
    
    //vyvody ok
    translate([-15,20,mont?11.2:2.8])rotate([90,0,0])color(ca)cylinder(h=5,d=dvod);
    translate([15,20,mont?11.2:2.8])rotate([90,0,0])color(cb)cylinder(h=5,d=dvod);
}

module mot_sv(mont=false,svk=true,pcbonly=false){
  translate([0,mont?30:20,6]){
    translate([0,0,mont?10:0]){
      ME2024_1(pcbonly);
      if(svk){
          //pripojeni motoru
          // oka
    for(i=[-15,15]){
        translate([i,10,mont?10:1.5])rotate([0,0,180])ring_terminal(M3_5_ringterm_crimp1);
        if(mont){
            translate([i,10,-15])rotate([180,0,0])M1052(20);
            translate([i,10,20])rotate([180,0,0])M1051();
            color("black")translate([i,10,-20])axo(42,axo_z,.5);
        }else translate([i,10,0])rotate([180,0,0])M1052(2);
    }
          //vodic
        mot_vodice(mont=mont);
      }
    }
    translate([20,-15,0])rotate([0,180,180])v260(mont);
    translate([-20,-15,0])rotate([0,180,180])v260(mont);
  }
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
//import("sestava.stl");
//import("prevody.stl");    
//translate([124.4,-60,5])rotate([0,0,90])mot_sv(mont=true);
//mot_vodice();
