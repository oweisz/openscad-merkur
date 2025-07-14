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
 * Merkur module 10 mm, screw, nuts ME3.5
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
 */

  // constants
  T0_brass="#E1C16E"; //mosaz
  
  T1_slow=true;  //gear motor 1400
  T1_fast=false;  //gear motor 1400

 
 

//  == FUNCTION ===========================
//  return addings for colored pieces
//  vrátí přídavek na barvené části
//  silver -> 0, other color -> 0.12 mm
// ex:
//  color="red";ca=sca(color);echo(ca);
function sca(color)=(color=="silver")?0:.12;


// == HOLES =================================

// simple hole
module T1_hole(d=3.9,th=1){
  translate([0,0,-.05])cylinder(h=th+.1,d=d);
}

//oval hole
module T1_o_hole(th=1){
  T1Y1=4.4;
  T1Y2=5.5;
  T1X=3.9;

  T1T=T1X;
  T1H=(T1Y2-T1Y1)/2;
  T1R=(4*T1H^2+T1T^2)/(8*T1H);
  T1D=T1Y2/2-T1R;

  module segm(){
      difference(){
        translate([0,0,-.05])cylinder(h=th+.1,r=T1R);
        translate([-T1R-.05,-T1R-T1H,-.1])cube([T1R*2+.1,T1R*2,th+.2]);
      }    
  }
  translate([0,T1D,0])segm();
  rotate([0,0,180])translate([0,T1D,0])segm();
  translate([0,0,(th+.1)/2-.05])cube([T1X,T1Y1+.01,th+.1],center=true);
} 


//  addition for render trought holes
//  přídavek pro průchozí otvory
T0_dadd = .1; 

//  hole - otvor ------------------------------
//  T0_dcc(
//    th - len (délka)
//    dh - diameter (prumer)
//  );
//  T0_dadd - adding to len (global def), (přídavek)
// ex:
//  $fn=30;th=3;difference(){cylinder(th,d=5);T0_dcc(th,4);}
module T0_dcc(th=1, dh=3.8){
  translate([0,0,-(T0_dadd/2)])cylinder(h=th+T0_dadd,d=dh);
}

// == MERKUR PRIMITIVES ==========================
// základní díly

//  strip, pásek ---------------------------------
//  feed X (left hole, bottom: [0,0,0])
//  T0_strip(
//    x - width
//    y - lenght
//    hole - nuber of holes
//    th - thick
//  };
// ex:
//  $fn=30;T1_strip(x=10,y=60,yh=2,th=1);
module T1_strip(x=10, y=0, hole=5, th=1){
  ya=(y==0)?hole*10:y;
  echo(ya);
  assert(ya>=10,"y must be >10");
  difference(){
    hull(){
      cylinder(h=th,d=x);
      translate([0,ya-10,0])cylinder(h=th,d=x);
    }
    for(i=[0:10:(hole-1)*10])translate([0,i,0])T1_hole(th=th);
  }
}


//2xN strip
module T1_2str(holes=5,th=1.2){
  difference(){
    hull(){
      translate([-5.15+1.5,-5.15+1.5,0])cylinder(h=th,d=3);
      translate([-5.15+1.5,-5.15+holes*10-1.5+.3,0])cylinder(h=th,d=3);
      translate([16.2-1.5,-5.15+holes*10-1.5+.3,0])cylinder(h=th,d=3);
      translate([16.2-1.5,-5.15+1.5,0])cylinder(h=th,d=3);
    }
    union(){
      for(i=[0:10:(holes-1)*10])translate([0,i,0])T1_hole(th=th);
      for(i=[0:10:(holes-1)*10])translate([11,i,0])rotate([0,0,90])T1_o_hole(th=th);
    }
  }
}

