/* díly Merkur pro OpenSCAD
 * pieces of Merkur for OpenSCAD
 * https://openscad.org
 * https://www.merkurtoys.cz
 * http://merkur.kreteni.cz
 *
 * (c) 2020-2026 Ondrej Weisz
 * free for use
 *
 * modul Merkuru
 * Merkur module 10 mm, screw, nuts M3.5
 * strip zinc Nx10 x 10.0 x 1, strip color Nx10 x 10.2 x 1,2
 *
 * použití: zkopíruj soubor do knihovní složky
 * use: copy file to library directory use to OpenSCAD eg:
 * $HOME/Documents/OpenSCAD/library/merkur
 * 
 * do souboru scad vlož řádku
 * insert to file scad include line:
 * include <merkur/merkur.scad>
 *
 * simple variant
 * jednoduche provedení
 *
 */
 
 
include <merkur_utils1.scad>

//  1040 - wheel 23 mm growe
//  $fn=30;M1040("green");
module M1040(color="green"){
  color(color){T0_Wex(23.5/2,2.5,30);
    rotate([180,0,0])T0_Wex(23.5/2,2.5,30);
    difference(){
      translate([0,0,-.8])cylinder(1.6,d=15.6);
      translate([0,0,-1.02])cylinder(2.1,d=4);
    }
  }
  translate([0,0,-1.7])T0_hub(10.3);
}

//  1041 - wheel 30 mm
//  $fn=30;M1041();
module M1041(color="yellow"){
  //#cylinder(h=10,d=28.2);
  th=.8;
  translate([0,0,1.1])T0_hub(8.9);
  color(color)difference(){
    union(){
      translate([0,0,th])cylinder(h=1.5,d1=12,d2=9);
      cylinder(th,d=28);
    }
    union(){
      T1_hole(th=th+1.5);
      translate([0,0,-.05])cylinder(h=2,d1=10,d2=6);
      for(i=[0:45:359])rotate([0,0,i])translate([10,0,0])T1_hole(th=th);
    }
  }
}

//  1042 - wheel 38 mm growe
//  $fn=30;M1042();
module M1042(color="green"){
  //#translate([0,0,-3])cylinder(h=11,d=38.5);
  color(color){
    T0_Wex(38.5/2,3,30);
    rotate([180,0,0])T0_Wex(38.5/2,3,30);
    translate([0,0,-.8])difference(){
      cylinder(1.6,d=29);
      union(){
        T1_hole(th=1.6);
        for(i=[0:45:359])rotate([0,0,i])translate([10,0,0])T1_hole(th=1.6);
      }
    }
  }
  translate([0,0,-1.35])T0_hub(9.5);
}

//  1043 - wheel 62 mm growe
//  $fn=30;M1043();
module M1043(color="green"){
  //#translate([0,0,-3.5])cylinder(h=14,d=61);
  color(color){
    T0_Wex(61/2,3.5,30);
    rotate([180,0,0])T0_Wex(61/2,3.5,30);
    T0_W1(1.6);
  }
  translate([0,0,-1.5])T0_hub(10.5);
}

//  1044 - gear worm
//  $fn=30;M1044();
module M1044(){
  //#cylinder(h=16,d=11);
  color("silver")difference(){
    union(){
      cylinder(h=10,d=9);
      translate([0,0,10])cylinder(6,d=8);
      translate([0,0,5])linear_extrude(height = 10, center = true, convexity = 10, twist = -2200)translate([3.6, 0, 0])circle(r = 2,$fn=8);
    }
    translate([0,0,-1])cylinder(20,d=3.8);
  }
  translate([0,-1.5,13.3])rotate([90,0,0])T0_WM4();
}

//  1045 - gear 50 th. m0.6
//  $fn=30;M1045();
module M1045(){
  T0_hub(10);
  color("black"){
    difference(){
      cylinder(2.5,d=29);
      T0_W2(2.5);
    }
    for(i=[0:360/50:359])rotate([0,0,i])translate([14.5,0,0])cylinder(2.5,d=2.5,$fn=3);
  }
}

