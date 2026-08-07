
include <x_axo.scad>


//bok
module sasi101(mont=false){
  translate([0,-100,0])M1025();
  translate([0,0,mont?-20:-1])M1077();
  translate([0,140,mont?-15:0])rotate([180,0,0])M1078();
  translate([0,-100,mont?-10:-0.5])rotate([180,0,0])M1001();
  translate([100,-6,mont?18:-5])rotate([90,90,180])M1027();
  translate([10,146,mont?10:-5])rotate([90,90,0])M1027();
  translate([80,0,-1])M1023();
  translate([20,50,mont?-25:-1])rotate([180,0,0])M1001();
  //srouby
  if(!mont){
  translate([0,0,1.2])for(i=[[0,0,0],[10,0,0],[70,0,0],[90,0,0],[0,50,0],[0,120,0],[0,140,0],[10,140,0],[30,140,0],[80,140,0],[90,140,0]])translate(i)M1052(2);
  translate([80,0,-1])rotate([180,0,0])M1052(2);
  translate([20,50,-2])rotate([180,0,0])M1052(2);
  translate([0,-100,-1.5])rotate([0,180,0])M1052(2.5);
  }else{
  translate([0,0,32])for(i=[[0,0,0],[10,0,0],[70,0,0],[90,0,0],[0,50,0],[0,120,0],[0,140,0],[10,140,0],[30,140,0],[80,140,0],[90,140,0]])translate(i){
    M1052(30);
    translate([0,0,-57])M1051();
    color("black")translate([0,0,-65])axo(70,axo_z,.5);
 }
  translate([80,0,-30])rotate([180,0,0]){
    M1052(30);
    translate([0,0,-65])M1051();
        color("black")translate([0,0,-70])axo(66,axo_z,.5);
  }
  translate([20,50,-40])rotate([180,0,0]){
    M1052(20);
    translate([0,0,-40])M1051();
    color("black")translate([0,0,-45])axo(40,axo_z,.5);

  }
  translate([0,-100,-30])rotate([0,180,0]){
    M1052(25);
    translate([0,0,-40])M1051();
    color("black")translate([0,0,-45])axo(40,axo_z,.5);}
  }
}
//sasi101();


//ram sestava
module sasi100(mont=false,tap=false,mux=false){
  translate([-125,0,5])rotate([0,-90,0])
    sasi101();
    //import("bok.stl");
    translate([125,0,5])rotate([0,90,0])mirror([1,0,0])
    if(!tap)sasi101();
  translate([120,mont?160:146,25])rotate([0,90,90])
  {
    M1025();
    translate([0,90,mont?-5:0])rotate([180,0,-90])M1001();
    translate([0,150,mont?-5:0])rotate([180,0,-90])M1001();
    if(mont){
      translate([0,0,20]){
        M1052(20);
        translate([0,0,-50])M1051();
        color("black")translate([0,0,-55])axo(60,axo_z,0.5);
      }
      translate([0,240,20]){
        M1052(20);
        translate([0,0,-50])M1051();
        color("black")translate([0,0,-55])axo(60,axo_z,0.5);
      }
      translate([0,90,-30]){
        translate([0,0,40])M1051();
        color("black")translate([0,0,-5])axo(55,axo_z,0.5);
        rotate([180,0,0])M1052(20);
      }
      translate([0,150,-30]){
        translate([0,0,40])M1051();
        color("black")translate([0,0,-5])axo(55,axo_z,0.5);
        rotate([180,0,0])M1052(20);
      }
    }else{
      translate([0,0,1])M1052(2);
      translate([0,240,1])M1052(2);
      translate([0,90,-.8])rotate([180,0,0])M1052(2);
      translate([0,150,-.8])rotate([180,0,0])M1052(2);
    }
  }
  translate([120,mont?-115:-107,5])rotate([0,90,90]){
    M1025();
    if(mont){
      translate([0,0,30]){
        M1052(20);
        translate([0,0,-40])M1051();
        color("black")translate([0,0,-50])axo(45,axo_z,0.5);
     }
      translate([0,240,30]){
        M1052(20);
        translate([0,0,-40])M1051();
        color("black")translate([0,0,-50])axo(45,axo_z,0.5);
     }
    
    }else{
      translate([0,0,2])M1052(2);
      translate([0,240,2])M1052(2);
    }
  }
  translate([120,mont?130:143,105])rotate([0,90,90])sasi230(false,true,mont,mux=mux);
}