//  U strip
//  x - x size
//  y - y size
//  z - z size
//  th - thick material
//  yh - y holes
//  zh - z holes
//  zd - first z hole (mm from 0)
//  $fn=30;T1_u_strip(x=14.5,y=53.4,z=40,th=.8,yh=5,zh=3,zd=7.3);
module T1_u_strip(x=10,y=50,z=20,th=1,yh=5,zh=1,zd=5){
  y1=-5-(y%10)/2;
  y2=-5-(y%10)/2+y-th;
  difference(){
    union(){
      translate([-5-(x%10)/2,-5-(y%10)/2+th,0])cube([x,y-2*th,th]);
      translate([-5-(x%10)/2,y1,th])cube([x,th,z-x/2-th]);
      translate([0,y1,z-x/2])rotate([-90,0,0])cylinder(h=th,d=x);
      translate([-5-(x%10)/2,y2,th])cube([x,th,z-x/2-th]);
      translate([0,y2,z-x/2])rotate([-90,0,0])cylinder(h=th,d=x);
      translate([x/2,y1+th,th])rotate([-90,90,90])rotate_extrude(angle=90,convexity=5)square([th,x]);
      translate([x/2,y2,th])rotate([-90,0,90])rotate_extrude(angle=90,convexity=5)square([th,x]);
    }
    for(i=[0:10:(yh-1)*10])translate([0,i,0])T1_hole(th=th);
    for(i=[0:10:(zh-1)*10])translate([0,y1,i+zd])rotate([-90,0,0])T1_hole(th=th);
    for(i=[0:10:(zh-1)*10])translate([0,y2,i+zd])rotate([-90,0,0])T1_hole(th=th);
  }
}

//  3xN strip
module T1_3str(holes=5,th=1){
  difference(){
    hull(){
      translate([-5.15+1.5,-5.15+1.5,0])cylinder(h=th,d=3);
      translate([-5.15+1.5,-5.15+holes*10-1.5+.3,0])cylinder(h=th,d=3);
      translate([25.15-1.5,-5.15+holes*10-1.5+.3,0])cylinder(h=th,d=3);
      translate([25.15-1.5,-5.15+1.5,0])cylinder(h=th,d=3);
    }
    union(){
      for(i=[0:20:20],j=[0:10:(holes-1)*10])translate([i,j,0])T1_o_hole(th);
      translate([10,0,0])T1_o_hole(th);
      translate([10,(holes-1)*10,0])T1_o_hole(th);
    }
  }
}

// plate XxY holes
//T1_plate();
module T1_plate(x=5,y=5,th=.9){
  translate([-5.15,-5.15,0])hull(){
    translate([3,3,0])cylinder(h=th,d=6);
    translate([3,x*10+.3-3,0])cylinder(h=th,d=6);
    translate([y*10+.3-3,x*10+.3-3,0])cylinder(h=th,d=6);
    translate([y*10+.3-3,3,0])cylinder(h=th,d=6);
  }
}

module T1_u1stp(y=120,hole=5,th=1,left=false,oval=false,rov=false){
  x=11.3;
  translate([left?th:0,0,0])rotate([0,-90,0])difference(){
    translate([0,-5-(y%10)/2,0])union(){
    hull(){
      translate([th,0,0])cube([x-th-4,y,th]);
      translate([x-3,3,0])cylinder(h=th,d=6);
      translate([x-3,y-3,0])cylinder(h=th,d=6);
      }
      if(left)translate([th,0,th])rotate([-90,90,0])rotate_extrude(angle=90,convexity=5)square([th,y]);
      else translate([th,y,0])rotate([90,-90,0])rotate_extrude(angle=90,convexity=5)square([th,y]);
    }
    for(i=[0:10:(hole-1)*10])translate([6,i,0])
      if(!oval)T1_hole(th=th);
      else rotate([0,0,rov?0:90])T1_o_hole(th);
  }  
}

// V strip - V pásek 
// T0_Vstrip(
//  holes - number holes, počet otvorů
// )
// ex:
//  $fn=30;T0_Vstrip(5);
module T1_Vstrip(holes=2){
  th=1;
  //#translate([-4.5-1.9,-5.15,0])cube([11.5,holes*10+.3,11.3]);
  difference(){
    union(){
     hull(){
        translate([5.15-1.5,-5.15+1.5,0])cylinder(h=th,d=3);
        translate([5.15-1.5,-5.15+.3+holes*10-1.5,0])cylinder(h=th,d=3);
        translate([-5.1,-5.15,0])cube([1,holes*10+.3,th]);
     }
     translate([-6.3+th,0,6.6])rotate([0,-90,0])hull(){
        translate([4.7-1.5,-5.15+1.5,0])cylinder(h=th,d=3);
        translate([4.7-1.5,-5.15+.3+holes*10-1.5,0])cylinder(h=th,d=3);
        translate([-5.1,-5.15,0])cube([1,holes*10+.3,th]);
     }
     translate([-6.3+1.5*th,-5.15,1.5*th])rotate([-90,90,0])rotate_extrude(angle=90,convexity=3)translate([th/2,0,0])square([th,holes*10+.3]);
    }
    union(){
      for(i=[0:10:(holes-1)*10])translate([0,i,0]){
        T1_hole(th=th);
        translate([-6.3,0,6.2])rotate([90,0,90])T1_o_hole(th=th);
      }
    }
  }
}

