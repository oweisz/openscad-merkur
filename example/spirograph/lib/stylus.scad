include <x_axo.scad>

module tahlo101(mont=false){
  if(mont){
    translate([0,160,0])M1063();
    translate([0,-30,0])rotate([90,0,0])M1050();
    translate([0,460,0])rotate([90,0,0])M1050();
    translate([-10,135,0])rotate([0,-90,180])M1049();
    color("black")translate([0,470,0])axo(550,axo_y,0.5);
  }else{
    M1063();
    translate([0,8,0])rotate([90,0,0])M1050();
    translate([0,269,0])rotate([90,0,0])M1050();
    translate([-10,135,0])rotate([0,-90,180])M1049();
    }
}
/*
include <openscad-merkur/merkur.scad>
tahlo101();
*/
module rameno103(mont=false,doraz=false){
    
    if(mont)color("black")translate([0,0,-85])axo(130,axo_z,0.5);
     translate([0,-30,mont?25:0])M2031();
     translate([0,0,mont?-80:-46])rotate([90,0,0])M2060();
      translate([0,0,-2.5])rotate([180,0,90]){
        M1041();
        for(i=[-10,10])translate([i,0,1])if(mont){
            translate([0,0,30])M2053(20);
            translate([0,0,-10])M1051();
            translate([0,0,-40])M1051();
            color("black")translate([0,0,-42])axo(80,axo_z,0.5);
        }else {
            M2053(1);
            translate([0,0,-7])M1051();
        }
      }
      if(doraz)translate([0,0,mont?-100:-40])M1050();
}

/*
include <openscad-merkur/merkur.scad>
rameno103(true, false);
/*$vpt=[ -0.49, -6.52, 0.44 ];
$vpr=[340,320,80];
$vpd=250;
*/



module rameno102(mont=false,fix=false,fxcolor="green"){
    translate([-10,0,0])M1025();
    translate([10,0,0])M1025();
    translate([0,-170,0])M1025();
    translate([10,0,mont?20:1.2])rotate([0,0,90])M1076();
    translate([10,0,mont?-15:-.5])rotate([0,0,90])M1076();
    translate([10,230,mont?-15:-.5])rotate([0,0,90])M1076();
    translate([-10,76.5,mont?20:7])rotate([90,0,0])M1039();
    translate([-10,223.5,mont?20:7])mirror([0,1,0])rotate([90,0,0])M1039();
    translate([-10,246.5,mont?40:7])rotate([90,0,0])M1039();
    //drzak fixu
    translate([-6,mont?290:253.8,mont?-25+35:-24])rotate([90,0,90]){
      M1150();
        //montaz fixu
      if(fix && !mont){translate([0,-11.5,13])rotate([-90,0,0])fix(fxcolor=fxcolor);
          //gumicka
          dg=2;
          color("red"){
          //dlouhe vzadu
            translate([8,61,1.5])rotate([90,0,0])cylinder(h=52,d=dg);
            //delena
            translate([-8,61,1.5])rotate([96.5,0,5])cylinder(h=18.5,d=dg);

            translate([-6.5,43,-0.5])rotate([90,0,0])cylinder(h=20,d=dg);


            translate([-6.5,23.5,-.5])rotate([81.7,0,-6])cylinder(h=15,d=dg);
            //obloucky
            for(i=[8,-8]){
                translate([i,9.5,5])rotate([-90,0,-90])rotate_extrude(angle=90,convexity=5)translate([3.5,0,0])circle(dg/2);
                translate([i,60.5,5])rotate([0,90,0])rotate_extrude(angle=90,convexity=5)translate([3.5,0,0])circle(dg/2);
            
            }
            
            //obepnuti fixu
            for(i=[6,64]){
                translate([-7,i,11])rotate([90,210,0])rotate_extrude(angle=30,convexity=5)translate([dg/2,0,0])circle(dg/2);
                translate([7,i,11])rotate([90,0,0])rotate_extrude(angle=30,convexity=5)translate([dg/2,0,0])circle(dg/2);
                translate([0,i,13])rotate([90,-30,0])rotate_extrude(angle=115,convexity=5)translate([6.25,0,0])circle(dg/2);
                translate([8,i,11.5])rotate([0,-29,0])cylinder(h=6,d=dg);
                translate([-8,i,11.5])rotate([0,29,0])cylinder(h=6,d=dg);
                translate([8,i,5])cylinder(h=6,d=dg);
                translate([-8,i,5])cylinder(h=6,d=dg);
            }
          }
          //end gumicka
      }
     for(i=[10,60])translate([-9,i,6])rotate([0,-90,0]){
      if(mont){
        translate([0,0,35])M1055(60);
        translate([0,0,10])M1051();
        translate([0,0,7])M1098();
        translate([0,0,2])M1051();
        translate([0,0,-22])M1051();
        translate([0,0,-25])M1098();
        translate([0,0,-30])M1051();
        color("black")translate([0,0,-32])axo(73,axo_z,0.5);
      }else{
        M1055(0);
        translate([0,0,0])M1098();
        translate([0,0,-18])M1051();
        translate([0,0,-18])M1098();
        translate([0,0,-20.5])M1051();
        }
      }
      for(i=[30,40])if(mont){
        translate([-8,i,5])rotate([0,-90,0]){
          translate([0,0,70])M1052(16);
          translate([0,0,-8])M1051();
          color("black")translate([0,0,-12])axo(87,axo_z,0.5);
        }
      }else translate([-8,i,5])rotate([0,-90,0])M1052(1.6);
    }
    if(mont){
      for(i=[[-10,0,1.8],[10,0,1.8],[-10,10,1.8],[10,10,1.8],[-10,230,1.8],[10,230,1.8]])translate(i){
      translate([0,0,40])M1052(26);
      translate([0,0,-35])M1051();
      color("black")translate([0,0,-40])axo(86,axo_z,0.5);
      }
      for(i=[[-10,240,1.8],[10,240,1.8]])translate(i){
      translate([0,0,58])M1052(26);
      translate([0,0,-32])M1051();
      color("black")translate([0,0,-35])axo(98,axo_z,0.5);
    }
    for(i=[-10:10:10])translate([i,70,35]){
      translate([0,0,8])M1052(16);
      translate([0,0,-50])M1051();
      color("black")translate([0,0,-53])axo(64,axo_z,0.5);
    }
    }else{
      for(i=[[-10,0,1.8],[10,0,1.8],[-10,10,1.8],[10,10,1.8],[-10,230,1.8],[10,230,1.8],[-10,240,1.8],[10,240,1.8]])translate(i)M1052(2.6);
      for(i=[-10:10:10])translate([i,70,2])M1052(1.6);
    }
    //vyvazeni
    translate([0,-170,1]){
      if(mont){
        translate([0,0,15])M2053(38);
        translate([0,0,-30])M1051();
        color("black")translate([0,0,-35])axo(55,axo_z,0.5);
        translate([0,0,-10])M2041();
        translate([0,0,-15])M2041();
      }else{
        M2053(3.8);
        translate([0,0,-2])M2041();
        translate([0,0,-3.5])M2041();
      }
    }
  }

