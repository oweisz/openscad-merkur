
//include <openscad-merkur/merkur.scad>
include <x_axo.scad>

include <stul.scad>

module prevod100(mont=false,rot=0,sest=true,mont1=false){
  //klec
  translate([20,-20,0])rotate([0,180,0])M1072();
  translate([30,-10,mont?-10:-2.12])rotate([0,0,90])M1021();
  for(i=[20,-20])translate([i,-3,mont?15:6.5])rotate([90,0,0])M1033();
  translate([20,-20,mont?50:15])rotate([0,180,0])M1072();
  translate([20,-10,mont?28:13])rotate([0,0,90])M1005();
  //srouby
  for(i=[20,-20])translate([i,-10,0]){
    if(mont){
      translate([0,0,-35])rotate([180,0,0])M1055(32);
      translate([0,0,11])M1051();
      translate([0,0,16])M1051();
      translate([0,0,60])M1051();
      color("black")translate([0,0,-40])axo(105,axo_z,0.5);
    }else{
      translate([0,0,-2])rotate([180,0,0])M1055(3.2);
      translate([0,0,9.2])M1051();
      translate([0,0,15])M1051();
    }
  }
  if(mont){
    translate([0,0,-20])rotate([180,0,0])M1052(23);
      translate([0,0,8])M1051();
      color("black")translate([0,0,-25])axo(32,axo_z,0.5);
  }else translate([0,0,-2])rotate([180,0,0])M1052(2.3);
    //prevody
  translate([0,-20,0]){
    if(mont)color("black")translate([0,0,-8])axo(97,axo_z,.5);
    translate([0,0,mont?55:-3])rotate([90,0,0])M1060();
    translate([0,0,mont?15:10.3])rotate([180,0,90+rot*360/50])M1045();
    translate([0,0,mont?20:10.5])M1095();
    translate([0,0,mont?30:13.7])M1098();
  }
  translate([0,20,0]){
    if(mont)color("black")translate([0,0,-8])axo(97,axo_z,.5);
    translate([0,0,mont?55:-3])rotate([90,0,0])M1060();
    translate([0,0,mont?15:10.3])rotate([180,0,90+rot*360/83])M1047();
    translate([0,0,mont?32:10.5])M1095();
    translate([0,0,mont?45:13.7])M1098();
  }
  if(sest)for(i=[-30,30])translate([i,0,.4])if(mont1){
    translate([0,0,90])M1052(25);
    translate([0,0,-10])M1051();
    color("black")translate([0,0,-15])axo(110,axo_z,0.5);
   }else M1052(2.5);
}
/*
include <openscad-merkur/merkur.scad>
rotate([0,90,0])prevod100(rot=0,mont=true,sest=false,mont1=false);
$vpt=[ 28.70, -17.07, 2.32 ];
$vpr=[68,0,337];
$vpd=250;
*/

//hridel pohonu stolu + sestaveny stul
module hr_stul2(mont=false,pap=0,angle=0,scale=1,color="black"){
  translate([0,0,mont?80:-1])stul_sest(simple=false,sest=false,pap=pap,angle=angle,scale=scale,color=color);
  translate([0,0,mont?-70:-53])M1050();
  if(mont)color("black")translate([0,0,-75])axo(100,axo_z,.5);
}

//sestaveny stul
module hr_stul(mont=false,poz=0,mux=false){
  ppoz=poz>60?60:poz;
  translate([0,mont?80:-132,95])M2062();
  translate([0,mont?50:15,95])rotate([90,0.0])M1050();
  translate([0,mont?55:23.2,95])rotate([-90,0,2.5])M1057();
  if(mux){
    for(i=[20:20:60])translate([0,-105+i,95])rotate([90,0,2.5])color(c=[.9,.5,.5,.2])render()M1089(hub=true);
    translate([0,-105,95])rotate([90,0,2.5])M1089(hub=true);
  }else translate([0,mont?-50:(-105+ppoz),95])rotate([90,0,2.5])M1089(hub=true);
  if(mont)color("black")translate([0,260,95])axo(400,axo_y,.5);

}
/*
include <openscad-merkur/merkur.scad>
hr_stul(mux=true);
*/
//pastorek
module hr_pas(mont=false){
  rotate([0,180,95])M1046();
  if(mont){
    translate([0,0,-100])rotate([90,0,0])M2060();
    color("black")translate([0,0,-105])axo(138,axo_z,.5);
  }else translate([0,0,-20])rotate([90,0,0])M2060();
}

module hr_sv1(mont=false){
  translate([0,0,mont?-100:0])rotate([90,0,0])M3061();
  translate([0,0,mont?91:59])rotate([0,0,0])M1046();
  translate([0,0,24])rotate([180,0,0])M2047();
  translate([0,0,mont?42:33])rotate([180,0,0])M1043();
  translate([0,0,mont?63:43])rotate([180,0,0])M1042();
  translate([0,0,mont?82:53])rotate([180,0,0])M1040();
  translate([0,0,mont?108:94.4])M1050();
  if(mont)color("black")translate([0,0,-103])axo(223,axo_z,.5);
}

