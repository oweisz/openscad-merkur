//ELECTRONIC COMPONENTS
//GPL3.0 LICENCING

//color cuprum
c_cuprum="#B87333";

//use for NopSCAD components
include <NopSCADlib2/core.scad>
//include <NopSCADlib2/lib.scad>
include <NopSCADlib2/vitamins/smds.scad>
include <NopSCADlib2/vitamins/axials.scad>
include <NopSCADlib2/vitamins/radials.scad>
include <NopSCADlib2/vitamins/potentiometer.scad>
include <NopSCADlib2/vitamins/pin_headers.scad>
include <NopSCADlib2/vitamins/smd_melf.scad>
include <NopSCADlib2/vitamins/x_wire_pin.scad>
include <NopSCADlib2/vitamins/ring_terminals.scad>
include <NopSCADlib2/vitamins/dip.scad>
include <NopSCADlib2/vitamins/green_terminals.scad>


use <NopSCADlib2/vitamins/pcb.scad>


use <NopSCADlib2/utils/sweep.scad>
use <NopSCADlib2/utils/bezier.scad>
use <NopSCADlib2/vitamins/wire.scad>

//USE FOR BEZIER WIRE
//use <dotSCAD/src/polyline_join.scad>
//use <dotSCAD/src/bezier_curve.scad>
//use <dotSCAD/src/path_extrude.scad>

//b_vect=[[xstart,ystart,zstart],[xyz_bpoint]...[xyz_stop]]
//module bezier_wire(b_vect=[[0,0,0],[10,10,10]],diameter=1,t_step=0.05){
  //  polyline_join(bezier_curve(t_step,b_vect))sphere(d=diameter);
//}


module bezier_wire(b_vect=[[0,0,0],[10,10,10]],diameter=1,t_step=0.05,color="red"){
    path=bezier_path(b_vect);
    wire(colour=color,strands=1,length=70,strand=.2,d=diameter,path);
}

//BATERY

//AA battery
module bat_AA(){
    color("green")cylinder(h=49,d=14);
    color("silver")translate([0,0,49])cylinder(h=1,d=5);
}


//END module bat_AA

//holder 6xAA
module BH363_1B(bat=false){
    if(bat)translate([6.5,8,4]){
        translate([0,0,0])bat_AA();
        translate([0,14,50])rotate([0,180,0])bat_AA();
        translate([0,28,0])bat_AA();
        translate([15,0,50])rotate([0,180,0])bat_AA();
        translate([15,14,0])bat_AA();
        translate([15,28,50])rotate([0,180,0])bat_AA();
    }
    color("gray")difference(){
        union(){
            //#cube([28,45,58]);
            translate([14,0,0])cube([1,45,58]);
            translate([9,0,0])cube([10,1,58]);
            translate([9,44,0])cube([10,1,58]);
            translate([7,7,0]){
                minkowski(){
                    cube([14,31,1]);
                    translate([0,0,0])cylinder(h=1,d=14);
                }
                translate([0,0,56])minkowski(){
                    cube([14,31,1]);
                    translate([0,0,0])cylinder(h=1,d=14);
                }
            }
        }
        union(){
            translate([0,0,0])cube([0,0,0]);
        }
        union(){
            //translate([0,0,0])cube([10,10,10]);
        }
    }
    translate([21.5,15,-2.5])rotate([0,0,180])color("silver")difference(){
        union(){
            translate([0,7.5,0])cylinder(h=2.5,d1=5.8,d2=5.8);
            translate([0,-7.5,0])cylinder(h=2.5,d1=8.5,d2=7,$fn=6);
        }
        union(){
            translate([0,7.5,-.3])cylinder(h=3,d1=4,d2=4);
            translate([0,-7.5,-.3])cylinder(h=3,d1=6,d2=5,$fn=6);
                        
        }
     }
}
//BH363_1B(true);
;//END module BH363_1B

//connector, contact jumper--------------------------------------------

