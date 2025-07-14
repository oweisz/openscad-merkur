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

//  1001 - V strip 1-1 hole
//  $fn=30;M1001();
module M1001(){
  th=.85;
  color("silver")difference(){
    union(){
      hull(){
        cylinder(h=th,d=10);
        translate([-5,5.075,th/2])rotate([0,90,0])cylinder(h=10,d=th);
      }
      translate([0,5.5,10.9-5])hull(){
        rotate([90,0,0])cylinder(h=th,d=10);
        translate([-5,-.85,-5.5])cube([10,th,1]);
      }
    }
    union(){
      T1_hole(th=th);
      translate([0,5.5,5.3])rotate([90,0,0])T1_o_hole(th=th+.5);
    }
  }
}

//  1002 - strip 2 holes
//  $fn=30;M1002();
module M1002(){
  th=.8;
  color("silver")difference(){
    T1_strip(x=10,y=20,hole=1,th=th);
    translate([0,10,0])T1_o_hole(th=th);
  }
} 
 
//  1003 - strip 3 holes
//  $fn=30;M1003();
module M1003(){
  color("silver")T1_strip(x=10,y=0,hole=3,th=1);
}

//  1004 - strip 4 holes
//  $fn=30;M1004();translate([5,5,3])M1004("red");
module M1004(color="silver"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=4,th=1+ca);
}

//  1005 - strip 5 holes
//  $fn=30;M1005(color="red");
module M1005(color="silver"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=5,th=1+ca);
}

//  1006 - strip 6 holes
//  $fn=30;M1006();
module M1006(color="red"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=6,th=1+ca);
}

//  1007 - strip 7 holes 
//  $fn=30;M1007();
module M1007(color="red"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=7,th=1+ca);
}
 
//  1009 - strip 9 holes 
//  $fn=30;M1009();
module M1009(color="red"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=9,th=1+ca);
}

//  1010 - strip 10 holes
//  $fn=30;M1010();
module M1010(color="red"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=10,th=1+ca);
}

//  1011 - strip 110 mm
//  $fn=30;M1011();
module M1011(color="red"){
  th=1;
  color(color)difference(){
    T1_strip(x=10,y=110,hole=0,th=th);
    union(){
      T1_hole(th=th);
      hull(){
        translate([0,10,0])T1_hole(th=th);
        translate([0,40,0])T1_hole(th=th);
      }
      translate([0,50,0])T1_hole(th=th);
      hull(){
        translate([0,60,0])T1_hole(th=th);
        translate([0,90,0])T1_hole(th=th);
      }
      translate([0,100,0])T1_hole(th=th);
    }
  }
}

//  1015 - strip 15 holes 
//  $fn=30;M1015();
module M1015(color="red"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=15,th=1+ca);
}

//  1016 - half circle plate 70 mm 
//  $fn=30;M1016();
module M1016(color="green"){
  th=1;
  color(color){
    difference(){
      union(){
        difference(){
          cylinder(h=th,d=70.2);
          translate([-36,-40+1.5,-.05])cube([72,35,th+.1]);
        }
        hull(){
          translate([-70.2/2+1.7,-5+1.5,0])cylinder(h=th,d=3);
          translate([70.2/2-1.7,-5+1.5,0])cylinder(h=th,d=3);
        }
      }
      union(){ //40
        for(i=[-30:10:30])translate([i,0,0])rotate([0,0,90])T1_o_hole(th=th);
        n=9;
        alpha=160;
        d=alpha/n;
        for(i=[0:n-1])rotate([0,0,i*d-4*d])translate([0,30,0])rotate([0,0,90])T1_o_hole(th);
      }
    }
  }
}

//  1017 - plate 60x40 
//  $fn=30;M1017();
module M1017(color="green"){
  color(color)T1_3str(5);
}

//  1018 - plate 80x40
//  $fn=30;M1018();
module M1018(color="green"){
  ca=sca(color);
  color(color)T1_3str(7);
}

//  1019 - plate 110x40
//  $fn=30;M1019("green");
module M1019(color="green"){
  ca=sca(color);
  color(color)T1_3str(10);
}

//  1020 - plate 50x20
//  $fn=30;M1020();
module M1020(color="red"){
  color(color)T1_2str(5);
 }

//  1021 - plate 80x20
//  $fn=30;M1021();
module M1021(color="red"){
  color(color)T1_2str(7);
}

//  1022 - plate 100x20
//  $fn=30;M1022();
module M1022(color="red"){
  color(color)T1_2str(9);
}

//  1023 - plate 150x20 
//  $fn=30;M1023();
module M1023(color="red"){
  color(color)T1_2str(15);
}

//  1024 - U plate 50.5x31.4x11.3
//  $fn=30;M1024();
module M1024(color="blue"){
  th=.85;
  x=29.2;
  y=50.5;
  hx=3;
  hy=5;
  color(color)difference(){
    union(){
      translate([-(x%10)/2,0,0]){
        T1_u1stp(y=y,hole=5,th=th,left=false);
        translate([x,0,0])T1_u1stp(y=y,hole=5,th=th,left=true);
        translate([0,-(y%10)/2-5,0])cube([x,y,th]);
      }
    }
    for(i=[0:10:(hx-1)*10],j=[0:10:(hy-1)*10])translate([i,j,0])T1_hole(th=th);
  }
}

//  1025 - strip 25 holes
//  $fn=30;M1025();
module M1025(color="red"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=25,th=1+ca);
}

//  1026 - rounded strip 5 holes
//  $fn=30;M1026();
module M1026(color="red"){
  ca=sca(color);
  th=1+ca;
  translate([0,-30,0])rotate([0,0,45])color(color)difference(){
    union(){
      translate([0,0,1])rotate([0,0,10])rotate_extrude(angle=70,convexity=2)translate([25,0,0])square([10,1+ca]);
      translate([30,0,0])cylinder(1+ca,d=10);
      translate([0,30,0])cylinder(1+ca,d=10);
      translate([0,0,0])rotate([0,0,0])rotate_extrude(angle=11,convexity=2)translate([25,0,0])square([10,1+ca]);
      translate([0,0,0])rotate([0,0,79])rotate_extrude(angle=11,convexity=2)translate([25,0,0])square([10,1+ca]);
     
    }
    union(){
      translate([30,0,0])T1_hole(th=th);
      translate([0,0,1]){
        rotate([0,0,45/2])translate([30,0,0])hull(){
          translate([0,-1,0])T1_hole(th=th);
          translate([0,1,0])T1_hole(th=th);
        }
        rotate([0,0,45])translate([30,0,0])T1_hole(th=th);
        rotate([0,0,45+45/2])translate([30,0,0])hull(){
          translate([0,-1,0])T1_hole(th=th);
          translate([0,1,0])T1_hole(th=th);
        }
      }
      translate([0,30,0])T1_hole(th=th);
    }
  }
}

//  1027 - V strip 10 holes
//  $fn=30;M1027();
module M1027(color="red"){
  ca=sca(color);
  color(color)T1_Vstrip(10);
}

//  1028 - V strip 15 holes
//  $fn=30;M1028();
module M1028(color="red"){
  ca=sca(color);
  color(color)T1_Vstrip(15);
}

//  1029 - V strip 25 holes
//  $fn=30;M1029();
module M1029(color="red"){
  ca=sca(color);
  color(color)T1_Vstrip(25);
}

//  1030 - U strip 2-1-2 holes
//  $fn=30;M1030();
module M1030(){
  color("silver")T1_u_strip(x=10.2,y=12.4,z=22.6,th=1.1,yh=1,zh=2,zd=7.3);
}

//  1031 - U strip 1-5-1 holes
//  $fn=30;M1031();
module M1031(){
  color("silver")T1_u_strip(x=10,y=52.3,z=11.3,th=.8,yh=5,zh=1,zd=6.5);
}

//  1032 - Z strip 1-1-1 holes
//  $fn=30;M1032();
module M1032(){
  th=1; //thick material
  x=10; //width material
  y=21.6; //y size
  y1=(y-x-th)/2; //central bar
  z=11.2; //z size
  z1=z/2; //z size central hole
  color("silver")difference(){
    union(){
      cylinder(h=th,d=x);
      translate([-x/2,0,0])cube([x,y1,th]);
      translate([-x/2,y1,th])cube([x,th,z-2*th]);
      translate([0,y-x,z-th])cylinder(h=th,d=x);
      translate([-x/2,y1+th,z-th])cube([x,y-x-y1-th,th]);
      translate([-x/2,y1,th])rotate([0,90,0])rotate_extrude(angle=90,convexity=5)square([th,x]);
      translate([x/2,y1+th,z-th])rotate([90,0,-90])rotate_extrude(angle=90,convexity=5)square([th,x]);
    }
    union(){
      T1_hole(th=th);
      translate([0,y1,z1])rotate([-90,0,0])T1_hole(th=th);
      translate([0,y-x,z-th])T1_hole(th=th);
    }
  }
}