//  1046 - gear 17 th. m0.6
//  $fn=30;M1046();
module M1046(){
  color("silver")difference(){
    union(){
      cylinder(h=5.5,d=9);
      translate([0,0,5])cylinder(7.3,d=8);
      for(i=[0:360/17:359])rotate([0,0,i])translate([4.2,0,0])cylinder(5.5,d=2.5,$fn=3);

    }
    translate([0,0,-1])cylinder(20,d=3.8);
  }
  translate([0,-1.5,9])rotate([90,0,0])T0_WM4();
}

//  1047 gear 83 th. m0.6
//  $fn=30;M1047();
module M1047(){
  //#cylinder(h=10,d=51);
  color("black")difference(){
    union(){
      cylinder(h=2.5,d=49);
      for(i=[0:360/83:359])rotate([0,0,i])translate([24.5,0,0])cylinder(2.5,d=2.5,$fn=3);
    }
    T0_W6(2.5);
  }
  translate([0,0,0])T0_hub(10);
}

//  1048 - pulley
//  $fn=30;M1048();
module M1048(){
  color("Silver"){
    difference(){
      union(){
        cylinder(h=3.5,d1=11,d2=11);
        cylinder(h=0.5,d1=14,d2=14);
        translate([0,0,3])cylinder(h=0.5,d1=14,d2=14);
      }
      translate([0,0,-0.05])cylinder(3.6,d=3.8);
    }
  }
}

//  1049 - join shaft 3 worm
//  $fn=30;M1049();
module M1049(){
  color("Silver"){
    difference(){
      union(){
        cylinder(h=20.2,d=8);
        translate([0,-1,5])rotate([90,0,0])T0_WM4();
        translate([0,-1,16])rotate([90,0,0])T0_WM4();
        translate([-1,0,10])rotate([0,-90,0])T0_WM4();
      }
      union(){
        translate([0,0,-0.05])cylinder(21,d=3.8);
        translate([0,5,10])rotate([90,0,0])cylinder(10,d=3.8);
        translate([-5,0,5])rotate([0,90,0])cylinder(10,d=3.8);
      }
    }
  }
}

//  1050 - shaft stop piec.
//  $fn=30;M1050();
module M1050(){
  color("Silver"){
    translate([0,-1.3,3.8])rotate([90,0,0])T0_SM3();
    difference(){
      cylinder(h=7.6,d1=8,d2=8);
      translate([0,0,-0.05])cylinder(10,d=3.8);
    }
  }
}

//  1051 - nut M3.5
//  $fn=30;T0_M35N();translate([20,0,0])T0_M35N("thick");
module M1051(thn="normal"){
  color("silver")T0_M35N(thn);
}

//  1052 - screw M3.5x6
//  $fn=30;M1052(1);
module M1052(dx=30,thn="normal"){
    color("silver")T0_M35(6,dx,thn);
}

//  1053 - screw M3.5x8
//  $fn=30;M1053(6,"thick");
module M1053(dx=30,thn="normal"){
    color("silver")T0_M35(8,dx,thn);
}

//  1054 - screw M3.5x16
//  $fn=30;M1054(6);
module M1054(dx=30,thn="normal"){
    color("silver")T0_M35(16,dx,thn);
}

//  1055 - screw M3.5x20
//  $fn=30;M1055(6);
module M1055(dx=30,thn="normal"){
    color("silver")T0_M35(20,dx,thn);
}

//  1056 - gear cone 26 th. m0.6
//  fn=30;M1056();
module M1056(){
  color("black")
  difference(){
    union(){
      translate([0,0,8])cylinder(h=2.5,d1=13.2 ,d2=9.4);
      for(i=[0:360/25:359])rotate([0,0,i])
      translate([7,0,8.5])rotate([0,-45,0])cylinder(3.5,d2=1.5,d1=2.5,$fn=3);
    }
    cylinder(30,d=3.8);
  }
  translate([0,0,9])rotate([180,0,0])T0_hub(9);
}