//60-1094-11/0030 OSTERRAH wire on pin
module CONN60_1094_11_0030(wire=false){
    color("silver")difference(){
        union(){
            translate([-2.5,-0.5,0]) cube([5,1,2]);
            translate([-1.5,-0.5,0]) cube([3,1,8]);
            translate([-.7,-0.5,-2]) cube([1.4,1,8]);
        }
        
        translate([0,1,6])rotate([90,0,0])cylinder(h=2,d1=1.5,d2=1.5);
        translate([0,1,5])rotate([90,0,0])cylinder(h=2,d1=1.5,d2=1.5);
        translate([0,0,5.5])cube([1.5,2,1],center=true);
    }
    if(wire){ //wire
            d_core=.6; //diameter wire
    color("coral")union(){
        translate([1,-0,5])rotate([0,0,180])rotate_extrude(angle=180,convexity=5)translate([1,0,0])circle(d_core/2);
        translate([1,-0,6])rotate([0,0,180])rotate_extrude(angle=180,convexity=5)translate([1,0,0])circle(d_core/2);
        translate([2,1,5])rotate([90,0,0])cylinder(h=1,d=d_core);
        translate([2,1,6])rotate([90,0,0])cylinder(h=1,d=d_core);
        //bezier_wire start,bezier_p...stop
        b_point=[
            [
                [0, 0, 5],
                [0, 1, 5],
                [0, 1, 5],
                [0, 2, 4.5]
            ],
            [
                [0, 0, 6],
                [0, 1, 6],
                [0, 1, 6],
                [0, 2, 6.5]
            ]
        ];
        for(a=b_point)bezier_wire(a,d_core);
    }
  }
}
//$fn=50;
//CONN60_1094_11_0030(true);
//END module CONN60_1094_11_0030

//61-1512-11/0031 OSTERRAH
module CONN61_1512_11_0031(wire=false,solder=false){
    color("silver")difference(){
        union(){
            translate([-1.5,-0.5,0]) cube([3,1,8]);
            translate([-.5,-0.5,-2]) cube([1,1,8]);
        }
        
        translate([0,1,6])rotate([90,0,0])cylinder(h=2,d1=1.5,d2=1.5);
 //       translate([0,1,5])rotate([90,0,0])cylinder(h=2,d1=1.5,d2=1.5);
        translate([0,0,7.6])cube([1.5,2,1],center=true);
    }
    if(wire){
            d_core=.6;
    color(solder?"silver":"coral")union(){
        translate([0,3,6])rotate([90,0,0])cylinder(h=3,d=d_core);
        translate([1,-0,6])rotate([0,0,180])rotate_extrude(angle=180,convexity=5)translate([1,0,0])circle(d_core/2);
        translate([2,1,6])rotate([90,0,0])cylinder(h=1,d=d_core);
        }
    }
    if(solder){
        translate([0,0,6])color("silver")sphere(r=1);
    }
}

//$fn=50;
//CONN61_1512_11_0031(true,true);

//END module CONN61_1512_11_0031()

//PG203J | JS-117

module PG203J(matice=false,v=2){
    translate([-7.1,-11.5/2,0])difference(){
        union(){
            color("gray")cube([14.3,11.5,6]);
            translate([0,11.5/2,3])rotate([0,-90,0])color("silver")cylinder(d=6.2,h=3.4);
            if(matice)translate([-v,11.5/2,3])rotate([0,-90,0])color("silver")cylinder(h=1.2,d=8);
        }
        union(){
            translate([-3.6,11.5/2,3])rotate([0,90,0])color("silver")cylinder(d=3.5,h=10);
            
        }
    }
}
//PG203J(true,1);
//END module PG203J

//VIDLICKA TESLA
module CONN_VT01(){
    color("silver")difference(){
        union(){
            translate([-1.5,-0.5,0]) cube([3,1,7]);
            translate([-.7,-0.5,-2]) cube([1.4,1,8]);
        }
        
        translate([-2.5,1,2.6])rotate([90,0,0])cylinder(h=2,d=3);
        translate([2.5,1,2.6])rotate([90,0,0])cylinder(h=2,d=3);
        translate([0,0,6])cube([1.5,2,4],center=true);
    }
}
//$fn=50;
//CONN_VT01();
//END module VIDLICKA TESLA