//  perfored strip 45des - 3 holes
//  dělovaný pásek 45 stupňů - 3 otvory
//  T0_strip45(
//    th=1,
//    ca=.1,
//    dh=3.8
//  );
// ex:
//  $fn=30;T1_strip45(th=1);
module T1_strip45(th=1){
  
  s=sqrt(2);
  v=20;
  b=5;

  x0=(v-b*s)/s-b*s;
  y0=(-v+b*s)/s;
  x1=(v-b*s)/s+b*s;
  y1=(-v+b*s)/s;
  x2=(-v+b*s)/s;
  y2=(v-b*s)/s-b*s;
  x3=(-v+b*s)/s;
  y3=(v-b*s)/s+b*s;

  difference(){
    polyhedron(
      points=[
        [x0,y0,0], [x1,y1,0],
        [x2,y2,0], [x3,y3,0],
        [x0,y0,th], [x1,y1,th],
        [x2,y2,th], [x3,y3,th]
      ],
      faces=[
        [0,1,3,2], [6,7,5,4],
        [0,4,5,1], [1,5,7,3],
        [3,7,6,2], [2,6,4,0]
      ],convexity=5
    );
    rotate([0,0,45]){
      translate([0,-10,0])T1_hole(th=th);
      translate([0,0,0])T1_hole(th=th);
      translate([0,10,0])T1_hole(th=th);
    }
   }
 }


//  banister, zábradlí
//  T0_BT(
//    n - number pieces
//    th - thick
//    ca - color add
//  }
// ex:
//  $fn=30;T0_BT(4);
module T0_BT(n=5, th=1){
  xa=.1;
  dh=3.9;
  module T0_B1(){
    translate([-10,0,0])polyhedron(
      points=[
        [0,    7.5, 0], //0
        [0,    10,  0], //1
        [2.5,  10,  0], //2
        [10,   2.5, 0], //3
        [17.5, 10,  0], //4
        [20,   10,  0], //5
        [20,   7.5, 0], //6
        [12.5, 0,   0], //7
        [7.5,  0,   0], //8
        [0,    7.5, th], //9
        [0,    10,  th], //10
        [2.5,  10,  th], //11
        [10,   2.5, th], //12
        [17.5, 10,  th], //13
        [20,   10,  th], //14
        [20,   7.5, th], //15
        [12.5, 0,   th], //16
        [7.5,  0,   th], //17
      ],
      faces=[
        [0,1,2,3,4,5,6,7,8], //bottom
        [9,10,11,12,13,14,15,16,17], //top
        [0,9,10,1], //left
        [1,10,11,2], //back1
        [2,11,12,3], //back2
        [3,12,13,4], //back3
        [4,13,14,5], //back4
        [5,14,15,6], //right
        [6,15,16,7], //front1
        [7,16,17,8], //front2
        [8,17,9,0]  //front3
      ]
    );
  }
  difference(){
    union(){
      translate([-5,-5,0])cube([10,n*10,th]);
      translate([15,-5,0])for(i=[0:n-1])translate([0,i*10+(i%2*10),0])rotate([0,0,(i%2==0)?0:180])T0_B1();
      translate([25,-5,0])cube([10,n*10,th]);
    }
    for(i=[0:10:(n-1)*10])translate([0,i,0]){
      T1_hole(th=th);
      translate([30,0,0])T1_hole(th=th);
    }
  }  
}

//  shaft - hřídel
//  T0_shaft(
//    lenght - délka
//  }
// ex:
// $fn=30;T0_shaft(100);
module T0_shaft(length){
  color("Silver"){
    rotate([-90,0,0])cylinder(h=length,d=3.7);
  }
}