/*
include <openscad-merkur/merkur.scad>
sasi100(false,false,);
//$vpt=[ 14.63, 69.01, 44.07 ];ž
//$vpr=[45,0,110];
//$vpd=750;
*/

module sasi231(mont=false){
    M3031();
    translate([0,mont?35:25.5,7])rotate([-90,180,0])M1032();
    //montazni sroub
    if(mont){
      translate([0,-35,7])rotate([90,0,0]){
        M1052(20);
        translate([0,0,-40])M1051();
        translate([0,0,-95])color("black")axo(100,axo_z,0.5);
      }
      translate([0,50,7])rotate([-90,0,0]){
        M1052(18);
        translate([0,0,-35])M1051();
      }
      translate([0,30,18])rotate([90,0,0]){
        M2053(30);
        translate([0,0,-30])M1051();
        color("black")translate([0,0,-35])axo(40,axo_z,0.5);
      }
    }else{
    translate([0,-6.5,7])rotate([90,0,0])M1052(2);
    translate([0,26.5,7])rotate([-90,0,0])M1052(1.8);
    translate([0,35.6,18])rotate([90,0,0])M2053(1.2);
    }
  
}

//zadni pricka
module sasi230(mont=false,sest=true,mont1=false,mux=false){
    M1029();
    translate([0,0,mont?15:1])M2037();
    if(sest){
      if(!mont1){
        translate([0,0,3.1])M1052(3.2);
        translate([40,0,3.1])M1052(2.2);
      }else{
        translate([0,0,30])M1052(32);
          translate([0,0,-10])M1051();
        translate([40,0,30])M1052(22);
          translate([40,0,-10])M1051();
        color("black")translate([0,0,-15])axo(50,axo_z,.5);
        color("black")translate([40,0,-15])axo(50,axo_z,.5);
      }
    }
    if(mont){
      translate([0,40,35])M1052(20);
      translate([0,40,-25])M1051();
      color("black")translate([0,40,-35])axo(75,axo_z,.5);
      }else translate([0,40,2])M1052(2);
    translate([0,240,mont?25:2])rotate([180,0,0])M2037();
    if(sest){
      if(!mont1){
          translate([0,240,3.1])M1052(3.2);
          translate([40,240,3.1])M1052(2.2);
        }else{
          translate([0,240,30])M1052(32);
          translate([0,240,-10])M1051();
          translate([40,240,30])M1052(22);
          translate([40,240,-10])M1051();
          color("black")translate([0,240,-15])axo(50,axo_z,.5);
          color("black")translate([40,240,-15])axo(50,axo_z,.5);
        }
    }
    if(mont){
      translate([0,200,45])M1052(20);
      translate([0,200,-25])M1051();
      color("black")translate([0,200,-35])axo(90,axo_z,0.5);
    }else translate([0,200,2])M1052(2);
    //lozisko
    translate([mont?-15:-6.2,110,6])rotate([-90,0,90]){
      M1038();
      if(mont){
      translate([0,0,-30]){
        rotate([180,0,0])M1052(20);
        translate([0,0,40])M1051();
        color("black")translate([0,0,-5])axo(50,axo_z,0.5);
      }
      translate([20,0,-30]){
        rotate([180,0,0])M1052(20);
        translate([0,0,40])M1051();
        color("black")translate([0,0,-5])axo(50,axo_z,0.5);
      }
      }else{
        translate([0,0,-1])rotate([180,0,0])M1052(2);
        translate([20,0,-1])rotate([180,0,0])M1052(2);
      }
    }
  translate([mont?-22:-11.8,77,5])rotate([0,-90,90])if(mux){
        for(i=[0:20:60])translate([0,0,i])color(c=[.9,.5,.5,.2])render()sasi231(mont);
        for(i=[0:20:60])translate([0,0,i-150])mirror([0,0,1])color(c=[.9,.5,.5,.2])render()sasi231(mont);
    }else sasi231(mont);
}