//  1033 - U strip 1-1-1 holes
//  $fn=30;M1033();
module M1033(){
  color("silver")T1_u_strip(x=10.2,y=12.8,z=12.1,th=1,yh=1,zh=1,zd=7);
}

//  1034 - croach
//  $fn=30;M1034();
module M1034(){
  th=.8;      //thick
  x=10;       //width
  y=30;       //lenght
  //y1=3.6;       //first bar
  y1=(y-10)/4-th/2;
  y2=(y-10)/2;  //central hole
  //y3=14.8;         //second bar
  y3=y-10-y1-th;
  z=13.8;           //height
  //z1=7.2;
  z1=z/2+th/2;  //bar holes
  color("silver")difference(){
    union(){
      difference(){
        union(){
          cylinder(h=th,d=x);
          translate([0,y-10,0])cylinder(h=th,d=x);
        }
        translate([0,y2,th/2-.05])cube([x,y-12,th+.2],center=true);
      }
      translate([-x/2,0,0])cube([x,y1,th]);
      translate([-x/2,y1,th])rotate([0,90,0])rotate_extrude(angle=90,convexity=5)square([th,x]);
      translate([-x/2,y3+th,0])cube([x,y1,th]);
      translate([-x/2,y3+th,th])rotate([-90,0,-90])rotate_extrude(angle=90,convexity=5)square([th,x]);
      translate([-x/2,y1,th])cube([x,th,z-2*th]);
      translate([-x/2,y3,th])cube([x,th,z-2*th]);
      translate([x/2,y1+th,z-th])rotate([90,0,-90])rotate_extrude(angle=90,convexity=5)square([th,x]);
      translate([-x/2,y1+th,z-th])cube([x,y3-y1-th,th]);
      translate([-x/2,y3,z-th])rotate([90,0,90])rotate_extrude(angle=90,convexity=5)square([th,x]);
    }
    union(){
      T1_o_hole(th);
      translate([0,y-10,0])T1_o_hole(th);
      translate([0,y2,z-th])T1_hole(th=th);
      translate([0,y1,z1])rotate([-90,0,0])T1_hole(th=th);
      translate([0,y3,z1])rotate([-90,0,0])T1_hole(th=th);
    }
  }
}

//  1035 - U plate 50.3x51.6x11.3
//  $fn=30;M1035(color="blue");
module M1035(color="blue"){
  th=.85;
  x=49.2;
  y=50.3;
  hx=5;
  hy=5;
  color(color)difference(){
    union(){
      translate([-(x%10)/2,0,0]){
        T1_u1stp(y=y,hole=5,left=false);
        translate([x,0,0])T1_u1stp(y=y,th=th,hole=5,left=true);
        translate([0,-(y%10)/2-5,0])cube([x,y,th]);
      }
    }
    for(i=[0:10:(hx-1)*10],j=[0:10:(hy-1)*10])translate([i,j,0])T1_hole(th=th);
  }
}

//  1036 - U plate 100.3x51.6x11.3
//  $fn=30;M1036();
module M1036(color="blue"){
  th=.85;
  x=49.2;
  y=100;
  hx=5;
  hy=10;
  color(color)difference(){
    union(){
      translate([-(x%10)/2,0,0]){
        T1_u1stp(y=y,hole=10,th=th,left=false,oval=true);
        translate([x,0,0])T1_u1stp(y=y,hole=10,th=th,left=true,oval=true);
        translate([0,-(y%10)/2-5,0])cube([x,y,th]);
      }
    }
    for(i=[0:10:(hx-1)*10],j=[0:10:(hy-1)*10])translate([i,j,0])T1_hole(th=th);
  }
}

//  1037 - right angle strip 3-3 holes
//  $fn=30;M1037();
module M1037(color="silver"){
    th=1;
  color(color)difference(){
    union(){
      translate([20,0,0])cylinder(h=th,d=10);
      translate([0,20,0])cylinder(h=th,d=10);
      hull(){
        translate([-3.5,-3.5,0])cylinder(h=th,d=3);
        translate([-5,0,0])cube([10,1,th]);
        translate([0,-5,0])cube([1,10,th]);
      }
      translate([0,-5,0])cube([20,10,th]);
      translate([-5,0,0])cube([10,20,th]);
    }
    union(){
      for(i=[0:5:20])translate([i,0,0])T1_hole(th=th);
      hull(){
        translate([0,15,0])T1_hole(th=th);
        translate([0,20,0])T1_hole(th=th);
      }  
      for(i=[0:5:10])translate([0,i,0])T1_hole(th=th);
    }
  }
}

//  1038 - joint plate small 
//  $fn=30;M1038();
module M1038(color="green"){
  th=1;
  color(color)difference(){
    translate([0,0,0])hull(){
      translate([-5+1.65,-5+1.65,0])cylinder(h=th,d=3.3);
      translate([30.3-5-1.65,-5+1.65,0])cylinder(h=th,d=3.3);
      translate([30.3-5-.5,12.2-.5,0])cylinder(h=th,d=1);
      translate([10,20,0])cylinder(h=th,d=10.3);
      translate([-5+.5,12.2-.5,0])cylinder(h=th,d=1);
    }
    union(){
      for(i=[0:10:20])translate([i,0,0])T1_hole(th=th);
      for(i=[10:10:20])translate([10,i,0])T1_hole(th=th);
      hull(){
        translate([0,10,0])T1_hole(th=th);
        translate([2.85,13,0])T1_hole(th=th);
      }
      hull(){
        translate([20,10,0])T1_hole(th=th);
        translate([20-2.85,13,0])T1_hole(th=th);
      }
    }
  }
}

//  1039 - joint plate small bent
//  $fn=30;M1039();
module M1039(color="green"){
  th=1;
  module strip(){
    difference(){
      translate([-30.3/2+10,0,0])hull(){
        translate([0,-5.3,0])cube([30.3,5,th]);
        translate([1.5,3.5,0])cylinder(h=th,d=3);
        translate([30.3-1.5,3.5,0])cylinder(h=th,d=3);
      }
      for(i=[0:10:20])translate([i,0,0])T1_hole(th=th);
    }
  }
  color(color){
    difference(){
      translate([0,0,0])hull(){
        translate([-30.3/2+10,-4.8,0])cube([30.3,1.5,th]);
        translate([30.3-5-.5,2.2-.5,0])cylinder(h=th,d=1);
        translate([10,10,0])cylinder(h=th,d=10.3);
        translate([-5+.5,2.2-.5,0])cylinder(h=th,d=1);
      }
      union(){
        for(i=[0:10:10])translate([10,i,0])T1_hole(th=th);
      hull(){
          translate([0,0,0])T1_hole(th=th);
          translate([2.85,3,0])T1_hole(th=th);
        }
        hull(){
          translate([20,0,0])T1_hole(th=th);
          translate([20-2.85,3,0])T1_hole(th=th);
        }
      }
    }
    translate([0,-5.7+th,6.5])rotate([90,0,0])strip();
    translate([30.3/2+10,-4.5,1.2])rotate([0,90,180])
    rotate_extrude(angle=90,convexity=5)translate([.2,0,0])square([th,30.3]);
  }
}

//  1058 - banister 5 holes
//  $fn=30;M1058();
module M1058(color="blue"){
  color(color)T0_BT(5);
}

//  1060 - shaft 30 mm
//  $fn=30;M1060();
module M1060(){
  T0_shaft(30);
}

//  1061 - shaft 70 mm
//  $fn=30;M1061();
module M1061(){
  T0_shaft(70);
}

//  1062 - shaft 120  mm
//  $fn=30;M1062();
module M1062(){
  T0_shaft(120);
}

//  1063 - shaft 270 mm
//  $fn=30;M1063();
module M1063(){
  T0_shaft(270);
}

//  1064 - shaft 22 mm
//  $fn=30;M1064();
module M1064(){
  T0_shaft(22);
}

//  1065 - shaft 60 mm
//  $fn=30;M1065();
module M1065(){
  T0_shaft(60);
}

//  1066 - shaft 270 mm thread
//  $fn=30;M1066();
module M1066(){
  T0_shaft(270);
}