module hr_motor(mont=false,sest=false,mont1=false){
  translate([0,-45,0])rotate([-90,0,0]){
    M1400(true);
    if(!sest){
    }else{
      translate([-15,15,5]){
        translate([0,0,mont1?70:0])rotate([0,-90,0])M3076();
        translate([30,0,mont1?70:0])mirror([1,0,0])rotate([0,-90,0])M3076();
        for(i=[[-5,0,-4.5],[-5,10,-4.5],[35,0,-4.5],[35,10,-4.5]])translate(i)if(mont1){
          translate([0,0,90])M1052(20);
          translate([0,0,-55])M1051();
          color("black")translate([0,0,-60])axo(156,axo_z,.5);
        }else M1052(2);
      }
    }
  }
  translate([0,0,mont?-65:-35.5])M1140();
  translate([0,0,mont?18:0.5])M2050();
  if(mont)color("black")translate([0,0,-60])axo(100,axo_z,.5);
  translate([0,0,mont?38:18.5])rotate([180,0,0]){
    M1041();
    if(mont){
      translate([10,0,18])M2053(10);
      translate([10,0,-8])M1051();
      color("black")translate([10,0,-10])axo(35,axo_z,.5);
    }else  translate([10,0,.8])M2053(1);
  }
}

/*
include <openscad-merkur/merkur.scad>
rotate([0,-90,0])hr_motor();
$vpt=[ -98.44, -0.70, 3.61 ];
$vpr=[55,0,20];
$vpd=250;
*/


module hr_sv2(mont=false){
  translate([0,0,mont?-110:0])rotate([90,0,0])M1062();
  translate([0,0,120])rotate([180,0,0]){
    M1041();
    if(mont){
      translate([10,0,18])M2053(10);
      translate([10,0,-8])M1051();
      color("black")translate([10,0,-10])axo(35,axo_z,.5);
    }else translate([10,0,.8])M2053(1);
  }
  translate([0,0,mont?15:11.5])M2050();
  translate([0,0,mont?30:19])M1095();
  translate([0,0,mont?48:31])rotate([180,0,0])M1040();
  translate([0,0,mont?63:41])rotate([180,0,0])M1042();
  translate([0,0,mont?80:51])rotate([180,0,0])M1043();
  translate([0,0,mont?98:93])M1050();
  if(mont)color("black")translate([0,0,-113])axo(240,axo_z,.5);
}
/*
include <openscad-merkur/merkur.scad>
hr_sv2(true);
*/
module hr_sv3(mont=false,pre=true,mux=false){
  pp=pre?[0,109.5,31]:[0,119.8,31];
  pr=pre?[0,0,0]:[0,0,180];
  rr=pre?.7:.7;
  translate(pp)rotate(pr)prevod100(rot=rr);
  translate([0,pre?129.5:139.5,66.5])M1140();
  translate([0,pre?129.5:139.5,75]){
    rotate([90,0,0])M1061();
    translate([0,0,65])rotate([180,0,0]){
      M2083();
      translate([20,0,1]){
        M1055(9.2);
        translate([0,0,-9])M2050();
      }
    }
    if(mux)translate([0,0,65])rotate([180,0,0]){
      color(c=[.9,.5,.5,.2])render()translate([10,0,1]){
        M1055(9.2);
        translate([0,0,-9])M2050();
      }
    }
    
  }
}
/*
include <openscad-merkur/merkur.scad>
hr_sv2();
import("sasi.stl");
*/
module hr_sv3m(mont=false,poz=false){
    if(mont)color("black")translate([0,0,28])axo(150,axo_z,.5);
  translate([0,0,mont?50:66.5])M1140();
  translate([0,0,75]){
    rotate([90,0,0])M1061();
    translate([0,0,mont?85:65])rotate([180,0,0]){
      M2083();
      translate([poz?10:20,0,1]){
        if(mont){
            translate([0,0,30])M1055(50);
            translate([0,0,-23])M1051();
            translate([0,0,-16])M2050();
            color("black")translate([0,0,-28])axo(62,axo_z,.5);
        }else{
            M1055(9.2);
            translate([0,0,-9])M2050();
        }
      }
    }
  }
}


/*
include <openscad-merkur/merkur.scad>

rotate([0,-90,0])hr_sv3m(mont=true,poz=false);
$vpt=[ -98.44, -0.70, 3.61 ];
$vpr=[55,0,20];
$vpd=250;
*/

//all prevody
module prevody(poz=true,pap=0,angle=0,scale=1,color="black"){
  hr_stul(poz=30);
  translate([0,-140,115])hr_stul2(pap=pap,angle=angle,scale=scale,color=color);
  translate([39.8,40,45])hr_pas();
  translate([0,40,18])hr_sv1();
  translate([-90,40.5,20])hr_sv2();
  hr_sv3(false,pre=poz);
  translate([40,41,120])hr_motor();
  translate([0,40,18])color("red")hr_guma();
}