/*
include <openscad-merkur/merkur.scad>
sasi230(mont=false,sest=false,mont1=false,mux=true);
$vpt=[ -13.12, 110.03, 1.89 ];
$vpr=[35,0,225];
$vpd=500;
*/

module sasi211(mont=false){
  M1036();
  translate([0,110,0])M1035();
  translate([40,30,mont?-30:-1])rotate([0,0,90])M1015();
  translate([0,90,mont?-30:-1])rotate([0,0,90])M1011();
  translate([20,20,mont?-5:-1])rotate([0,0,90])M1003();
  translate([20,20,mont?-15:-2])rotate([0,0,90])M1003();
  translate([30,60,mont?-20:-1])rotate([0,0,90])M1004();
  translate([30,150,mont?-20:-1])rotate([0,0,90])M1004();
  translate([0,0,mont?-35:-16])M1003();
  translate([0,0,mont?-15:-8])M2050();
  translate([0,0,mont?-28:-16])M2050();
  //srouby
  if(mont){
    translate([0,0,40]){
      M1055(30);
      translate([0,0,-85])M1051();
      color("black")translate([0,0,-90])axo(98,axo_z,.5);
    }
    for(i=[[0,30,0.5],[40,30,0.5],[0,90,0.5],[30,60,.5],[30,150,.5]])translate(i){
      translate([0,0,55])M1052(19);
      translate([0,0,-40])M1051();
      color("black")translate([0,0,-45])axo(108,axo_z,.5);
    }
    translate([20,20,45]){
      M1052(29);
      translate([0,0,-85])M1051();
      color("black")translate([0,0,-90])axo(98,axo_z,.5);
   }
  }else{
    translate([0,0,.5])M1055(16.8);
    for(i=[[0,30,0.5],[40,30,0.5],[0,90,0.5],[30,60,.5],[30,150,.5]])translate(i)M1052(1.9);
    translate([20,20,.5])M1052(2.9);
  }
}

//sasi211(true);
//$vpt=[ 30.02, 57.35, 0.58 ];
//$vpr=[240,0,120];
//$vpd=400;


//sasi210();
//pricka dolni
module sasi210(mont=false,sest=true,mont1=false){
  M1029();
  translate([0,0,-50])M1025();
  translate([5.5,60,-45.5])rotate([0,-90,0])sasi211();
  //srouby boky vingl
  if(mont){
    for(i=[60,150,170,210])translate([0,i,30]){
      M1052(20);
      translate([0,0,-40])M1051();
      color("black")translate([0,0,-45])axo(50,axo_z,.5);
    }
    for(i=[70,140,170,200])translate([0,i,-71])rotate([180,0,0]){
      M1052(20);
      translate([0,0,-38])M1051();
      color("black")translate([0,0,-45])axo(50,axo_z,.5);
    }
  }else{
    for(i=[60,150,170,210])translate([0,i,1])M1052(2);
    for(i=[70,140,170,200])translate([0,i,-51])rotate([180,0,0])M1052(2);
  }
  if(sest){
    if(mont1){
      for(i=[1,239])translate([0,i,-70])rotate([180,0,0]){
        M1052(20);
        translate([0,0,-38])M1051();
        color("black")translate([0,0,-45])axo(50,axo_z,.5);
      }
      for(i=[[-25,90,-145],[-25,150,-145]]) translate(i)rotate([0,-90,0]){
        M1052(19);
        translate([0,0,-38])M1051();
        color("black")translate([0,0,-45])axo(50,axo_z,.5);
      }
      if(sest) for(i=[0,240])translate([0,i,30]){
        M1052(20);
        translate([0,0,-38])M1051();
        color("black")translate([0,0,-45])axo(50,axo_z,.5);
      }
    }else{
      for(i=[1,239])translate([0,i,-51])rotate([180,0,0])M1052(2);
      for(i=[[4.6,90,-145],[4.6,150,-145]]) translate(i)rotate([0,-90,0])M1052(1.9);
      if(sest) for(i=[0,240])translate([0,i,1])M1052(2);
    }
  }
}