//  1070 - pawl small left
//  $fn=30;M1070();
module M1070(){
  color("Silver"){
    difference(){
      union(){
        cylinder(h=1,d1=8,d2=8);
        translate([2,-2,0])cube([8,4,1]);
        translate([8.3,-1.5,0])rotate([0,0,-30])union(){
            cube([5,4,1]);
            translate([5,0,0])cube([1,3,3]);
            translate([5,1.5,3])rotate([0,90,0])cylinder(h=1,d1=3,d2=3);
        }
      }
      translate([0,0,-0.05])cylinder(1.1,d=3.8);
    }
  }
}

//  1071 - pawl left
//  $fn=30;M1071();
module M1071(){
  color("Silver"){
    difference(){
      union(){
        cylinder(h=1,d1=12,d2=12);
        translate([0,0,0])cube([24,7,1]);
        translate([23,0,0])rotate([0,-15,0])cube([3,2,1]);
        translate([12,7,6])rotate([-90,0,0])cylinder(h=1,d1=10,d2=10);
        translate([32,7,6.5])rotate([-90,0,0])cylinder(h=1,d1=13,d2=13);
        translate([8,7,0])cube([25,1,8]);
      }
      union(){
        translate([0,0,-0.05])cylinder(h=1.1,d1=6.6,d2=6.6);
        translate([12,6.95,6])rotate([-90,0,0])cylinder(1.1,d=3.8);
        translate([32,6.95,6.5])rotate([-90,0,0])cylinder(1.1,d=3.8);
        translate([30.2,6.95,6.5-8])cube([3.6,1.1,8]);
      }
    }
  }
}

//  1072 - plate 5x5 holes
//  $fn=30;M1072();
module M1072(color="blue"){
  th=.9;
  color(color)difference(){
    T1_plate(5,5,th);
    for(i=[0:10:50],j=[0:10:50])translate([i,j,0])T1_hole(th=.9);
  }
}

//  1073 - plate 7x5 holes  
//  $fn=30;M1073();
module M1073(color="green"){
  th=1.1;
  color(color)difference(){
    T1_plate(7,5,th);
    for(i=[0:10:50],j=[10:10:50])translate([i,j,0])T1_hole(th=th);
    for(i=[0:10:50],j=[0:60:70])translate([i,j,0])T1_o_hole(th=th);
  }
}

//  1074 - plate 5x10 holes
//  $fn=30;M1074();
module M1074(color="blue"){
  th=1.1;
  color(color)difference(){
    T1_plate(10,5,th);
    for(i=[0:10:10],j=[10:10:80])translate([i,j,0])T1_hole(th=th);
    for(i=[30:10:40],j=[10:10:80])translate([i,j,0])T1_hole(th=th);
    for(i=[0:10:50],j=[0:90:90])translate([i,j,0])T1_o_hole(th=th);
  }
}

//  1074A - plate 5x10 holes
//  $fn=30;M1074A();
module M1074A(color="blue"){
  th=1.1;
  color(color)difference(){
    T1_plate(10,5,th);
    for(i=[0:10:50],j=[10:10:80])translate([i,j,0])T1_hole(th=th);
    for(i=[0:10:50],j=[0:90:90])translate([i,j,0])T1_o_hole(th=th);
  }
}

//  1075 - plate 7x10 holes
//  $fn=30;M1075();
module M1075(color="green"){
  th=1.1;
  color(color)difference(){
    T1_plate(10,7,th);
    for(i=[10:10:50],j=[0:10:100])translate([i,j,0])T1_hole(th=th);
    for(i=[0:60:60],j=[0:10:100])translate([i,j,0])rotate([0,0,90])T1_o_hole(th=th);
  }
}

//  1076 - plate 2x3 holes 
//  $fn=30;M1076();
module M1076(){
  th=.5;
  color("silver")difference(){
    T1_plate(3,2,th);
    for(i=[0:10:10],j=[0:10:20])translate([i,j,0])T1_hole(th=.9);
  }
}

//  1077 - plate other
//  deska jiný tvar 
//  $fn=30;M1077("red");
module M1077(color="blue"){
  th=1;
  color(color)difference(){
    translate([-5.15,-5.15,0])hull(){
      translate([1.5,1.5,0])cylinder(h=th,d=3.3);
      translate([80.3-1.5,1.5,0])cylinder(h=th,d=3.3);
      translate([80.3-.5,15.3,0])cylinder(h=th,d=1);
      translate([46.8-.5,60.3-.5,0])cylinder(h=th,d=1);
      translate([1.5,60.3-1.5,0])cylinder(h=th,d=3.3);
      
    }
    union(){
      for(i=[0:10:70])translate([i,0,0])T1_hole(th=th);
      for(i=[0:3])translate([0,i*10+10,0])T1_hole(th=th);
      for(i=[0:4])translate([i*10,50,0])T1_hole(th=th);
      translate([40,50,0])rotate([0,0,-53])for(i=[0:5])translate([i*10,0,0])T1_hole(th=th);
 
    }
  }
}

//  1078 - other plate 20 x 50 mm
//  $fn=30;M1078();
module M1078(color="yellow"){
  th=1.1;
  color(color)difference(){
    hull(){
      translate([-4,-3,0])cylinder(h=th,d=3);
      translate([41,-3,0])cylinder(h=th,d=3);
      translate([42,2,0])cylinder(h=th,d=1);
      translate([4,25,0])cylinder(h=th,d=1);
      translate([-4,24,0])cylinder(h=th,d=3);
    }
    for(i=[0:3])translate([i*10,0,0])T1_hole(th=th);
    for(i=[0:2])translate([0,i*10+10,0])T1_hole(th=th);
    translate([10,15,0])rotate([0,0,-30])for(i=[0:3])translate([i*10,0,0])T1_hole(th=th);
   }
}

//  1080 - screwdriver
//  $fn=30;M1080();
module M1080(){
  color("blue"){
    difference(){
      union(){
        cylinder(h=1,d=20);
        translate([-2.5,0,0])cube([5,50,1]);
        translate([-5,0,0])cube([10,31,1]);
        translate([-6,0,0])cube([12,21,1]);
      }
      translate([0,0,-.1]){
        cylinder(h=1.2,d=11);
        translate([-9,21,0])cylinder(h=1.2,d=11);
        translate([9,21,0])cylinder(h=1.2,d=11);
        translate([-7.9,33,0])cylinder(h=1.2,d=11);
        translate([7.9,33,0])cylinder(h=1.2,d=11);
      }
    }
  }
}

//  1085 - spanner
//  $fn=30;M1085();
module M1085(){
  color("silver")difference(){
    union(){
      cylinder(h=1,d=15);
      translate([67,0,0])cylinder(h=1,d=15);
      translate([5,-4,0])cube([60,8,1]);
    }
    translate([0,0,-.1]){
      translate([-5,0,0])cylinder(h=1.2,d=7,$fn=6);
      translate([69.5,4.5,0])cylinder(h=1.2,d=7,$fn=6);
    }
  }
}

//  1086 - steering wheel
//  $fn=30;M1086();
module M1086(){
  color("Brown"){
    translate([0,0,4])rotate_extrude(convexity=5)translate([15.5,0,0])circle(1);
    difference(){ //central
      translate([0,0,-5.5])cylinder(h=9,d1=6.5,d2=6.5);
      translate([0,0,-5.55])cylinder(6.5,d=3.8);
    }
    translate([0,0,-3])for(i=[0:120:359])rotate([0,0,i])translate([0,0,5])rotate([82,0,0])cylinder(h=15,d=1.2);
  }
}

//  1095 - rubber shaft stop
//  $fn=30;M1095();
module M1095(){
  color("Brown"){
    difference(){
      cylinder(h=3.3,d1=9.2,d2=8);
      translate([0,0,-0.1])cylinder(3.5,d=3.8);
    }
  }
}

//  1096 - anchor hook
//  $fn=30;M1096();
module M1096(){ 
  color("blue")difference(){
    union(){
      cylinder(1,d=11.2);
      translate([-7.3/2,0,0])cube([7.3,20,1]);
      translate([0,20.6,0])scale([1,16/25,1])cylinder(1,d=25);
    }
    translate([0,0,-.05]){
      cylinder(1.1,d=3.8);
      translate([-7.3/2-2.4,19.2,0])cylinder(1.1,d=4.8);
      translate([7.3/2+2.4,19.2,0])cylinder(1.1,d=4.8);
      translate([-4.8-7.3/2,10,0])cube([4.8,9.5,1.1]);
      translate([7.3/2,10,0])cube([4.8,9.5,1.1]);
    }
  }
}

//  1097 - hook
//  fn=30;M1097();
module M1097(){
  color("silver")difference(){
    hull(){
    cylinder(1,d=10);
    translate([1,10,0])cylinder(1,d=11);}
    translate([0,0,-.05]){
      cylinder(1.1,d=3.8);
      translate([-8,1.7,0])rotate([0,0,-45])cube([2.6,12,1.1]);
      translate([1,10,0])cylinder(1.1,d=4.2);
    }
  }
}