//FC68148 CLIFF DC JACK 5.5/2.1
module FC68148(){
    translate([-10.7,-4.5,0]){//body
        difference(){
            color("gray")union(){
                translate([0,0,0])cube([14,9,6.4]);
                translate([0,0,0])cube([3.5,9,11]);
                translate([0,4.5,6.4])rotate([0,90,0])cylinder(h=14,d1=9,d2=9);
            }
            union(){
                color("gray")translate([-.1,4.5,6.4])rotate([0,90,0])cylinder(h=9.5,d1=5.5,d2=5.5);
                
            }
        }
    //pads
        color("silver")union(){
            translate([1,4.5,6.4])rotate([0,90,0])cylinder(h=10,d1=2.1,d2=2.1);
            translate([10.6-1.4,-0.4,-4.5])cube([2.8,0.2,8]);
            translate([10.6-1.4,-0.4,3.5])cube([2.8,1,.2]);
            translate([13.45,4.6-1.4,-4.5])cube([0.2,2.8,5]);
            translate([7.3,4.6-1.4,-4.5])cube([0.2,2.8,5]);
        }
    
    }
}
//FC68148();
//END module FC68148


//zdirka TRU COMPONENTS  1582230 
module TC1582230(color="red"){
    difference(){
        union(){
            translate([0,0,-15])color("silver")cylinder(d=6,h=17);
            translate([0,0,-20])color("silver")cylinder(d=3,h=8);
            color(color)cylinder(d=10,h=5);
            translate([0,0,-3])color(color)cylinder(d=8,h=3);
        }
        translate([0,0,-12])color("silver")cylinder(d=4, h=18);
    }
}
//TC1582230("yellow");
//END MODULE TC1582230

//rezistor-----------------------------------------------------------


//rezistor-net

//4600 series BOURNS
module RN460XX(pins=10){
    translate([-(pins-1)*2.54/2,0,0])for(i=[0:pins-1])
        union(){
            color("yellow")translate([-1.27+i*2.54,-0.05,3])scale([1,0.4,1])rotate([0,90,0])cylinder(h=2.54,d1=4,d2=4);
            color("silver")translate([-0.5+i*2.54,-.125,0])cube([1,0.25,2.5]);
            color("silver")translate([-0.25+i*2.54,-.125,-3])cube([0.5,0.25,3]);
        
    }
}
//RN460XX();
//END module RN460XX


//TESLA WK681
//lenght 4: 24,50,51,53,54,64,65,67,
//lenght 7: 63,64,65,66,67,68,69
//lenght 9: 7879,,80,81,82,83
//position:TOP,LEFT,RIGHT,HEAD

module WK681(type=24,position=TOP){
}

//trimer-----------------------------------------

//PIHER

module rotorPT15(){
    difference(){
        color("white")cylinder(h=6,d1=7,d2=7);
        union(){
            rotate([0,0,45]){
            translate([0,0,3])cube([1,5.5,7.3],center=true);
            translate([0,1.4,-.1])rotate([0,0,-30])cylinder(h=7.3,d1=3,d2=3,$fn=3);
            }
            
        }
    }
}
//END module rotorPT15

//PT15V12
module PT15V12(){
    difference(){
        union(){
            translate([0,0,2.3])color("gray")cylinder(h=4.5,d1=15,d2=15);
            translate([0,0,6.5])color("gray")cylinder(h=.5,d1=8.1,d2=8.1);
            translate([-6.5,-7.3,2.3])color("gray")cube([13,4,4.5]);
            //vyvody
            translate([4.5,-7.425,-4])color("silver")cube([1,.5,4]);
            translate([3.5,-7.425,0])color("silver")cube([2,.5,6]);
            translate([-5.5,-7.425,-4])color("silver")cube([1,.5,4]);
            translate([-5.5,-7.425,0])color("silver")cube([2,.5,6]);
            translate([-0.5,4.75,-4])color("silver")cube([1,.5,4]);
            translate([-1,4.75,0])color("silver")cube([2,.5,4]);
        }
        union(){
            translate([0,0,2.4])color("gray")cylinder(h=9,d1=7,d2=7);
        }
    
    }
    translate([0,0,1.5])rotorPT15();
}
//PT15V12();
//END module PT15V12

//PT15GW height=13.3 mm
module PT15GW(cl="gray"){
    union()color(cl){
        difference(){
            union(){
                translate([0,0,6])cylinder(h=13.3,d1=6,d2=6);
                translate([0,0,0])cylinder(h=7,d1=4,d2=4);
                
            }
                translate([0,0,10])cylinder(h=13.3,d1=3.5,d2=3.5);
                translate([0,0,1.3])cube([1.5,5,3.5],center=true);
            
        }
        
    }
}
//PT15GW("red");
//END module PT15GW