/*
include <openscad-merkur/merkur.scad>
include <stul.scad>
rotate([0,-90,0])prevody(pap=1,scale=.5);
*/

//hridel stolu
module prevod01(mont=false){
hr_stul(poz=30,mont);
}

//+stul
module prevod02(mont=false,mux=false){
hr_stul(poz=30);
translate([0,-140,115])hr_stul2(mont,mux=mux);
}

//samotny motor sestaveny
module prevod03(mont=false){
  hr_motor(mont);
}

//+motor namontovany | montaz
module prevod04(mont=false){
  //hr_stul(poz=30);
  //translate([0,-140,115])hr_stul2(mont);
  translate([40,41,120])hr_motor(sest=true,mont1=mont);
}

//+pastorek motoru | montaz
module prevod05(mont=false){
  //hr_stul(poz=30);
  //translate([0,-140,115])hr_stul2(mont);
  translate([40,41,120])hr_motor(sest=true,mont1=false);
  translate([39.8,40,45])hr_pas(mont);
}

//dily prevodove hridele - pohon stolu
module prevod06(mont=true){
  rotate([0,90,0])hr_sv1(mont);
  translate([0,0,-70])rotate([0,90,0])hr_sv2(mont);
  translate([0,0,-60])rotate([0,0,0])scale([.7,.7,.7])color("red")hr_guma();
  translate([30,0,50])rotate([-50,0,0])rotate([0,90,0])hr_pas(mont);
}

//dily prevodove hridele - bocni pohyb
module prevod08(mont=true){
  translate([0,40,18])hr_sv1();
}

//prevodova gumicka
module hr_guma(poz=2){
  //translate [0,40,18])
    la1=33;
    la2=43;
    la3=53;
  
  if(poz==1){
    translate([-91,-9,la1])rotate([0,90,-11])cylinder(h=90,d=2);
    translate([-91,9,la1])rotate([0,90,11])cylinder(h=90,d=2);
    af10=12;
    translate([0,0,la1])rotate([0,0,-90-af10/2])rotate_extrude(angle=180+af10,convexity=5)translate([26.5,0,0])circle(1);
  af11=10;
    translate([-90,0,la1])rotate([0,0,90+af11/2])rotate_extrude(angle=180-af11,convexity=5)translate([9,0,0])circle(1);
  }
  if(poz==3){
    translate([-89,-26.5,la3])rotate([0,90,11])cylinder(h=93,d=2);
    translate([-89,26.5,la3])rotate([0,90,-11])cylinder(h=93,d=2);
    af20=12;
    translate([0,0,la3])rotate([0,0,-90+af20/2])rotate_extrude(angle=180-af20,convexity=5)translate([9,0,0])circle(1);
  af21=10;
    translate([-90,0,la3])rotate([0,0,90-af21/2])rotate_extrude(angle=180+af21,convexity=5)translate([26.5,0,0])circle(1);
  }
  if(poz==2){
    la2=43;
    translate([-90,-15.8,la2])rotate([0,90,0])cylinder(h=90,d=2);
    translate([-90,15.8,la2])rotate([0,90,0])cylinder(h=90,d=2);
    translate([0,0,la2])rotate([0,0,-90])rotate_extrude(angle=180,convexity=5)translate([15.8,0,0])circle(1);
    translate([-90,0,la2])rotate([0,0,90])rotate_extrude(angle=180,convexity=5)translate([15.8,0,0])circle(1);
  }
}

//montaz prevodovych hrideli + gumicka
module prevod09(prevod=2,mux=false){
  hr_stul(poz=30,mux=mux);
  translate([0,-140,115])hr_stul2();
  translate([40,41,120])hr_motor(sest=true,mont1=false);
  translate([39.8,40,45])hr_pas();
  translate([0,40,18])hr_sv1();
  translate([-90,40.5,20])hr_sv2();
  translate([0,40,18])color("red")hr_guma(poz=prevod);
}

//montaz prevodovky
module prevod16(pre=true){
  pp=pre?[0,109.5,-25]:[0,119.8,-25];
  pr=pre?[0,0,0]:[0,0,180];
  rr=pre?.7:.7;
  translate(pp)rotate(pr)prevod100(rot=rr,sest=true,mont1=true);
//prevod100(mont=false,rot=0,sest=true,mont1=true);
}

module prevod17(pre=true){
  pp=pre?[0,109.5,31]:[0,119.8,31];
  pr=pre?[0,0,0]:[0,0,180];
  rr=pre?.7:.7;
  translate(pp)rotate(pr)prevod100(mont=false,rot=0,sest=true,mont1=false);
}

//testy


//hr_sv3(pre=true);