//  1098 - flat steel
//  $fn=30;M1098();
module M1098(){
  color("Silver"){
    difference(){
      cylinder(h=0.2,d1=10,d2=10);
      translate([0,0,-0.05])cylinder(0.3,d=3.8);
    }
  }
}

//  1101 - bear pieces flat
//  $fn=30;M1101();
module M1101(color="red"){
  th=1;
  f=[[-5,0,0],[5,0,0],[0,20,0]];
  e=[[0,0,0],[0,10,0],[0,15,0],[0,20,0],[-5,0,0],[5,0,0]];
  color(color)difference(){
    union(){
      for(i=f)translate(i)cylinder(h=th,d=10);
      translate([-5,-5,0])cube([10,10,th]);
      translate([-5,5,0])cube([10,15,th]);
    }
    for(i=e)translate(i)T1_hole(th=th);
  }
}

//  1102 - bear pieces bent
//  $fn=30;M1102();
module M1102(color="red"){
  th=1;
  e=[[0,0,0],[0,5,0],[0,10,0]];
  e1=[[-5,0,0],[0,0,0],[5,0,0]];
  color(color)difference(){
    union(){
      translate([0,10.2,0])cylinder(h=th,d=10);
      translate([-5,-4.5,0])cube([10,14.5,th]);
      translate([-5.05,-5.5,6.8])rotate([-90,0,0])cylinder(h=th,d=10);
      translate([5.05,-5.5,6.8])rotate([-90,0,0])cylinder(h=th,d=10);
        translate([-5,-5.5,1])cube([10,th,10.8]);
        translate([-5,-4.5,1])rotate([-90,0,-90])rotate_extrude(angle=90,convexity=5)square([th,10]);
      }
    union(){
      for(i=e)translate(i)T1_hole(th=th);
      for(i=e1)translate(i)translate([0,-5.5,6.8])rotate([-90,0,0])T1_hole(th=th);
    }
  }
}

//  1122 - plate bent71x21.5x11.3
//  $fn=30;M1122();
module M1122(color="blue"){
  th=.85;
  x=71;
  y=21.5;
  hx=7;
  hy=0;
  color(color)difference(){
    union(){
      translate([-(x%10)/2-5,0,0]){
        T1_u1stp(y=y,hole=0,th=th,left=false,oval=true);
        translate([x,0,0])T1_u1stp(y=y,hole=0,th=th,left=true,oval=true);
        translate([0,-(y%10)/2-5,0])cube([x,y,th]);
      }
    }
    for(i=[0:10:(hx-1)*10])translate([i,0,0])T1_hole(th=th);
    for(i=[0:10:(hx-1)*10])translate([i,11,0])T1_o_hole(th=th);
    translate([-(x%10)/2-5.85,11,7])rotate([0,90,0])T1_o_hole(th=th);
    translate([-(x%10)/2-5+x,11,7])rotate([0,90,0])T1_o_hole(th=th);
    translate([-(x%10)/2-5.85,0,7])rotate([0,90,0])T1_hole(th=th);
    translate([-(x%10)/2-5+x,0,7])rotate([0,90,0])T1_hole(th=th);
  }
}

//  1125 - Z plate 50.5x21.5x12.3
//  $fn=30;M1125();
module M1125(color="yellow"){
  th=.85;
  color(color)difference(){
    union(){
      translate([6,0,th])rotate([0,-90,0])T1_u1stp(y=50,hole=5,th=th,left=false,oval=true,rov=true);
      translate([5.1,0,11])rotate([0,90,0])T1_u1stp(y=50,hole=5,th=th,left=false,oval=true,rov=true);
    translate([11.3-6.15,-5,th])cube([th,50,10.5]);
    }
    translate([11.3-6.15,0,5.5]){
      rotate([0,90,0])T1_o_hole(th=th);
      translate([0,40,0])rotate([0,90,0])T1_o_hole(th=th);
    }
  }
}

//  1127 - U plate 32x30.5x11.3
//  $fn=30;M1127();
module M1127(color="blue"){
  th=.85;
  x=30;
  y=30;
  hx=3;
  hy=0;
  color(color)difference(){
    union(){
      translate([-(x%10)/2-5,0,0]){
        T1_u1stp(y=y,hole=0,th=th,left=false,oval=true);
        translate([x,0,0])T1_u1stp(y=y,hole=0,th=th,left=true,oval=true);
        translate([0,-(y%10)/2-5,0])cube([x,y,th]);
      }
    }
    for(i=[0:10:(hx-1)*10]){
      translate([i,0,0])rotate([0,0,90])T1_o_hole(th=th);
      translate([i,20,0])rotate([0,0,90])T1_o_hole(th=th);
    }
    for(i=[0:10:20]){
      translate([-(x%10)/2-5.85,i,7])rotate([90,0,90])T1_o_hole(th=th);
      translate([-(x%10)/2-5+x,i,7])rotate([90,0,90])T1_o_hole(th=th);
    }
  }
}

//  1128 - U plate 51x30.3x11.3
//  $fn=30;M1128();
module M1128(color="blue"){
  th=.85;
  x=50;
  y=30;
  hx=5;
  hy=0;
  color(color)difference(){
    union(){
      translate([-(x%10)/2-5,0,0]){
        T1_u1stp(y=y,hole=0,th=th,left=false,oval=true);
        translate([x,0,0])T1_u1stp(y=y,hole=0,th=th,left=true,oval=true);
        translate([0,-(y%10)/2-5,0])cube([x,y,th]);
      }
    }
    for(i=[0:10:(hx-1)*10]){
      translate([i,0,0])rotate([0,0,90])T1_o_hole(th=th);
      translate([i,20,0])rotate([0,0,90])T1_o_hole(th=th);
    }
    for(i=[0:10:20]){
      translate([-(x%10)/2-5.85,i,7])rotate([90,0,90])T1_o_hole(th=th);
      translate([-(x%10)/2-5+x,i,7])rotate([90,0,90])T1_o_hole(th=th);
    }
  }
}

//  1130 - bear piece big flat
//  $fn=30;M1130();
module M1130(){
  th=1;
  x=10;
  rotate([0,0,90])color("silver")difference(){
      union(){
        translate([0,-20,0])T1_strip(x=x,hole=5,th=th);
        translate([20,0,0])cylinder(h=th,d=x);
        translate([x/2,-x/2-.05,0])cube([15.05,x,th]);
      }
      for(i=[10:5:20])translate([i,0,0])T1_hole(th=th);
  }
}

//  1150 - U plate 70.5x12.7x11.3
//  $fn=30;M1150();
module M1150(color="blue"){
  th=.85;
  x=12.7;
  y=70;
  hx=0;
  hy=0;
  color(color)difference(){
    union(){
      translate([-(x%10)/2-5,0,0]){
        T1_u1stp(y=y,hole=7,th=th,left=false,oval=true,rov=true);
        translate([x,0,0])T1_u1stp(y=y,hole=7,th=th,left=true,oval=true,rov=true);
        translate([0,-(y%10)/2-5,0])cube([x,y,th]);
      }
    }
    union(){
      T1_o_hole(th=th);
      translate([0,60,0])T1_o_hole(th=th);
    }
  }
}

//  1201 - V strip 1-1 holes electro
//  $fn=30;M1201();
module M1201(){
  th=.85;
  color("silver")difference(){
    union(){
      hull(){
        cylinder(h=th,d=10);
        translate([-5,5.075,th/2])rotate([0,90,0])cylinder(h=10,d=th);
      }
      translate([0,5.5,10.9-5])hull(){
        rotate([90,0,0])cylinder(h=th,d=10);
        translate([-5,-.85,-5.5])cube([10,th,1]);
      }
    }
    union(){
      T1_hole(th=th);
      translate([0,5.5,5.3])rotate([90,0,0])T1_hole(4.5,th);
    }
  }
}

//  1202 - strip electro 2 holes
//  $fn=30;M1202();
module M1202(){
  th=1;
  color("silver")difference(){
    T1_strip(x=10,y=20,hole=1,th=th);
    translate([0,10,0])T1_hole(4.5,th);
  }
}

//  1203 - strip electro 3 holes
//  $fn=30;M1203();
module M1203(){
  th=1;
  color("silver")difference(){
    T1_strip(x=10,y=30,hole=2,th=th);
    translate([0,20,0])T1_hole(4.5,th);
  }
}

//  1204 - strip electro 3 holes insulation
//  $fn=30;M1204();
module M1204(){
  th=1;
  color("brown")difference(){
    T1_strip(x=10,y=30,hole=2,th=th);
    translate([0,20,0])T1_hole(4.5,th);
  }
}