//  1057 - gear crone 50 th. m0.6
//  $fn=30;M1057();
module M1057(){
  color("gray")difference(){
    union(){
      color("gray")translate([0,0,8])cylinder(h=2.5,d=33);
      for(i=[0:360/50:359])rotate([0,0,i])translate([16.5,0,11])rotate([0,-90,0])cylinder(2,d=2.5,$fn=3);
    }
    //T0_W6(2.5);
    cylinder(10,d=3.8);
    translate([0,0,9])cylinder(5,d=30);
  }
  translate([0,0,10])rotate([180,0,0])T0_hub();
}

//  1068 crank
//  $fn=30;M1068();
module M1068(){
  T0_shaft(75);
  translate([0,89,16])T0_shaft(12);
  translate([0,74,0])rotate([45,0,0])T0_shaft(22);
}

//  1089 tyre for 1040
//  $fn=30;M1089("green",true);translate([40,0,0])M1089("green");
module M1089(color="silver",hub=false){
  color("DarkSlateGray"){
   rotate_extrude()translate([14.5,0,0])circle(d=8); 
  }
  if(hub)M1040(color);
}

//  1092 spring 22 mm
//  $fn=30;M1092(25);
module M1092(h=25){
  hw=(h<20)?20:h;
  translate([0,0,1])color("Gray"){
    cylinder(h=hw,d=2.5);
  translate([0,0,-1])rotate([90,0,0])
    difference(){cylinder(.3,1.6);translate([0,0,-0.05])cylinder(.4,1);}
  translate([0,0,hw+1])rotate([90,0,0])difference(){cylinder(.3,1.6);translate([0,0,-0.05])cylinder(.4,1);}
  }
}

//  1094 push spring 7 x 35 mm
//  $fn=30;M1094(15);
module M1094(h=33){
  hw=(h<5)?5:h;
  color("Gray"){
    rotate_extrude()translate([3.5,0,0])circle(.25);
    linear_extrude(height=hw,convexity = 10, twist = 5000)translate([3.5,0,0])circle(.25);
    translate([0,0,hw])rotate_extrude()translate([3.5,0,0])circle(.25);
  }
}
//  1082 wheel 56 mm, tyre
//  $fn=30;M1082();
module M1082(color="silver"){
  color("DarkSlateGray"){
    translate([0,0,-10.5/2])difference(){
      cylinder(h=10.5,d=52);
      translate([0,0,-0.5])cylinder(h=12,d1=38,d2=38);
    }
  }
  M1042(color);
}

// 1083 tyre 92 mm, M1083(color="red",hub=[true|false]); 
// $fn=30;difference(){M1083(color="red",hub=true);translate([-50,0,-15])cube([100,80,30]);}
//  $fn=30;M1083(color="red",hub=true);
module M1083(color="yellow",hub=false){
  color("DarkSlateGray")translate([0,0,-11]){
    difference(){
    cylinder(h=22, d=90);
    translate([0,0,-0.05])cylinder(h=22.1,d=58);
  }
  rotate_extrude(angle=360,convexity=3)polygon([
    [25,6.5],[25,15.5],[29,20.5],[29,1.5]]);}
  if(hub){
    translate([0,0,3.5])M2083(color);
    translate([0,0,-3.5])rotate([180,0,0])M3083(color);
    for(i=[0:120:359])rotate([0,0,i])translate([20,0,4.2])M2053(8.4);
  }
}

//  1084 belt pás
/*    24x1,délka 384
    zuby 2x2.5 roteč 10,2
    vnitrni vystupek - trojuhelnik zakladna 3.5 vyska 2.31
*/
//  $fn=30;M1084();
module M1084(){text("1084");}


