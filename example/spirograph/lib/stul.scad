include <deska_vrt.scad>

module stul_sest(simple=true,sest=false,pap=0,angle=0,scale=1,color="black"){
    deska_vrt(simple);
    translate([0,0,sest?-20:-2])rotate([180,0,0])M2083();
    translate([0,0,sest?-35:1.5])rotate([-90,0,0])M1061();
    color("silver")for(i=[0,120,240])rotate([180,0,i])translate([20,0,sest?70:2.5])vrut_29();
    color("black")if(sest){
        translate([0,0,-40])axo(40,axo_z,.7);
        for(i=[0:120:360])rotate([180,0,i])translate([20,0,-5])axo(70,axo_z,0.7);
    }
    //circle
    rotate([0,0,angle]){
        if(pap==1){translate([0,0,1.45])stul_pap(curve="circle.png",scale=scale,color=color);}
    //sine wave
        if(pap==2){translate([0,0,1.45])stul_pap("sinewave.png",scale=scale,color=color);}
    //hypocykloids
        if(pap==3){translate([0,0,1.45])stul_pap("hypocykloids.png",scale=scale,color=color);}
    //combi
        if(pap==4){translate([0,0,1.45])stul_pap("combine.png",scale=scale,color=color);}
    }
}
/*
include <../openscad-merkur/merkur.scad>
include <vrut29.scad>

stul_sest(simple=true,pap=1,angle=15,scale=.5,color="green");
*/

module stul_pap(curve="circle.png",scale=1,color="black"){
    sca=scale*.3;
    color(c=[0.95,1,.95,1])cylinder(h=.1,d=225);
    color(color)
    intersection(){
    cylinder(h=1,d=224);
    translate([0,0,0.05])scale([sca,sca,0.005])
    translate([0,0,100])surface(curve,center=true,invert=true);}
}

//stul_pap("circle.png");
//stul_pap("sinewave.png");
//stul_pap("hypocykloids.png");
//stul_pap("combine.png");