//  1205 - strip electro 5 holes
//  $fn=30;M1205();
module M1205(color="red"){
  th=1;
  color(color)difference(){
    T1_strip(x=10,y=50,hole=4,th=th);
    translate([0,40,0])T1_hole(4.5,th);
  }
}

//  1206 - strip electro 6 holes
//  $fn=30;M1206();
module M1206(color="red"){
  th=1;
  color(color)difference(){
    T1_strip(x=10,y=60,hole=6,th=th);
    translate([0,50,0])T1_hole(4.5,th);
  }
}

//  1207 - strip spring 70 mm electro
//  $fn=30;M1207();
module M1207(){
  th=1;
  e=[[0,0,0],[0,10,0],[0,30,0],[0,40,0]];
  color("darkblue")difference(){
    T1_strip(x=10,y=70,hole=0,th=th);
    union(){
      for(i=e)translate(i)T1_hole(th=th);
      translate([0,60,0])T1_hole(4.5,th);
    }
  }
}

//  1210 - strip electro 10 holes
//  $fn=30;M1210();
module M1210(color="red"){
  th=1;
  color(color)difference(){
    T1_strip(x=10,y=100,hole=9,th=th);
    translate([0,90,0])T1_hole(4.5,th);
  }
}

//  1211 - strip electro 10 holes brass
//  $fn=30;M1211();
module M1211(){
  th=1;
  color(T0_brass)difference(){
    T1_strip(x=10,y=100,hole=9,th=th);
    translate([0,90,0])T1_hole(4.5,th);
  }

}

//  1225 - strip 23 holes
//  $fn=30;M1225();
module M1225(color="red"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=23,th=1+ca);
}

//  1236 - U plate 50x100x10 electro
//  $fn=30;M1236();
module M1236(color="red"){
  e=[[20,0,0],
    [10,10,0],[30,10,0],
    [0,30,0],[40,30,0],
    [10,40,0],[20,40,0],[30,40,0],
    [20,50,0],
    [0,70,0],[10,70,0],[30,70,0],[40,70,0],
    [20,90,0]
  ];
  th=.85;
  x=49.2;
  y=100;
  hx=0;
  hy=0;
  color(color)difference(){
    union(){
      translate([-(x%10)/2,0,0]){
        T1_u1stp(y=y,hole=0,th=th,left=false,oval=true);
        translate([x,0,0])T1_u1stp(y=y,hole=0,th=th,left=true,oval=true);
        translate([0,-(y%10)/2-5,0])cube([x,y,th]);
      }
    }
    union(){
      translate([20,70,.5])cube([13,13,2],center=true);
      for(i=e)translate(i)T1_hole(4.5,th);
      for(i=[0:10:40],j=[0:10:90])translate([i,j,0])T1_hole(th=th);
      for(i=[0:10:90])translate([-(x%10)/2-th,i,6.5]){
        rotate([90,0,90])T1_hole(4.5,th);
        translate([x+th,0,0])rotate([90,0,90])T1_hole(4.5,th);
      }
    }
  }
}

//  1268 - ferrite magnet
//  $fn=30;M1268();
module M1268(){
  color("Gray")cylinder(h=6,d1=16,d2=16);
}

//  1289 - shaft brass 70 mm
//  $fn=30;M1289();
module M1289(){
  color(T0_brass)T0_shaft(60);
}

//  1295 - papper flat
//  $fn=30;translate([0,0,1])M1295();M1296();
module M1295(){
  th=.75;
  color("BurlyWood"){
    difference(){
      cylinder(h=th,d=9);
      T1_hole(5.1,th=th);
    }
  }
}

//  1296 - papper flat rimmed
//  $fn=30;M1296();
module M1296(){
  th=.6;
  color("BurlyWood"){
    difference(){
      union(){
        cylinder(h=th,d=8.5);
        cylinder(h=2.4,d=5);
      }
      translate([0,0,0])T1_hole(3.5,2.4);
    }
  }
}

//  1298 - rubber flat
//  $fn=30;M1298();
module M1298(){
  color("Brown")cylinder(h=3.3,d1=9.2,d2=8);
}

//  1319 - shaft 50 mm ferromagnetic
//  $fn=30;M1319();
module M1319(){
  color("darkblue")T0_shaft(50);
}

//  1391 - box for 3 x battery
//  $fn=30;M1391();
module M1391(){
  color("DarkSlateGray"){
    hull(){
      cylinder(h=92,d1=30,d2=30);
      translate([0,40,0])cylinder(h=92,d1=30,d2=30);
    }
    polyhedron(points=[[0,55,0],[23,50,0],[23,24,0],[15,22,0],[0,55,92],[23,50,92],[23,24,92],[15,22,92]],faces=[[0,3,2,1],[4,5,6,7],[7,6,2,3],[6,5,1,2],[5,4,0,1],[4,7,3,0]]);
    translate([23,40,33])rotate([0,90,0])cylinder(h=2,d1=14,d2=12);
    translate([18,43,92])cylinder(h=3,d1=10,d2=10);
    translate([16,50,66])rotate([0,0,-10])cube([5,3,20]);
  }
    translate([16,20,66])rotate([0,0,13])color("LightSlateGray")cube([5,3,20]);
    //wire
    translate([18,43,92]){
      translate([0,-0.75,0])color("black")cylinder(h=10,d=1.5);
      translate([0,0.75,0])color("brown")cylinder(h=10,d=1.5);
    }
}

//  1400 - motor: speed M1400(T1_fast | T1_slow);
//  $fn=30;M1400(false); translate([15.2,25,5])rotate([0,-90,180])M3076(); translate([-15.4,15,5])rotate([0,-90,0])M3076();
module M1400(T0_slow=true){
  translate([0,(T0_slow)?-10:-15,45])T0_shaft(40);
  color("Red"){
    translate([-9.5,0,0])cube([19,15,48]);
    difference(){
      translate([0,0,41])rotate([-90,0,0])cylinder(h=15,r=12);
      union(){
        translate([-13.5,-.1,33])cube([4,15.2,16]);
        translate([9.5,-.1,33])cube([4,15.2,16]);
      }
    }
    difference(){
      translate([-15,9.2,0])cube([30,36.3,30]);
      translate([0,37,42.5])rotate([90,0,0])cylinder(h=22,d=28);
    }
      translate([-15,45.3,4.2])difference(){
        union(){
          cube([30,4.3,22.7]);
        }
        union(){
          translate([15,2,11.5])rotate([-90,0,0])cylinder(h=3,d=6);
          translate([8.5,2,15.5])rotate([-90,0,0])cylinder(h=3,d=4);
          translate([22,2,7.5])rotate([-90,0,0])cylinder(h=3,d=4);
        }
      }
      for (i=[0:2],j=[0:1])translate([14.95,i*10+15,5+j*20])rotate([0,90,0])cylinder(h=1.15,d=3.6);
      for (i=[0:2],j=[0:1])translate([-16.2,i*10+15,5+j*20])rotate([0,90,0])cylinder(h=1.15,d=3.6);
      for (i=[0:1],j=[0:1])translate([-10+j*20,i*10+25,-1.15]) cylinder(h=1.15,d=3.6);
      for (i=[0:1],j=[0:1])translate([-10+j*20,i*10+25,29.9])cylinder(h=1.15,d=3.6);
  }
    //wire
    translate([-6.5,47.3,19.7])rotate([-90,0,0])color("black")cylinder(h=6,d=1.5);
    translate([7,47.3,11.7])rotate([-90,0,0])color("brown")cylinder(h=6,d=1.5);
}

//  2002 - strip thin 2 holes
//  $fn=30;M2002();
module M2002(){
  th=.25;
  color("silver")difference(){
    T1_strip(x=10,y=20,hole=1,th=th);
    translate([0,10,0])T1_o_hole(th=th);
  }
} 

//  2003 - strip thin 3 holes
//  $fn=30;M2003();
module M2003(){
  color("silver")T1_strip(x=10,y=0,hole=3,th=.25);
}

//  2004 - strip thin 3 holes
//  $fn=30;M2004();
module M2004(){
  color("silver")difference(){
    T1_strip(x=10,y=0,hole=4,th=1);
    translate([5,20,0])T1_hole(3.8,2);
  }
}

//  2006 - strip 60 mm
//  $fn=30;M2006();
module M2006(color="red"){
  th=1;
  color(color)difference(){
    T1_strip(x=10,y=60,hole=0,th=th);
    union(){
      T1_hole(th=th);
      hull(){
        translate([0,10,0])T1_hole(th=th);
        translate([0,40,0])T1_hole(th=th);
      }
      translate([0,50,0])T1_hole(th=th);
    }
  }
}

