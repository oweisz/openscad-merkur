//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>



module belt(){
    path=["move",90,"arczrot",21,35.5,"move",80,"arczrot",12,155.85,"move",164.5,"arczrot",20,165.9];

    up(12)fwd(20)
    
    M1084(path);

    zcopies(10,2){
        M1042();
        right(90)M1042();
        fwd(-40)right(160)M1040();
    }
    down(22)xrot(90)M2060();
    up(17)M1050();
    right(90){
        down(22)xrot(90)M2060();
        up(17)M1050();
    }
}
//belt() ;

module bort(){
    back(240)zrot(180)M1029();
    back(100)down(1)M1074();
    back(100)down(34)M1074();
    move([5,170,-27])yrot(-90)M1024();
    move([34,140,-7])yrot(90)M1127("red");
    move([40,190,-16])zrot(90)xflip()belt();
    
    //srouby
    for(i=[[0,190,-34],[0,170,-34],[40,160,-34],[40,140,-34]])move(i)zflip()M1052(2);
    for(i=[[0,190,-2],[0,170,-2]])move(i)zflip()M1052(3);
    for(i=[[40,160,-2],[40,140,-2]])move(i)zflip()M1052(2);

}
//bort();

module vz3(){
    M1028();
    move([41,43,6])zrot(90)yrot(90)M2031();
    move([1,97,6])zrot(-90)yrot(90)M2031();
    //srouby
    up(5)left(4)for(i=[50,90])fwd(-i)yrot(90)M1052(2);
}
//vz3();

module vz4(){
    M1028();
    move([-6.5,0,5.5])zrot(-90)xrot(90)M3031();
    move([-6.5,140,5.5])zrot(-90)xrot(90)M3031();
    up(5)left(5.5)for(i=[0,140])fwd(-i)yrot(90)M1052(2.4);

}
//vz4();

module mont(){
    move([4,-.5,6])xrot(90)yrot(90)M1028();
    move([5,61-.5,6])xrot(90)yrot(-90)vz3();
    move([5,251-.5,6])xrot(90)yrot(90)M1028();
    move([-26,137-.5,146])xrot(-90)yrot(90)vz4();
    move([3.5,190,46])yrot(90)M1073();
    move([3.5,190,146])yrot(90)M1073();
    
    //srouby
    up(5)right(3.5)yrot(-90)for(i=[0,60,150,190,240,250])move([0,i,0])M1052(2);
    up(145)right(3.5)yrot(-90)for(i=[0,60,150,190,240,250])move([0,i,0])M1052(2);
    move([3.5,250,45])yrot(-90)M1052(2);
    move([3.5,250,105])yrot(-90)M1052(2);

}

module prevod1(){
    move([10,-53,26])xrot(-92)M1140(-3,0);
    move([10,-154,28])M2061();
    move([10,-134.5,28])xrot(-90)M1056();
    move([-6,-119,28])yrot(90)M1056();
    move([5,-119,28])zrot(90)M2061();

    move([30,-30,28])xrot(90)M1041();
    move([30,-150,28])M1062();
    move([30,-134.5,28])xrot(-90)M1056();
    move([46,-119,28])yrot(-90)M1056();
    move([35,-119,28])zrot(-90)M2061();

}


module prevod(prv=false){

//horni deska
    up(51){
        M1036();
        move([10,60,1])M1034();
        move([10,70,-1])M1002();
    }

//dolni deska
    zflip()M1036();

//boky
    move([40,95.5,5.5])xrot(90)zrot(90)M1035();
    move([40,-5.5,45.5])xrot(-90)zrot(90)M1035();

//hridele
    move([10,-42,25.5])M2062();
    move([10,8,25.5])xrot(90)M1046();
    move([10,40,25.5])xrot(-90)M2046();
    move([10,82,25.5])xrot(-90)M1046();
    
    move([0,prv?5:0,0]){
    move([30,-20,25.5])M1062();
    move([30,prv?-27.5:-25,26.5])xrot(-90)zrot(45){
        M2041();
        left(10){
            up(12)M1054();
            up(1)M1051();
            down(3)M1051();
        }
        right(10){
            up(12)M1054();
            up(1)M1051();
            down(3)M1051();
        }
        fwd(10){
            down(12)zflip()M1054();
            up(1)M1051();
            down(3)M1051();
        }
        back(10){
            down(12)zflip()M1054();
            up(1)M1051();
            down(3)M1051();
        }
    }
    move([30,-20,25.5])xrot(-90)M1041();
    move([30,6,25.5])xrot(90)M1045();
    move([30,14.5,25.5])xrot(-90)M1045();
    move([30,35,25.5])xrot(-90)M2046();
    }

    //radici kolo
    back(10)zrot(prv?280.2:270.5){
        down(5)xrot(90)M2061();
        M1095();
        up(3)M1095();
        up(6.5){
            fwd(10)M1005();
            back(30)up(4)M2050();
            fwd(10)zflip()M1052(2);
            back(10)zflip()M1052(2);
            back(30)zflip()M1054(1);
            back(30)up(12)M1051();
        }
        up(7.5)M1041();
        up(75)zflip()M2043();
    }
    
    //treci kolo
    back(70)right(10){
        up(28)xrot(90)M2060();
        up(75)zflip()M1040();
        up(49.8)zflip()M2050();
  //      up(42)zflip()M1057();
    }
    prevod1();
    
    //provazek 1090 a pruzina 1092
    up(75){
        right(37)M1090(["left",75,"arczrot",39,36,"move",15]);
        back(62)right(21)zrot(20)xrot(90)M1092(25);
        back(62)right(21)M1090(["left",110,"move",11,"arczrot",8,118.9,"move",50.5,"arczrot",39,205]);
    }
    
    //montaz k sasi
    up(16)fwd(-97)xrot(-90)M1052(2);
    up(16)fwd(-97)right(40)xrot(-90)M1052(2);
    up(46)fwd(7)right(10)xrot(90)M1052(2);
    up(46)fwd(7)right(30)xrot(90)M1052(2);
    
    //sestava sasi
    down(1)for(i=[0,40],j=[0,90])move([i,j,0])zflip()M1052(2);
    
    up(52)for(i=[0,40],j=[0,90])move([i,j,0])M1052(2);

    move([10,60,53])M1052(2);
    move([10,80,53])M1052(3);
    
}

//prevod();

module motor(){
    M1400(true);
    move([0,-9.5,45])xrot(-90)M1040();
    move([15.5,35,5])yrot(90)zrot(180)M3076();
    move([-15,25,5])yrot(-90)M3076();
    move([-40,-9.5,2])xrot(-90)M1043();
    //rubber tie 2309
    move([8,-9.5,46])yrot(-94.5)xrot(90)M2309(["arczrot",8,116.2,"move",58,"arczrot",25.5,213.48,"move",58,"arczrot",8,31]);
    up(.5)for(i=[25,35])back(i){
        left(20)M1052(2);
        right(20)M1052(3.5);
    }
}
//motor();


$fn=30;
yrot(90){
mont();
move([27,148.5,56])yrot(-90)prevod(true);
bort();
up(152.5)zflip()bort();
move([3,255,26])xrot(180)yrot(-90)motor();
}
$vpt=[ 51.74, 125.60, -25.06 ];
$vpr=[70,0,120];
$vpd=650;