/*
include <openscad-merkur/merkur.scad>
rameno102(false,true);
$fn=50;
/*$vpt=[ 0.80, 120.60, 15.83 ];
$vpr=[73,0,121];
$vpd=550;
*/

module rameno101(pos=0,zpos=0,rot=0,doraz=false,mont=false,fix=false,fxcolor="green"){
    rotate([0,0,rot]){
    translate([0,0,12+zpos])rameno103(doraz=doraz);
    translate([0,(pos<94?pos:94)-207,zpos+11]){
      rameno102(fix=fix,fxcolor=fxcolor);
      if(mont){
        translate([0,-115,18])M2062();
        translate([0,70,18])rotate([90,90,0])M1050();
        translate([0,238,18])rotate([90,90,0])M1050();
        color("black")translate([0,240,18])axo(360,axo_y,0.5);
      }else{
        translate([0,66,18])M2062();
        translate([0,75,18])rotate([90,90,0])M1050();
        translate([0,233,18])rotate([90,90,0])M1050();
      }
    }
  }
}
/*
include <openscad-merkur/merkur.scad>
rameno101(mont=true,pos=40);
$vpt=[ -45.36, -101.38, -12.51 ];
$vpr=[68,0,115];
$vpd=650;
*/

module rameno(xpos=0,ypos=0,zpos=0,xrot=0,yrot=0,zrot=0,ax=0,az=0,mont=false,fix=false,fxcolor="green"){
  translate([xpos,0,0])rotate([xrot,0,0]){
    translate([135,5,0])rotate([0,0,90])tahlo101(mont=mont);
   if(mont){
    translate([0,0,55])rameno101(pos=ypos,zpos=zpos,rot=zrot,doraz=false);
    translate([0,0,-20])M1050();
      color("black")translate([0,0,-23])axo(115,axo_z,0.5);
    translate([0,0,15])rotate([0-ax,0,180+30])M1015();
   }else{ translate([0,0,6])rameno101(pos=ypos,zpos=zpos,rot=zrot,doraz=true,fix=fix,fxcolor=fxcolor);
    translate([0,0,4])rotate([0-az,0,180+ax])M1015();
    }
  }
  
}


//translate([0,-19,135])rotate([0,0,180])
//rameno(xpos=0,ypos=0,zpos=0,xrot=0,zrot=0,ax=0,az=0);


module fix(fxcolor="Green"){
  color(fxcolor){
    translate([0,0,0])cylinder(h=5, d1=0.5, d2=4);
    translate([0,0,5])cylinder(h=3, d=5);
    translate([0,0,8])cylinder(h=5, d1=5, d2=10);
    translate([0,0,13])cylinder(h=100, d=11);
    translate([0,0,113])sphere(d=11);
  }
}
//fix("Red",false);


//montaz ramene
/*include <openscad-merkur/merkur.scad>
import("sasi.stl");
import("prevody.stl");
translate([0,-19,135])rotate([0,0,180])
rameno(xpos=0,ypos=0,zpos=0,xrot=0,zrot=0,ax=0,az=0,mont=false,fix=true);
/*$vpt=[ -19.47, 0.59, 119.63 ];
$vpr=[50,0,305];
$vpd=1000;
*/