//  2016 - half circle 70 mm, plastic
//  $fn=30;M2016();
module M2016(){
  th=.5;
  color("yellow")difference(){
    cylinder(h=th,d=70.2);
    union(){
      translate([-36,-40,-.05])cube([72,35,th+.1]);
      for(i=[-30:10:30])translate([i,0,0])rotate([0,0,90])T1_o_hole(th=th);
      n=9;
      alpha=160;
      d=alpha/n;
      for(i=[0:n-1])rotate([0,0,i*d-4*d])translate([0,30,0])rotate([0,0,90])T1_o_hole(th);
    }
  }
}

//  2017 - plate 3x5 holes, plastic 
//  $fn=30;M2017();
module M2017(){
  color("yellow")T1_3str(5,.5);
}

//  2018 - plate 3x7 holes, plastic
//  $fn=30;M2018();
module M2018(){
  color("yellow")T1_3str(7,.5);
}

//  2019 - plate 3x10 holes, plastic
//  $fn=30;M2019();
module M2019(){
  color("yellow")T1_3str(10,.5);
}

//  2020 - plate 2x5 holes, plastic 
//  $fn=30;M2020();
module M2020(){
  color("yellow")T1_2str(5,.5);
}

//  2022 - plate 2x9 holes, plastic
//  $fn=30;M2022();
module M2022(){
  color("yellow")T1_2str(9,.5);
}

//  2023 - plate 260x20
//  $fn=30;M2023();
module M2023(color="red"){
  color(color)T1_2str(25);
}

//  2024 - U plate 71x31.3x11.3
//  $fn=30;M2024();
module M2024(color="blue"){
  th=.85;
  x=29.2;
  y=70.5;
  hx=0;
  hy=0;
  color(color)difference(){
    union(){
      translate([-(x%10)/2,0,0]){
        T1_u1stp(y=y,hole=0,th=th,left=false,oval=true);
        translate([x,0,0])T1_u1stp(y=y,hole=0,th=th,left=true,oval=true);
        translate([0,-(y%10)/2-5,0])cube([x,y,th]);
      }
    }
    union(){
      for(i=[0:10:20],j=[10:10:50])translate([i,j,0])T1_hole(th=th);
      for(i=[0:10:20]){
        translate([i,0,0])T1_o_hole(th=th);
        translate([i,60,0])T1_o_hole(th=th);
      }
      translate([-(x%10)/2-th,0,7]){
        rotate([0,90,0])T1_o_hole(th=th);
        translate([0,60,0])rotate([0,90,0])T1_o_hole(th=th);
        for(i=[10:10:50])translate([0,i,0])rotate([0,90,0])T1_hole(th=th);
      }
      translate([-(x%10)/2+x,0,7]){
        rotate([0,90,0])T1_o_hole(th=th);
        translate([0,60,0])rotate([0,90,0])T1_o_hole(th=th);
        for(i=[10:10:50])translate([0,i,0])rotate([0,90,0])T1_hole(th=th);
      }
    }
  }
}

//  2025 - strip 23 holes
//  $fn=30;M2025();
module M2025(color="red"){
  ca=(color=="silver")?0:.2;
  color(color)T1_strip(x=10+ca,y=0,hole=23,th=1+ca);
}

//  2026 - rounded strip 7 holes
//  $fn=60;M2026();
module M2026(color="red"){
  angl=45; l=70;
  ca=sca(color);
  th=1+ca;
  translate([0,70,0])rotate([0,0,-angl/2-90])
  color(color)difference(){
    union(){
      translate([l,0,0])cylinder(1+ca,d=10+ca);
      rotate_extrude(angle=6,convexity=2)translate([l-5-ca/2,0,0])square([10+ca,1+ca]);
      translate([0,0,1])rotate([0,0,5])rotate_extrude(angle=36,convexity=2)translate([l-5-ca/2,0,0])square([10+ca,1+ca]);
      translate([0,0,0])rotate([0,0,45-5])rotate_extrude(angle=6,convexity=2)translate([l-5-ca/2,0,0])square([10+ca,1+ca]);
      rotate([0,0,45])translate([l,0,0])cylinder(1+ca,d=10+ca);
    }
    union(){
      translate([l,0,0])T1_hole(th=th);
      translate([0,0,1])rotate([0,0,angl/2]){
        rotate([0,0,-14.5])translate([l,0,0])T1_hole(th=th);
        rotate([0,0,-6])translate([l,0,0])T1_hole(th=th);
        rotate([0,0,0])translate([l,0,0])T1_hole(th=th);
        rotate([0,0,6])translate([l,0,0])T1_hole(th=th);
        rotate([0,0,14.5])translate([l,0,0])T1_hole(th=th);
      }
      rotate([0,0,45])translate([l,0,0])T1_hole(th=th);
    }
  }
}

//  2027 - V strip 9 holes
//  $fn=30;M2027();
module M2027(color="red"){
  color(color)T1_Vstrip(9);
}

//  2028 - V strip 22 holes
//  $fn=30;M2028();
module M2028(color="red"){
  color(color)T1_Vstrip(22);
}

//  2031 - U strip 2-5-2 holes
//  $fn=30;M2031();
module M2031(){
  color("silver")T1_u_strip(x=10,y=52.3,z=21.7,th=.8,yh=5,zh=2,zd=7);
}

//  2035 - U plate angle 
//  $fn=30;M2035();
module M2035(color="blue"){
  th=0.92;
  angle=7;
  x0=30;
  y0=80;
  dx=sin(angle)*y0;
  dy=cos(angle)*y0;
  dd= 5+(y0%10)/2;
  dt=cos(angle)*th;
  y1=cos(angle)*dd;
  y2=dy-y1;
  x1=x0/2-dt;
  x2=x0/2+dx-dt;
  po=[
    [-x1,-y1,0],
    [-x2,y2,0],
    [x2,y2,0],
    [x1,-y1,0],
    [-x1,-y1,th],
    [-x2,y2,th],
    [x2,y2,th],
    [x1,-y1,th]
  ];
  fa=[
    [0,3,2,1],
    [7,4,5,6],
    [0,4,7,3],
    [3,7,6,2],
    [6,5,1,2],
    [4,0,1,5]
  ];
  color(color)difference(){
    union(){
      polyhedron(po,fa,5);
      translate([x0/2-th,0,0])rotate([0,0,-angle])T1_u1stp(y=y0,hole=8,th=th,left=true,oval=true);
      translate([-x0/2+th,0,0])rotate([0,0,angle])T1_u1stp(y=y0,hole=8,th=th,left=false,oval=true);
    }
    union(){
        for(i=[-10:10:10],j=[0:10:60])translate([i,j,0])T1_hole(th=th);
        for(i=[-20:10:20])translate([i,70,0])T1_hole(th=th);
    }
 }
}

//  2037 - angle strip 5-5 holes
//  $fn=30;M2037();
module M2037(color="red"){
  th=1;
  x=10.1;
  color(color)difference(){
    union(){
      translate([20/sqrt(2),20/sqrt(2),0])T1_strip45(th);
      translate([40,0,0])cylinder(h=th,d=x);
      translate([0,40,0])cylinder(h=th,d=x);
      translate([x/2,-x/2,0])cube([40-x/2,x,th]);
      translate([-x/2,x/2,0])cube([x,40-x/2,th]);
      translate([-x/2,-x/2,0])hull(){
        translate([2,2,0])cylinder(h=th,d=4);
        translate([x-1,0,0])cube([1.1,x,th]);
        translate([0,x-1,0])cube([x,1.1,th]);
      }
    }
    union(){
      for(i=[0:10:40])translate([i,0,0])T1_hole(th=th);
      for(i=[10:10:40])translate([0,i,0])T1_hole(th=th);
    }
  }
}

//  2038 - joint piece small plastic
//  $fn=30;M2038();
module M2038(){
  th=.5;
  color("yellow")difference(){
    translate([0,0,0])hull(){
      translate([-5+1.65,-5+1.65,0])cylinder(h=th,d=3.3);
      translate([30.3-5-1.65,-5+1.65,0])cylinder(h=th,d=3.3);
      translate([30.3-5-.5,12.2-.5,0])cylinder(h=th,d=1);
      translate([10,20,0])cylinder(h=th,d=10.3);
      translate([-5+.5,12.2-.5,0])cylinder(h=th,d=1);
    }
    union(){
      for(i=[0:10:20])translate([i,0,0])T1_hole(th=th);
      for(i=[10:10:20])translate([10,i,0])T1_hole(th=th);
      hull(){
        translate([0,10,0])T1_hole(th=th);
        translate([2.85,13,0])T1_hole(th=th);
      }
      hull(){
        translate([20,10,0])T1_hole(th=th);
        translate([20-2.85,13,0])T1_hole(th=th);
      }
    }
  }
}