//  1140 - Cardan join shaft 11x11x40
//  $fn=30;M1140(30,-30);
module M1140(angle1=0,angle2=0){
  th=1;
  module T0_1140A(){
    translate([0,0,-20])union(){
      translate([0,0,9])rotate([0,180,0])T0_hub(9);
      color("Silver"){
        difference(){
          union(){
            translate([-5+th/2,-5,7])cube([10-th,10,th]);
            translate([6-1.5*th,5,7+th])rotate([90,90,0])rotate_extrude(angle=90,convexity=5)square([th,10]);
            translate([-5.5,0,20])rotate([0,90,0])hull(){
              cylinder(h=th,d=6);
              translate([12-th,-5,0])cube([1,10,th]);
            }
            translate([4.5,0,20])rotate([0,90,0])hull(){
              cylinder(h=th,d=6);
              translate([12-th,-5,0])cube([th,10,1]);
            }
              translate([-5+th/2,-5,7+th])rotate([-90,90,0])rotate_extrude(angle=90,convexity=5)square([th,10]);
          }
          union(){
            translate([0,0,6.6])cylinder(1.5,d=3.8);
            translate([-6.5,0,20])rotate([0,90,0])cylinder(h=13,d=2.5);
          }
        }
      }
    }
  }
  //MS_1140A();
  module T0_1140B(){
    translate([0,0,-0.5])color("Silver"){
      cylinder(h=1,d=9);
      translate([-1,-6,0])cube([2,12,1]);
      translate([-6,-1,0])cube([12,2,1]);
    }
  }
  //MS_1140B();
  rotate([angle1,0,0])T0_1140A();
  T0_1140B();
  rotate([180+angle2,0,90])T0_1140A();
}

//  1223 - bulb socket
//  $fn=30;M1223();
module M1223(){
  color("silver")difference(){
    cylinder(h=11.2,d=10.8);
    translate([0,0,-.1]){
      cylinder(h=1,d=6.4);
      translate([0,0,.8])cylinder(h=12,d=8.6);
    }
  }
}

//  2043 - wheel 85 mm growe
//  $fn=30;M2043();
module M2043(){
  color("green"){
    translate([0,0,-3])difference(){
      union(){
        cylinder(h=1,d=85);
        translate([0,0,5])cylinder(h=1,d=85);
        cylinder(h=6,d=75);
      }
      union(){
        translate([0,0,-0.05])cylinder(h=2.05,d=74);
        translate([0,0,4.05])cylinder(h=2,d=74);
        translate([0,0,1.95])cylinder(h=2.2,d=66);
      }
    }
    for(i=[0:5])rotate([0,0,i*60])difference(){
      rotate([0,0,-90])translate([-5,5,-1])cube([10,28,2]);
      for(j=[1:3])translate([j*10,0,-1.05])T1_hole(th=2.3);
    }
    difference(){
      translate([0,0,-1])cylinder(h=2, d=15);
      translate([0,0,-1.05])T1_hole(th=4,4);
    }
  }
  translate([0,0,-1.5])T0_hub(10.5);
}

//  2046 - gear 34 th. m0.6
//  $fn=30;M2046();
module M2046(){
  color("silver")difference(){
    union(){
      cylinder(h=1.8,d=18);
      for(i=[0:360/34:359])rotate([0,0,i])translate([9.5,0,0])cylinder(1.8,d=2.5,$fn=3);

    }
    translate([0,0,-1])cylinder(20,d=3.8);
  }
  translate([0,0,-0.5])T0_hub(10.2);
}

//  2047 - gear 117 th. m0.6
//  $fn=30;M2047();
module M2047(){
  difference(){
    union(){
      color("black")difference(){
        cylinder(h=2.5,d=67.5);
        T0_W6(2.5);
      }
      color("black")for(i=[0:360/117:359])rotate([0,0,i])translate([33.8,0,0])cylinder(2.5,d=2.5,$fn=3);

    }
    color("silver")translate([0,0,-1])cylinder(20,d=3.8);
  }
  translate([0,0,-.1])T0_hub(10.1);
}