//SR-PASSIVES
module RKT6V(){
    //body
    color("blue")translate([0,0,3.54])cylinder(h=2.2,d1=6.45,d2=6.45);
    color("blue")translate([-3.225,-4.035,3.54])cube([6.45,4.035,2.2]);
    //screw
    color("white")difference(){
        translate([0,0,5.74])cylinder(h=1.74,d1=6.2,d2=6.2);
        union(){
            translate([-2.4,-.5,5.75])cube([4.8,1,2]);
            translate([-2.4,-3.3,5.71])cube([4.8,1,2]);
        }
    }
    //lead
    color("silver")union(){
        translate([-0.35,2.5,-3.4])cube([0.7,0.2,3.4]);
        translate([-0.85,2.5,0])cube([1.7,0.2,3.54]);
        
        translate([-2.85,-2.5,-3.4])cube([0.7,0.2,3.4]);
        translate([-2.85,-2.5,0])cube([1.7,0.2,1.5]);
        translate([-2.85,-4.1,1.5])cube([1.7,0.2,3.2]);
        translate([-2.85,-4.1,1.5])cube([1.7,1.8,.2]);
        
        translate([2.15,-2.5,-3.4])cube([0.7,0.2,3.4]);
        translate([1.15,-2.5,0])cube([1.7,0.2,1.5]);
        translate([1.15,-4.1,1.5])cube([1.7,0.2,3.2]);
        translate([1.15,-4.1,1.5])cube([1.7,1.8,.2]);
    }
}
//RKT6V();
//END module RKT6V

// Potencimetr R16148
R16148=["R16148", //0 nazev
    [17, //1 prumer tela
    9.2, //1 hloubka tela
    1],  //1 radius tela
    [0,  //2 nalitek
     0,  //2 nalitek
     0], //2 nalitek
     [15, //3 sirka platle pro vyvody
     20.5,  //3 vyska platle pro vyvody, centrovana
     2.2, //3 tloustka platle
     false], //3 oblouk platle
     1, //4 pocet pater
     7, //5 prumer zavitu
     .75, //6 stoupani zavitu
     6.2,  //7 delka zavitu
     11,  //8 prumer celniho nalitku
     1,   //9 vyska nalitku
     [0.5, //10 klic tloustka
     1.88, //10 klic sirka
     .26], //10 klic vyska
     0,   //11 vzdalenost klice od stredu
     [6,  //12 prumer hridele
     1,  //12 drazka, zvrezovana plocha...
     15, //12 delka hridele
     12,  //12 hloubka drazky
     grey(50)], //12 barva hridele
     [0, //13 segrovka, prumer
     0], //13 segrovka tloustka
     [10, //14 vnejsi prumer matice
     1, //14 tloustka matice
     "black"], //14 barva matice
     [11, //15 //prumer matice
     0.8, //15 //tloustka matice
     grey(20), //15 //barva matice
     12] //15 //pocet zubu matice
];
    
module pot_R16148(zavit=true,matice=true,poloha_matice=3){
    translate([0,-3.8,12.5])rotate([90,0,180]){    
        let($show_threads = zavit)
        //cube([1,20,1],center=true);
        //potentiometer(R16148,shaft_length=10);
        potentiometer(R16148);
        if(matice)translate_z(-poloha_matice) pot_nut(R16148);
    }
}

P6M=["P6M", //0 nazev
    [17, //1 prumer tela
    9.2, //1 hloubka tela
    1],  //1 radius tela
    [0,  //2 nalitek
     0,  //2 nalitek
     0], //2 nalitek
     [16, //3 sirka platle pro vyvody
     20.5,  //3 vyska platle pro vyvody, centrovana
     1, //3 tloustka platle
     false], //3 oblouk platle
     1, //4 pocet pater
     7, //5 prumer zavitu
     .75, //6 stoupani zavitu
     6.2,  //7 delka zavitu
     11,  //8 prumer celniho nalitku
     1,   //9 vyska nalitku
     [0.5, //10 klic tloustka
     1.88, //10 klic sirka
     .26], //10 klic vyska
     0,   //11 vzdalenost klice od stredu
     [4,  //12 prumer hridele
     1,  //12 drazka, zvrezovana plocha...
     25, //12 delka hridele
     0,  //12 hloubka drazky
     grey(50)], //12 barva hridele
     [0, //13 segrovka, prumer
     0], //13 segrovka tloustka
     [10, //14 vnejsi prumer matice
     1, //14 tloustka matice
     "black"], //14 barva matice
     [11, //15 //prumer matice
     0.8, //15 //tloustka matice
     grey(20), //15 //barva matice
     12] //15 //pocet zubu matice
];