//  2039 - joint plate belt
//  $fn=30;M2039();
module M2039(color="green"){
  th=1;
  module strip(){
    difference(){
      translate([-50.3/2,0,0])hull(){
        translate([0,-5.3,0])cube([50.3,5,th]);
        translate([1.5,3.5,0])cylinder(h=th,d=3);
        translate([50.3-1.5,3.5,0])cylinder(h=th,d=3);
      }
      for(i=[-20:10:20])translate([i,0,0])rotate([0,0,90])T1_o_hole(th=th);
    }
  }
  color(color){
    difference(){
      hull(){
        translate([25.15-.5,1.5+.5,0])cylinder(th,d=1);
        translate([0,25,0])cylinder(th,d=21);
        translate([-25.15+.5,1.5+.5,0])cylinder(th,d=1);
        translate([-25,-4.5,0])cube([50,7,th]);
      }
      union(){
        for(i=[-2:2])translate([i*10,0,0])T1_hole(th=th);
        translate([-15,0,0])T1_hole(th=th);
        translate([5,0,0])T1_hole(th=th);
        for(i=[-1:1])translate([i*10,10,0])T1_hole(th=th);
        translate([-15,10,0])T1_hole(th=th);
        translate([5,10,0])T1_hole(th=th);
        translate([15,10,0])T1_hole(th=th);
        for(i=[-1:1])translate([i*10,20,0])T1_hole(th=th);
        translate([0,15,0])T1_hole(th=th);
        translate([0,25,0])T1_hole(th=th);
        translate([0,30,0])T1_hole(th=th);
      }
    }
    translate([0,-5.7+th,6.4])rotate([90,0,0])strip();
    translate([50.3/2,-4.5,1.2])rotate([0,90,180])
    rotate_extrude(angle=90,convexity=5)translate([.2,0,0])square([th,50.3]);
  }
}

//  2041 wheel 30 mm no hub
//  $fn=30;M2041();
module M2041(color="yellow"){
  ca=sca(color);
  th=1+ca;
  d=30+ca;
  color(color)difference(){
    cylinder(h=th,d=d);
    union(){
      T1_hole(th=th);
      for(i=[0:45:359])rotate([0,0,i])translate([10,0,0])T1_hole(th=th);
    }
  }
}

//  2050 - shaft flat thick
//  $fn=30;M2050();
module M2050(){
  color("Silver"){
    difference(){
      cylinder(h=7.6,d=8);
      translate([0,0,-0.05])T1_hole(th=7.7);
    }
  }
}

//  M2058 - banister 10 holes
//  $fn=30;M2058();
module M2058(color="blue"){
  ca=sca(color);
  color(color)T0_BT(10,ca);
}

//  2060 - shaft 50 mm
//  $fn=30;M2060();
module M2060(){
  T0_shaft(50);
}

//  2061 - shaft 90 mm
//  $fn=30;M2061();
module M2061(){
  T0_shaft(90);
}

//  2062 - shaft 170 mm
//  $fn=30;M2062();
module M2062(){
  T0_shaft(170);
}

//  2070 - pawl small right
//  $fn=30;M2070();
module M2070(){
 mirror([1,0,0])M1070();
}

//  2071 - pawl right
//  $fn=30;M2071();
module M2071(){
  mirror([1,0,0])M1071();
}

//  2071 - plate 5x5 holed plastic
//  $fn=30;M2072();
module M2072(){
  th=.5;
  color("yellow")difference(){
    T1_plate(5,5,th);
    for(i=[0:10:50],j=[0:10:50])translate([i,j,0])T1_hole(th=.9);
  }
}

//  2073 - plate 5x7 holes plastic
//  $fn=30;M2073();
module M2073(){
  th=.5;
  color("yellow")difference(){
    T1_plate(7,5,th);
    for(i=[0:10:50],j=[10:10:50])translate([i,j,0])T1_hole(th=th);
    for(i=[0:10:50],j=[0:60:70])translate([i,j,0])T1_o_hole(th=th);
  }
}

//  2074 - plate 5x10 holes, plastic
//  $fn=30;M2074();
module M2074(){
  th=.5;
  color("yellow")difference(){
    T1_plate(10,5,th);
    for(i=[0:10:10],j=[10:10:80])translate([i,j,0])T1_hole(th=th);
    for(i=[30:10:40],j=[10:10:80])translate([i,j,0])T1_hole(th=th);
    for(i=[0:10:50],j=[0:90:90])translate([i,j,0])T1_o_hole(th=th);
  }
}

//  2075 - plate 7x10 holes, plastic
//  $fn=30;M2075();
module M2075(){
  th=.5;
  color("yellow")difference(){
    T1_plate(10,7,th);
    for(i=[10:10:50],j=[0:10:100])translate([i,j,0])T1_hole(th=th);
    for(i=[0:60:60],j=[0:10:100])translate([i,j,0])rotate([0,0,90])T1_o_hole(th=th);
  }
}

//  2076 - V strip 3 holes
//  $fn=30;M2076();
module M2076(){
  th=.75;
  color("yellow")difference(){
    union(){
      hull(){
        translate([2.5,-2.65,0])cylinder(h=th,d=5);
        translate([2.5,30.3-5.15-2.5,0])cylinder(h=th,d=5);
        translate([-5,-5.15,0])cube([5,30.3,th]);
      }
      hull(){
        translate([-5-th,-5.15+2.5,10.8-2.5])rotate([0,90,0])cylinder(h=th,d=5);
        translate([-5-th,-5.15+30.3-2.5,10.8-2.5])rotate([0,90,0])cylinder(h=th,d=5);
        translate([-5-th,-5.15,th])cube([th,30.3,5]);
      }
      translate([-5,-5.15,th])rotate([-90,90,0])rotate_extrude(angle=90,convexity=5)square([th,30.3]);
    }
    for(i=[0:10:20])translate([0,i,0]){
      T1_hole(th=th);
      translate([-5,0,5.7])rotate([0,-90,0])T1_hole(th=th);
    }
  }
}

//  2085 - spanner
//  $fn=30;M2085();
module M2085(){
  color("silver")difference(){
    union(){
      cylinder(h=1,d=15);
      translate([67,0,12])cylinder(h=1,d=15);
      translate([5,-4,0])cube([41,8,1]);
      translate([58,-4,12])cube([10,8,1]);
      translate([46,-4,0])rotate([0,-45,0])cube([17,8,1]);
    }
    translate([0,0,-.1]){
      translate([-5,0,0])cylinder(h=1.2,d=7,$fn=6);
      translate([69.5,4.5,12])cylinder(h=1.2,d=7,$fn=6);
    }
  }
}

//  2130 - engine drive piece
//  $fn=30;M2130();
module M2130(){
  th=1;
  x=12;
  //#translate([-21.2/2,-5,0])cube([21.2,30,16.2]);
  color("Silver"){
    difference(){
      union(){
        translate([-x/2,5,0])cube([x,15,th]);
        translate([-10.6+th,-x/2,0])cube([21.2-2*th,x,th]);
        translate([-10.6,-x/2,th])cube([th,x,11-th]);
        translate([10.6-th,-x/2,th])cube([th,x,11-th]);
        translate([0,20,0])cylinder(h=th,d=x);
        translate([10.6-th,0,11])rotate([0,90,0])cylinder(h=th,d=x);
        translate([-10.6,0,11])rotate([0,90,0])cylinder(h=th,d=x);
        translate([10.6-th,-x/2,th])rotate([-90,0,0])rotate_extrude(angle=90,convexity=5)square([th,x]);
        translate([-10.6+th,-x/2,th])rotate([-90,90,0])rotate_extrude(angle=90,convexity=5)square([th,x]);
      }
      union(){
        for(i=[0:10:20])translate([0,i,0])T1_hole(th=th);
        translate([0,15,0])T1_hole(th=th);
        translate([-21.2/2,0,11.8])rotate([0,90,0])T1_hole(th=th);
        translate([21.2/2-th,0,11.8])rotate([0,90,0])T1_hole(th=th);
      }
    }
  }
}

//  3031 - U strip 1-3-1
//  $fn=30;M3031();
module M3031(){
  color("silver")T1_u_strip(x=10.2,y=31.3,z=12.5,th=1,yh=3,zh=1,zd=7.16);
}