//  2049 - join shaft 2 worm
//  $fn=30;M2049();
module M2049(){
  color("Silver"){
    difference(){
      union(){
        cylinder(h=20,d1=8, d2=8);
        translate([0,-1,4])rotate([90,0,0])T0_WM4();
        translate([-1,0,10])rotate([0,-90,0])T0_WM4();
      }
      union(){
        translate([0,0,-0.05])cylinder(21,d=3.8);
        translate([0,5,10])rotate([90,0,0])cylinder(10,d=3.8);
        translate([-5,0,4])rotate([0,90,0])cylinder(10,d=3.8);
      }
    }
  }
}

//  2053 - screw M3.5x30
//  $fn=30;M2053();
module M2053(dx=30,thn=T0_nnrm){
    color("silver")T0_M35(10,dx,thn);
}

//  2083 - wheel for tyre 50 mm d58.4,h=9.8
//  $fn=30;M2083();
module M2083(color="yellow"){
  //#translate([0,0,-1])cylinder(h=9.8,d=58.3);
  M3083(color);
  translate([0,0,-1.5])T0_hub(10.5);
}

//  2089 - wheel 65 mm tyre plast.
//  $fn=30;M2089();
module M2089(){
  color("DarkSlateGray"){
   difference(){
    union(){
      cylinder(h=20,d=68);
      translate([0,0,20]){
        cylinder(h=5,d=20);
        difference(){
          cylinder(h=5,d=68);
          cylinder(h=6,d=30);
        }
        
      }

      }
      union(){
        translate([0,0,-0.05])cylinder(h=11,d=28);
        cylinder(26,d=3.8);
      }
    }
  }  
  translate([0,0,23])T0_hub(wm4=true); //8mm nad povrch
}

//  3083 - wheel for tyre 50 mm no hub
//  $fn=30;M3083();
module M3083(color="red"){
  //#cylinder(h=6,d=58.3);
  color(color){
    T0_Wex(58/2,6,52);
    translate([0,0,0])T0_W1(1);
  }
}

//  3049 - join shaft 1 worm
//  $fn=30;M3049();
module M3049(){
  color("Silver"){
    difference(){
      union(){
        cylinder(h=20,d1=8, d2=8);
        translate([0,-1,4])rotate([90,0,0])T0_WM4();
      }
      union(){
        translate([0,0,-0.05])cylinder(21,d=3.8);
        translate([0,5,10])rotate([90,0,0])cylinder(10,d=3.8);
        translate([-5,0,4])rotate([0,90,0])cylinder(10,d=3.8);
      }
    }
  }
}

//  3089 - tyre for 1040 thick
//  $fn=30;M3089(color="silver",hub=true);
module M3089(color="green",hub=false){
  //#cylinder(h=18,d=45);
  translate([0,0,-9])color("DarkSlateGray")difference(){
    cylinder(h=18,d=45);
    union(){
      cylinder(h=18,d=23);
      translate([0,0,-.1])cylinder(h=4,d1=32,d2=27);
      translate([0,0,14])cylinder(h=4.1,d1=27,d2=32);
    }
  }
  if(hub)M1040(color);
}


// module == SCREWS and NUTS ==================

// screw for hub whells, gears and joints
// šrouby pro kola, zarážky a spojky
// var "drive" - no use (compatability with BOSL2 screw model)
// proměnná "drive" nepoužita (kompatabilita s modely šroubů BOSL2)  

//  sroubek do kol a spojek M3
//  screw in center whell M3
// ex:
//  $fn=30;T0_SM3();
module T0_SM3(drive="none"){
  color("Silver"){
     cylinder(3.8,d=3);
     translate([0,0,3.8])cylinder(2,d=5.2);
  }
}

//  worm screw M4
//  stavěcí šroub M4
// ex:
//  $fn=30;T0_WM4();
module T0_WM4(drive="none"){
  color("Silver")cylinder(4, d=4);
}
// -----------------------------------------

// screws and nuts M3.5 
// šrouby a matice M3.5