module pot_P6M(zavit=true,matice=true,poloha_matice=3){
    translate([0,-3.8,12.5])rotate([90,0,180]){    
        let($show_threads = zavit)
        //cube([1,20,1],center=true);
        //potentiometer(R16148,shaft_length=10);
        potentiometer(P6M);
        if(matice)translate_z(-poloha_matice) pot_nut(R16148);
    }
}

//translate([4,-3.8,0])cube([1,3.8,12.5]);
//translate([-4,-3.8,0])cube([1,9.2,12.5]);

//pot_R16148(true,true,3);
//END module pot_R16148

//Potenciometer TESLA TP012
module TP012(){
    translate([0.8,0,3]){
        color("lightgray")cylinder(d=12,h=2.6);
        translate([-10,-6,0])color("lightgray")cube([10,12,2.6]);
        color("silver"){
        translate([0,0,-2.7])cylinder(d=3.9,h=2.8);
        cylinder(d=2.6,h=7.6);
        //jezdec
        cylinder(d=11,h=4.5);
        }
   }
   //vyvody (5,-5-5d)
   color("silver"){
        translate([5,-1,0])cube([0.3,2,3]);
        translate([5,-.5,-4])cube([0.3,1,4]);
        translate([-5,-5-1,0])cube([0.3,2,3]);
        translate([-5,-5-.5,-4])cube([0.3,1,4]);
        translate([-5,5-1,0])cube([0.3,2,3]);
        translate([-5,5-.5,-4])cube([0.3,1,4]);
        }
}
//TP012();

//switch---------------------------------------------------

//GES
module HSK2301DP(){
            color ("silver")translate([-13.82/2,-7.02/2,0]) cube([13.82,7.04,4.78]);
            //bezec
            //translate([-3.5,3.52,1])#cube([7,4.35,3]);
            color("black")translate([-1,3.52,1.5])cube([2,4.35,2]);
}
//END module HSK2301DP 


//NINIGI
//TMS202A2           
def_TSM202A2 = ["TMS202A2",
        "TMS202A2", //NAZEV
        12.7, //sirka tela
        13.2, //delka tela
        9.5, //vyska tela
        0.4, //tloustka horniho plechu
        1.7, //vzdalenost plechu od sten
        "blue", //barva tela
        5.9, //prumer montazniho zavitu
        4, // prumer diry //packy spinace
        9, //delka montazniho zavitu
        0, //montazni limec
        0, //montazni limec
        4.45, //offset od stredu packy
        25/2, //uhel packy
        11, //delka packy
        3, //polomer koule na konci
        0, //prumer no kuloveho zakonceni
        toggle_nut, // typ matice
        toggle_washer, //typ podlozky
        6, // pocet pinu (2,3,4(2x2),5(3+2),6(2x3),jen dve rady?
        [3.94, //delka vyvodu
            1.23, //sirka vyvodu
            1.23, //tloustka vyvodu
            4.7,  //Y roztec vyvodu
            4.8] //X rastr
           ];

module TSM202A2(){
    translate([0,0,13.4])toggle(def_TSM202A2,2); //typ, poloha vzhledem k panelu
}

//TMS202A2();
//END module TSM202A2


//TMS102C3