//pohled shora
/*include <openscad-merkur/merkur.scad>
rotate([0,-90,-90])sasi210(mont_up=true,sest=false,mont1=false);
$vpt=[ 152.19, 84.72, -96.59 ];
$vpr=[60,0,330];
$vpd=550;
*/

//pohled zdola
/*rotate([0,90,90])sasi210(mont=true,sest=false,mont1=false);
$vpt=[ -129.38, 42.03, -91.58 ];
$vpr=[50,0,0];
$vpd=550;
*/
//montaz
/*
include <openscad-merkur/merkur.scad>
%import ("sasi2.stl");
translate([120,-6,25])rotate([0,-90,90])sasi210(sest=true,mont1=true);
$vpt=[ -40.15, 146.18, 83.25 ];
$vpr=[75,2,205];
$vpd=500;
*/

//pricka horni
module sasi200(mont=false,sest=false,mont1=false){
  translate([6,0,6.2])rotate([0,-90,0]){
    M1029();
   translate([0,120,mont?-30:-1])rotate([0,0,-90])M3038();
    translate([0,30,mont?-110:-1])rotate([0,0,-90])M3038();
    translate([6.5,120,mont?30:6.5])rotate([90,0,-90])M2039();
    if(mont){
      translate([0,100,40]){
        M1052(30);
        translate([0,0,-85])M1051();
        color("black")translate([0,0,-85])axo(90,axo_z,0.5);
      }
      translate([0,140,40]){
        M1052(30);
        translate([0,0,-85])M1051();
        color("black")translate([0,0,-85])axo(90,axo_z,0.5);
      }
      translate([0,10,-130]){
        rotate([180,0,0])M1052(20);
        translate([0,0,150])M1051();
        color("black")translate([0,0,-10])axo(170,axo_z,0.5);
      }
      translate([0,50,-130]){
        rotate([180,0,0])M1052(20);
        translate([0,0,150])M1051();
        color("black")translate([0,0,-10])axo(170,axo_z,0.5);
      }
    }else{
      translate([0,100,2])M1052(3);
      translate([0,140,2])M1052(3);
      translate([0,10,-1])rotate([180,0,0])M1052(2);
      translate([0,50,-1])rotate([180,0,0])M1052(2);
    }
  }
  //srouby
  if(mont){
    for(i=[0,40,200,240]){
    translate([0,i,-80])rotate([180,0,0])M1052(20);
    translate([0,i,25])M1051();
    color("black")translate([0,i,-85])axo(115,axo_z,0.5);
    }
  }else{
    for(i=[0,40,200,240])translate([0,i,-1])rotate([180,0,0])M1052(2);
  }  
  //nosna
  translate([30,0,mont?-30:-1.2])rotate([0,0,90]){
    M1073();
    translate([46.5,0,mont?-30:-5.5])rotate([-90,0,90]){
      M1039();
      if(mont){
        translate([0,-140,6.5])rotate([90,0,0]){
          M1052(15);
          translate([0,0,-170])M1051();
          translate([0,0,-175])color("black")axo(180,axo_z,0.5);
        }
        translate([20,-86,6.5])rotate([90,0,0]){
          M1052(15);
          translate([0,0,-115])M1051();
          translate([0,0,-120])color("black")axo(125,axo_z,0.5);
        }
      }else{
        translate([0,-6.5,6.5])rotate([90,0,0])M1052(1.5);
        translate([20,-6.5,6.5])rotate([90,0,0])M1052(1.5);
      }
    }
  }
  translate([30,200,mont?-30:-1.2])rotate([0,0,90]){
    M1073();
    translate([-6.5,20,mont?-30:-5.5])rotate([90,180,90])M1039();
     translate([0,7,mont?20:6.7])rotate([90,0,0]){
        M3031();
        if(mont){
          translate([0,10,-75]){
            rotate([180,0,0])M2053(30);
            translate([0,0,100])M1051();
            translate([0,0,-5])color("black")axo(110,axo_z,0.5);
          }
        }else translate([0,10,0])rotate([180,0,0])M2053(1);
      }
      if(mont){
        translate([0,0,-50]){
          rotate([180,0,0])M1052(28);
          translate([0,0,72])M1051();
          translate([0,0,-5])color("black")axo(87,axo_z,0.5);
        }
        translate([0,20,13]){
          M1052(15);
          translate([0,0,-55])M1051();
          translate([0,0,-60])color("black")axo(65,axo_z,0.5);
        }
      }else{
        translate([0,0,-1])rotate([180,0,0])M1052(2.8);
        translate([0,20,1])M1052(1.5);
      
      }
  }
  //srouby k sasi
  if(sest){
    if(mont1){
      translate([-10,0,-10]){
        rotate([180,0,0])M1052(25);
        translate([0,0,55])M1051();
        translate([0,0,-5])color("black")axo(70,axo_z,0.5);
      }
      translate([-30,0,-10]){
        translate([0,0,55])M1052(25);
        M1051();
        translate([0,0,-5])color("black")axo(70,axo_z,0.5);
        }
      translate([-10,240,-10]){
        rotate([180,0,0])M1052(25);
        translate([0,0,55])M1051();
        translate([0,0,-5])color("black")axo(70,axo_z,0.5);
        }
      translate([-30,240,-10]){
        translate([0,0,55])M1052(25);
        M1051();
        translate([0,0,-5])color("black")axo(70,axo_z,0.5);
        }
  }else{
      translate([-10,0,-.5])rotate([180,0,0])M1052(2.5);
      translate([-30,0,1])M1052(2.5);
      translate([-10,240,-.5])rotate([180,0,0])M1052(2.5);
      translate([-30,240,1])M1052(2.5);
    }
  }
  //drzak motoru
  translate([-41,190,mont?60:2])rotate([180,0,0]){
    M1073();
    if(mont){
      translate([40,0,-62]){
        rotate([180,0,0])M1052(20);
        translate([0,0,132])M1051();
        translate([0,0,-6])color("black")axo(145,axo_z,0.5);
      }
      translate([40,60,-55]){
        rotate([180,0,0])M1052(20);
        rotate([180,0,0])M1052(20);
        translate([0,0,130])M1051();
        translate([0,0,-6])color("black")axo(143,axo_z,0.5);
      }
    }else{
      translate([40,0,0])rotate([180,0,0])M1052(2);
      translate([40,60,0])rotate([180,0,0])M1052(2);
    }
 }
  //drzak nosniku stolu
  for(i=[20,40,200,220]){
    if(mont){
      translate([-15,i,-55])rotate([90,0,90]){
    M1001();
    translate([0,-15,4.7])rotate([90,0,0]){
      M1052(18);
      translate([0,0,-100])M1051();
        translate([0,0,-105])color("black")axo(110,axo_z,0.5);
    }
    }
    }else{
      translate([-15,i,-6.5])rotate([90,0,90]){
    M1001();
    translate([0,4.7,5])rotate([90,0,0])M1052(1.8);
    }
    }
  }
}
//sasi200(mont=true);