// nuts M3.5 thickness - výška matice
T0_nnrm=2.6;  //Z-size nut "normal"
T0_nthc=2;    //Z-size nut "thick"

//  screw M3.5 with nut
//  šroub M3.5 s maticí
//  T0_M35(
//    len - thread len, délka závitu
//    dist - nut head dist., odstup matice od hlavy
//    thickness - nut thick, tloušťka matice = "normal"|"thick"
//  );
//  if "dist > len" no render nut
//  pokud "dist > len" nerenreruje matici
// ex:
//  $fn=30;T0_M35(10,5,"thick");translate([10,0,0])T0_M35(10,5);
module T0_M35(shaftlen=4,nutdist=30,thickness="normal",drive="none"){
    translate([0,0,-shaftlen]){
      cylinder(shaftlen,d=3.5);
      thn=(thickness=="normal")?T0_nnrm:T0_nthc;
      translate([0,0,shaftlen])cylinder(2.5,d=5.8);
      if(shaftlen>nutdist)translate([0,0,shaftlen-(nutdist+thn)])T0_M35N(thickness);
    }
}

//  nut M3.5
//  matice thickness
//  T0_M35(
//    thickness - Z size = "normal"|"thick"
//  );
// ex:
//  $fn=30;T0_M35N();translate([20,0,0])T0_M35N("thick");
module T0_M35N(thickness="normal"){
  thn=(thickness=="normal")?T0_nnrm:T0_nthc;
  difference(){
    cylinder(thn,d=6.7,$fn=6);
    translate([0,0,-.05])cylinder(thn+.1,d=3.4);
  }
}

//  wheel hub
//  T0_hub(
//    len
//    wm4 true=worm | screw
//  )
// ex:
//  $fn=30;T0_hub(wm4=true);
module T0_hub(len=10,wm4=false){
  color("silver")difference(){
    cylinder(len,d=8);
    translate([0,0,-.05])cylinder(len+.1,d=3.8);
  }
  translate([0,1.5,len-3.7])rotate([-90,0,0])if(!wm4){T0_SM3();}else{T0_WM4();}
}

// bounded wheel edge
// T0_Wex(
//  dd - diameter
//  h - height (z axis)
//  alpha - angle
// )
// ex:
//  T0_Wex(60,10,30);
module T0_Wex(dd=30,h=5,alpha=60){
    pg=[
      [dd-1-h/tan(alpha),0], //0
      [dd-h/tan(alpha),0], //1
      [dd,h], //2
      [dd-1,h]  //3
    ];
  rotate_extrude()polygon(points=pg);
}

//  T0_W1();
module T0_W1(tw=1){
  translate([0,0,-tw/2])difference(){
    union(){
      rotate_extrude()translate([45/2,0,0])square([1.5,tw]);
      cylinder(tw,d=20);
      for(i=[0:60:359])rotate([0,0,i])translate([8,-5,0])cube([15,10,tw]);
      
    }
    T0_W6(1.6);
  }
}

// T0_W2();
module T0_W2(tw=1){
  translate([0,0,-.05]){
    cylinder(tw+.1,d=4);
    for(i=[0:60:359])rotate([0,0,i])translate([10,0,0])cylinder(tw+.1,d=3.8);
  }
}

//T0_W6();
module T0_W6(tw=1){
  translate([0,0,-.05]){
    cylinder(tw+.1,d=5.7);
    for(i=[0:60:359])rotate([0,0,i]){
      translate([10,0,0])cylinder(tw+.1,d=3.9);
      translate([20,0,0])cylinder(tw+.1,d=3.9);
    }
  }
}

//T0_W6A();
module T0_W6A(tw=1){
  translate([0,0,-.05]){
    cylinder(tw+.1,d=4);
    for(i=[0:60:359])rotate([0,0,i]){
      translate([10,0,0])cylinder(tw+.1,d=3.8);
      translate([20,0,0])cylinder(tw+.1,d=3.8);
      translate([30,0,0])cylinder(tw+.1,d=3.8);
    }
  }
}