module TSM102C3(){
    translate([0,12.7,0])rotate([0,0,180]){
        translate([-13.2/2,0.1,0])color("blue")cube([13.2,9.4,7.9]);
        translate([-13.2/2,0,0])color("silver")cube([13.3,0.1,7.9]);   
        translate([-13.2/2+1.6,0,7.85])color("silver")cube([10,5,.1]);   
        translate([0,0,7.9/2])color("silver")difference(){
            rotate([90,0,0])cylinder(d=6,h=7.3);
            translate([0,-1,0])rotate([90,0,0])cylinder(d=4,h=7.3);
        }
        color("silver")translate([0,-5,7.9/2]){
            sphere(r=2);
            rotate([90,0,20]){
                cylinder(d1=1.5,d2=3,h=8.2);
                translate([0,0,8.2])sphere(r=1.5);
            }
        }
        color("gold"){
            for(i=[0:2])translate([-4.90+i*4.9,0,0]){
                translate([0,12,7.9/2])rotate([90,0,0])cylinder(d=1.2,h=5);
                translate([0,12.95-1,7.9/2-1])rotate([0,-90,0])rotate_extrude(angle=90,convexity=2)translate([1,0,0])circle(r=.6);
                translate([0,12.95,-2])cylinder(d=1.2,h=5);
            }
        }
    }
}
//TSM102C3();
//END module TSM102C3


//pouzdra--------------------------------------------------------

//TO220 HORIZONATAL EAGLE
module TO220_H_EAGLE(){
    translate([0,11.2,0])TO220("TEST",3,0);
    translate([-.3,-5.2,-2])color("silver")cube([.6,.5,4]);
    translate([-.3-2.54,-5.2,-2])color("silver")cube([.6,.5,4]);
    translate([-.3+2.54,-5.2,-2])color("silver")cube([.6,.5,4]);
}
//END module TO220_H_EAGLE

//TO220_H_EAGLE();

//metal DIL14 B-B
module DIL14_metal(h=7.62){
  for(i=[0:6])for(j=[0:1])translate([2.54*3*j-3*2.54/2,2.54*i-2.54*6/2,0]){
    color("gold")cylinder(h,d=.41);
  }
  //22.3 12.95
  translate([0,0,h+1])color("silver")cube([12.95,22.3,2],center=true);
  translate([0,0,h+6.35/2])color("silver")cube([10.95,20.3,6.35],center=true);
}
//DIL14_metal();

//TC38H horizontal xtal 32khz
module TC38H(trmen=true,tr_y=6.4){
translate([0,0,1])rotate([-90,0,0])rd_xtal(["C_002RX", [ 2.0,   0,    6],false,0.7,  0.2], value = "32.768", z = 1.5, pitch = inch(0.1),tail=0);
    translate([1.25,0,-2])color("silver")cylinder(d=.2,h=3);    
    translate([-1.25,0,-2])color("silver")cylinder(d=.2,h=3);
       if(trmen){
    translate([-1.3,tr_y,-2])color("silver")cylinder(d=.6,h=3);    
    translate([1.3,tr_y,-2])color("silver")cylinder(d=.6,h=3);
    translate([0,tr_y,1])rotate([90,0,0])color("silver")rotate_extrude(angle=180,convexity=5)translate([1.3,0,0])circle(.3);
       }   
}
//TC38H(true,2);
//END module TC38H

module OSR6LU3E34X(){
    rotate([0,0,90]){
    translate([-3.9,0,3.3])rotate([0,-90,0])color("red"){
        cylinder(h=3.7-1.5,d=3);
        translate([0,0,3.7-1.5])sphere(1.5);
    }
    translate([-3.9,-4.5/2,0])color("darkgrey")cube([5.6,4.5,6.6]);
    translate([0,-1.25,-2])color("silver")cylinder(h=2,d=0.5);
    translate([0,1.25,-2])color("silver")cylinder(h=2,d=0.5);
}
}
//OSR6LU3E34X();
//END module OSR6LU3E34X

//sluchatko, srouby
module FE56211(){
  //kontakty
  color("silver")difference(){
    union(){
      cylinder(h=1.5, d=15);
      difference(){
        cylinder(h=1.5,d=39);
        translate([0,0,-.01])cylinder(h=1.65,d=25);
      }
    }
    translate([0,0,-.01]){
      cylinder(h=1.65, d=2.8);
      translate([16.5,0,0])cylinder(h=1.65, d=2.8);
    }
  }
  color("grey")translate([0,0,1.5])cylinder(h=12,d=43);
  color("silver")difference(){
    union(){
      translate([0,0,13.5])cylinder(h=4.5,d=48);
      difference(){
        translate([0,0,18])cylinder(h=2,d=40);
        translate([0,0,19])cylinder(h=2,d=23);
      }
    }
    translate([0,0,17]){
      cylinder(h=8,d=1.8);
      for(i=[0:5])rotate([0,0,i*60])translate([7,0,0])cylinder(h=8,d=1.8);
    }
  }
}
//FE56211();
//END module FE56211