module sasi300(mont=false,sest=false,mont1=false){
  translate([6/11*203+9.95,-20,mont?-30:-6])rotate([0,90,0]){
    M1024();
    translate([0,30,mont?-70:-0.2])rotate([180,0,0])M1034();
    for(i=[10,30])translate([0,i,1])
    if(mont){
      translate([0,0,25])M1052(20);
      translate([0,0,-95])M1051();
      color("black")translate([0,0,-98])axo(128,axo_z,.5);
    }else M1052(2);
  }
  translate([0,-80,0])rotate([0,0,0])sasi301(mont,sest,mont1);
  translate([0,80,0])rotate([0,0,0])mirror([0,1,0])sasi301(mont,sest,mont1);
}

//translate([10,-20,0])sasi200();
//translate([2,100,-2.2])rotate([180,0,0])sasi300();

//nosnik stolu sestava
//include <openscad-merkur/merkur.scad>
/*sasi300(true);
$vpt=[ -1.06, 35.95, -9.96 ];
$vpr=[240,0,215];
$vpd=550;
import ("sasi3.stl");
translate([0,-12.5,101])rotate([0,0,-90])sasi300(false,true,true);
$vpt=[ -66.92, 126.52, 8.41 ];
$vpr=[75,0,30];
$vpd=800;
*/