//  3035 - plate - other, angle
//  $fn=30;M3035();
module M3035(){
  module strip(th=1){
    difference(){
      union(){
      hull(){
        translate([-4.8,9.4,0])cube([1,1,th]);
        translate([80.85-5.8,9.4,0])cube([1,1,th]);
        translate([3-4.8,3,0])cylinder(h=th,d=6);
        translate([80.85-7.8,3,0])cylinder(h=th,d=6);
      }
      }
      for(i=[0:10:70])translate([i,5.4,0])T1_o_hole(th);
  }
  }
  th=0.92;
  po=[
    [-15,-4.8,0],
    [-24.5,80.25-4.8,0],
    [24.5,80.25-4.8,0],
    [15,-4.8,0],
    [-15,-4.8,th],
    [-24.5,80.25-4.8,th],
    [24.5,80.25-4.8,th],
    [15,-4.8,th]
  ];
  fa=[
    [0,3,2,1],
    [7,4,5,6],
    [0,4,7,3],
    [3,7,6,2],
    [6,5,1,2],
    [4,0,1,5]
  ];
  color("blue"){
  difference(){
    polyhedron(po,fa,5);
      union(){
        for(i=[-10:10:10],j=[0:10:60])translate([i,j,0])T1_hole(th=th);
        for(i=[-20:10:20])translate([i,70,0])T1_hole(th=th);
     }
  }
  rotate([0,0,7])translate([-50.4/2,1.8,th])rotate([180,0,90])strip(th);
  rotate([0,0,-7])translate([50.4/2,1.8,0])rotate([0,0,90])strip(th);
  }
}

//  3037 - angle strip 4-5 holes belt left
//  $fn=30;M3037();
module M3037(color="red"){
  th=1;
  x=10.1;
  s=sqrt(2);
  mr=[0,5-th,6];
  translate([0,-10,0])color(color)difference(){
    union(){
      translate([-x/2,5,th])rotate([-90,0,-90])rotate_extrude(angle=90,convexity=5)square([th,x]);
      translate([-x/2+30/s,5,th])rotate([-90,0,-90])rotate_extrude(angle=90,convexity=5)square([th,x*s]);
      translate([20/sqrt(2),20/sqrt(2),0])T1_strip45(th);
      translate([0,40,0])cylinder(h=th,d=x);
      translate([-x/2,x/2-.2,0])cube([x,40-x/2+.2,th]);
      translate(mr)rotate([-90,0,0]){
        translate([-x/2,-x/2,0])hull(){
          translate([2,2,0])cylinder(h=th,d=4);
          translate([x-1,0,0])cube([1.1,x,th]);
          translate([0,x-1,0])cube([x,1.1,th]);
        }
        translate([40,0,0])cylinder(h=th,d=x);
        translate([x/2,-x/2,0])cube([40-x/2,x,th]);
      }
    }
    union(){
      translate(mr)rotate([-90,0,0])for(i=[0:10:40])translate([i,0,0])T1_hole(th=th);
      for(i=[10:10:40])translate([0,i,0])T1_hole(th=th);
    }
  }
}

//  3038 - join plate
//  $fn=30;M3038();
module M3038(color="green"){
  th=1;
  color(color){
    difference(){
      hull(){
        translate([-25.15+1.5,-5.15+1.5,0])cylinder(th,d=3);
        translate([25.15-1.5,-5.15+1.5,0])cylinder(th,d=3);
        translate([25.15-.5,11.5+.5,0])cylinder(th,d=1);
        translate([0,35,0])cylinder(th,d=21);
        translate([-25.15+.5,11.5+.5,0])cylinder(th,d=1);
      }
      union(){
        for(i=[-2:2])translate([i*10,10,0])T1_hole(th=th);
        translate([-15,10,0])T1_hole(th=th);
        translate([5,10,0])T1_hole(th=th);
        for(i=[-1:1])translate([i*10,20,0])T1_hole(th=th);
        translate([-15,20,0])T1_hole(th=th);
        translate([5,20,0])T1_hole(th=th);
        translate([15,20,0])T1_hole(th=th);
        for(i=[-1:1])translate([i*10,30,0])T1_hole(th=th);
        translate([0,25,0])T1_hole(th=th);
        translate([0,35,0])T1_hole(th=th);
        translate([0,40,0])T1_hole(th=th);
        for(i=[-2:2])translate([i*10,0,0])rotate([0,0,90])T1_o_hole(th=th);
      }
    }
  }
}

//  3058 - banister 15 holes
//  $fn=30;M3058();
module M3058(color="blue"){
  ca=sca(color);
  color(color)T0_BT(15,ca);
}

//  3060 - shaft 40 mm
//  $fn=30;M3060();
module M3060(){
  T0_shaft(40);
}

//  3061 - shaft 110 mm
//  $fn=30;M3061();
module M3061(){
  T0_shaft(110);
}

//  3062 - shaft 110 mm
//  $fn=30;M3062();
module M3062(){
  T0_shaft(150);
}

//  3076 - V strip 2 holes
//  $fn=30;M3076();
module M3076(){
  th=.45;
  color("silver")difference(){
    union(){
      hull(){
        translate([-5+th,-5,0])cube([5,20,th]);
        translate([2.5,-2.5,0])cylinder(h=th,d=5);
        translate([2.5,12.5,0])cylinder(h=th,d=5);
      }
      hull(){
        translate([-5,-5,th])cube([th,20,5]);
        translate([-5,-5+2.5,9.77-2.5])rotate([0,90,0])cylinder(h=th,d=5);
        translate([-5,-5+20-2.5,9.77-2.5])rotate([0,90,0])cylinder(h=th,d=5);
      }
      translate([-5+th,-5,th])rotate([-90,90,0])rotate_extrude(angle=90,convexity=5)square([th,20]);
    }
    for(i=[0:10:10])translate([0,i,0]){
      T1_hole(th=th);
      translate([-5,0,5])rotate([90,0,90])T1_o_hole(th);
    }
  }
}

//  4031 - U strip 1-2-1 holes
//  $fn=30;M4031();
module M4031(){
  color("silver")T1_u_strip(x=10.2,y=21.3,z=11,th=1,yh=2,zh=1,zd=6.3);
}

//  4037 - angle strip 4-5 holes belt right
//  $fn=30;M4037();
module M4037(color="red"){
  mirror([1,0,0])M3037(color);
}

//  4058 - banister 25 holes
//  $fn=30;M4058();
module M4058(color="blue"){
  ca=sca(color);
  color(color)T0_BT(25,ca);
}

//  4075 - plate 9x7 holes, plastic 
//  $fn=30;M4075();
module M4075(){
    th=.5;
  color("lightgray",.5)difference(){
    T1_plate(9,7,th);
    for(i=[10:10:50],j=[0:10:90])translate([i,j,0])T1_hole(th=th);
    for(i=[0:60:60],j=[0:10:90])translate([i,j,0])rotate([0,0,90])T1_o_hole(th=th);
  }
}

//  4076 - plate 2x2 holes
//  $fn=30;M4076();
module M4076(color="silver"){
  th=.8;
  color(color)difference(){
    hull(){
      translate([-3,-3,0])cylinder(h=th,d=4);
      translate([-3,11.6,0])cylinder(h=th,d=4);
      translate([13,11.6,0])cylinder(h=th,d=4);
      translate([13,-3,0])cylinder(h=th,d=4);
    }
    T1_hole(th=th);
    translate([10,0,0])T1_hole(th=th);
    translate([0,8.6,0])T1_o_hole(th=th);
    translate([10,8.6,0])T1_o_hole(th=th);
  }
}

//  5017 - plate5x3 holes, transparent
//  $fn=30;M5017();
module M5017(){
  th=.5;
  color("lightgray",.5)difference(){
    T1_plate(3,5,th);
    for(i=[0:10:40],j=[0:20:20])translate([i,j,0])T1_hole(th=th);
    for(i=[[0,10,0],[40,10,0]])translate(i)T1_hole(th=th);
  }
}

//  5058 - banister 3 holes
//  $fn=30;M5058();
module M5058(color="blue"){
  ca=sca(color);
  color(color)T0_BT(3,ca);
}

//  5072 - plate 5x5 holes, transparent
//  $fn=30;M5072();
module M5072(){
  th=.5;
  holes=5;
  color("lightgray",.5)difference(){
    T1_plate(5,5,th);
    for(i=[0:10:50],j=[0:10:50])translate([i,j,0])T1_hole(th=th);
  }
}

//  5072A - plate 5x5 holes, transparent
//  $fn=30;M5072A();
module M5072A(){
  th=.5;
  holes=5;
  e=[[0,0,0],[20,0,0],[40,0,0],
  [0,20,0],[40,20,0],
  [0,40,0],[20,40,0],[40,40,0]];
  color("lightgray",.5)difference(){
    T1_plate(5,5,th);
    for(i=e)translate(i)T1_hole(th=th);
  }
}