//*********************************************************

//for NopSCAD lib

//C svitek, radial, obdelnikove pouzdro 7,5x2,5x7,5 RM5mm
// [size radius],výška nad PCB,[rozteč průmě délka vývodů],[barvy pouzdro, text]
CBOX7x2x7  = ["CBOX7.5x2.5x7.5",  [7.5, 2.3, 7.5, 0.25], .5, [5,  0.6, 0.4], [5, 0.6, 2.5], ["Yellow", "LightYellow"]];

/*
function rd_electrolytic_size(type)    = type[1]; //! Diameter, crimp diameter, height
function rd_electrolytic_radius(type)  = type[2]; //! Corner radius
function rd_electrolytic_crimp(type)   = type[3]; //! Width and height of crimp
function rd_electrolytic_lead_d(type)  = type[4]; //! Lead diameter
function rd_electrolytic_pitch(type)   = type[5]; //! Lead pitch
function rd_electrolytic_colours(type) = type[6]; //! Colour of jacket and stripe
*/
//Ellyt cap radial 10,5x16,5 RM5
//ECAP8x11 = ["ECAP8x12", [8.2, 7.5, 12.5], 0.5, [2.4, 2.5], 0.5, inch(0.1), [grey(20), grey(60)]];
ECAP10x13=["ECAP10.5x13.5", [10.5,9.5, 14], .7, [3, 1], 0.5, inch(.1), ["lightblue", "blue"]];
ECAP10x16=["ECAP10.5x16.5", [10.5,9.5, 17], .7, [3, 1], 0.5, inch(.1), ["lightblue", "blue"]];
//ellyt cap radial 8x10 RM3,5
ECAP8x10_3=["ECAP8x10_3.5", [8.2,7.5, 10.5], .7, [2.4, 2.5], 0.5, 3.59, ["brown", "gray"]];
//ellyt cap radial 8x10 RM3,5
ECAP6x5_3=["ECAP6x5_3.5", [6,4.5, 5], .7, [2.4, 2.5], 0.5, 3.59, ["brown", "gray"]];


//rele
G5V2=["G5V2",
"Relay",//typ modulu Relay, PSU...
[20,10,11],//rozměr modulu x,y,z
0.2,//polomer rohu
"lightgray",//barva
[.5,.3,4],//rozmer pinu x,y,z
[[8.985,3.81],[8.985,-3.81],[2.54,3.81],[2.54,-3.81],[-2.54,3.81],[-2.51,-3.81],[-8.985,3.81],[-8.985,-3.81]] //souradnice pinu
];
//SMD
SOT223=["SOT223", [6.5, 3.5, 1.6], 0.05, 0.89, 2.3, 7.0, [0.7, 0.95, 0.25], 3];

//odrusovaci civka (transformator)
CM_CHOKE1 = ["CM_CHOKE1",
  [10.4, 5.2, 4, 0.5],//! Jádro OD, ID, šířka Y, poloměr rohu
  [.2, .2],//! podložka po obvodu, tloušťka, šířka
  [6, 5, .5],//! Y rozmery střední přepážka celková výška, výška zubu, šířka zubu
  [1, 2, 2],//! X rozmery střední přepážka šířka mezery, celková šířka ve středu, výška ve středu
  [inch(0.2),inch(0.2),2.5,0.35]//! rozteč x, rozteč y, délka vývodu, průměr drátu
];

//knofliky-----------------------------------------------------

//GMN-4
//barevne varianty tělo černé, ukazatel červený, žlutý
//tělo šedé ručka černá, červená
//d16 vyska 14 delka diry12!!

module GMN_4(var=1){
   difference(){
        union(){
            cylinder(d=15.8, h=2);
            cylinder(d1=12, d2=11, h=14);
            translate([0,0,2])cylinder(d2=11.2, d1=15.8, h=1);
        }
        translate([0,0,-1])cylinder(d=6,h=13);
   }
}
//GMN_4();
//end module GMN_4