module sasi301(mont=false,sest=false,mont1=false){
  af=acos(6/11);
  //pricka
  translate([0,0,mont?-20:-1.2])rotate([180,0,0])M1078();
  translate([9.95,-15.84,.5])rotate([0,180,360-af])M1028();
  //vzpera
  translate([sin(af)*104+9.95,cos(af)*52+15.84,mont?-40:-6.4]){
    rotate([90,0,90])M1001();
    rotate([-89,2.5,90]){
      translate([0,0,mont?10:0])M1010();
      if(mont){
        translate([1,0,-13])rotate([180,0,0])M1052(20);
        translate([1,0,22])M1051();
        color("black")translate([1,0,-19])axo(48,axo_z,.5);
      }else translate([1,0,-1])rotate([180,0,0])M1052(2);
      //montazni srouby
      if(sest){
        if(mont1){
          translate([0,90,-20])rotate([180,0,0]){
          M1052(20);
          translate([0,0,-45])M1051();
          color("black")translate([0,0,-50])axo(55,axo_z,.5);
        }
        }else translate([1,90,0])rotate([180,0,0])M1052(2);
      }
    }
    //srouby
    if(mont){
     translate([5,0,-15])rotate([180,0,0]){
      M1052(20);
      translate([0,0,-73])M1051();
      color("black")translate([0,0,-77])axo(83,axo_z,.5);
      }
    }else translate([5,0,5])rotate([180,0,0])M1052(2);
  }
  //na vinglu
  translate([9.95,-15.84,.5])rotate([0,0,360-af]){
    for(i=[0,30,140])translate([0,i,0])if(mont){
      translate([0,0,15])M1052(25);
      translate([0,0,-32])M1051();
      color("black")translate([0,0,-38])axo(60,axo_z,.5);
    }else M1052(2.5);
  }
  //montazni srouby
  if(sest){
    if(mont1){
      translate([0,0,60])M1052(25);
      translate([0,-20,60])M1052(25);
      translate([0,0,-26])M1051();
      translate([0,-20,-26])M1051();
      color("black")translate([0,0,-30])axo(95,axo_z,.5);
      color("black")translate([0,-20,-30])axo(95,axo_z,.5);
    }else{
    translate([0,0,0])M1052(2.5);
    translate([0,-20,0])M1052(2.5);
    }
  }
}

module sasi800(mux=false){
    sasi100(mux=mux);
    translate([-120,-6,115])rotate([0,-90,-90])sasi200(sest=true,mont1=false);
    translate([120,-6,25])rotate([0,-90,90])sasi210(sest=true,mont1=false);
    translate([0,-12.5,101])rotate([0,0,-90]) sasi300(false,true,false);
}

module sasi901(){
    M3031();
    translate([0,25.5,7])rotate([-90,180,0])  M1032();
    translate([0,-6.5,7])rotate([90,0,0])M1052(2);
    translate([0,26.5,7])rotate([-90,0,0])M1052(1.8);
    translate([0,35.6,18])rotate([90,0,0])M2053(1.2);
}

//pro vykresleni nastavovacich prvku kreslice
module sasi900(){
//zadni pricka
translate([120,143,105])rotate([0,90,90]){
  M1029();
  translate([-11.8,77,5])rotate([0,-90,90]){
  for(i=[0:20:60])translate([0,0,i])
  sasi901();
  for(i=[0:20:60])translate([0,0,-85-i])
  mirror([0,0,1])sasi901();
  }
}

//horni pricka
translate([-120,-6,115])rotate([0,-90,-90])
translate([30,200,-1.2])rotate([0,0,90])
translate([0,7,6.7])rotate([90,0,0])
{
  M3031();
  translate([0,10,0])rotate([180,0,0])M2053(1);
}
}

/*
include <openscad-merkur/merkur.scad>
//import ("sasi.stl");
sasi800(mux=true);
*/
