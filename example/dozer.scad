//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>

module sasi(){
    zflip()M1028();
    right(90)yrot(180)M1028();
    back(20)zrot(-90)M1019();
    back(140)zrot(-90)M1075();
    //srouby
    for(i=[20,80,140],j=[0,90])move([j,i,-1])zflip()M1052(2);
}
//sasi();

module podvozek(){
    right(30)up(1)zrot(90)M2031();
    //srouby
    down(1)zflip()M1052(3);
    right(30)zflip()M1052(2);
    left(15)back(95)up(16)xrot(-90)zrot(-90){
        M1400();
        left(10)back(35)down(0)xrot(180)M3076();
        left(10)back(25)up(30)M3076();
        //srouby
        back(25)down(5)yrot(-90)for(i=[0,10],j=[0,40])move([j,i,16.5])M1052(2);
    }
    //hridel
    right(40)up(18)zrot(90)M2061();
    //kola
    left(15)up(18)yrot(90)M1050();
    left(25)up(18)yrot(90)M1042();
    left(35)up(18)yrot(90)M1042();
    back(140)left(24)up(16)yrot(90)M1042();
    back(140)left(34)up(16)yrot(90)M1042();
    //pas
    down(3)left(17)zrot(90)xrot(87)M1084(["move",140,"arczrot",21,180,"move",140,"arczrot",21,180]);
}
//podvozek();

module pojezd(){
    zrot(180){
        sasi();
        podvozek();
        right(90)xflip()podvozek();
    }
}
//pojezd();

module rbok(){
    yrot(90)M1015();
    left(2)back(145)down(20.5)xrot(-29.5)zrot(182)yrot(90)M2006();
    back(150)down(40)xrot(15){left(1)yrot(-90)M2037();
    up(35)back(6)right(4.5)xrot(90)zrot(-90)M1102("silver");
    down(7)back(35)right(4.5)zrot(-90)M1102("silver");
    }
    //srouby
    back(110)left(1.6)yrot(-90)M1052(2);
    back(140)left(2)yrot(-90)M1052(3);
    back(142)down(10.5)left(2)yrot(-90)M1052(2);
    back(144.5)down(20.5)left(3)yrot(-90)M1052(2);
    back(179)down(32.5)left(2)yrot(-90)M1052(2);
    back(188.8)down(30)left(2)yrot(-90)M1052(2);
}
//rbok();


//M2073();
//M2075();
module M207xR(x=100,le=38){
    point=[[0,0],[le,0],[le,0],[le,le]];
    //debug_bezier(point,N=len(point)-1);
    path=bezier_curve(point);
    echo("BEZIER:", bezier_length(point));
    difference(){    
        linear_extrude(height=x)stroke(path,width=.8);
        for(i=[5:10:x-5])up(i)path_copies(path,spacing=10)sphere(d=3.5);
    }
}

module radl1(alpha=0){
    xrot(alpha){
        right(160)xflip()rbok();
        rbok();
        back(185.5)right(150)down(37)xrot(15)zrot(90){
            M1015();
            down(.5)zflip()M1052(3.6);
            back(40)zflip()M1052(3.1);
            back(50)zflip()M1052(3.1);
            back(140)down(.5)zflip()M1052(3.6);
        }
        back(146)right(150)down(5)xrot(15)back(1)zrot(90)yrot(90){
            M1015();
            up(1.5)M1052(3.2);
            back(40)up(1.7)M1052(1.9);
            back(50)up(1.7)M1052(1.9);
            back(140)up(1.5)M1052(3.2);
        }
        le=43;
        right(5)back(147)xrot(15){
            left(.25)yrot(90)M207xR(100,le);//2075
            right(100.25)yrot(90)M207xR(50,le);//2073
        }
        left(5)zrot(-90)M2062();
        right(11)yrot(-90)zrot(30)M2047();
        right(11)yrot(90)M2050();
        back(20)right(1)yrot(90)M2050();
        back(20)right(11)yrot(90)M1054(11.5);
        right(149)yrot(90)zrot(30)M2047();
        right(141)yrot(90)M2050();
        back(20)right(151)yrot(90)M2050();
        back(20)right(149)yrot(90)zflip()M1054(11.5);
    }
}
//radl1(0);

module zdvih(alpha=0){

    M1036();
    right(20)up(1)M1052(2);
    back(90)right(20)up(1)M1052(2);
    back(10)right(45.5)up(5)zrot(90)xrot(90){
        M1017();
        up(1)for(i=[0,20],j=[0,30])move([i,j,0])M1052(2);
    }
    back(60)right(45.5)up(5)zrot(90)xrot(90){
        M1017();
        up(1)for(i=[0,20],j=[0,30])move([i,j,0])
        M1052(2);
     }
     up(40)right(40)yrot(180){
        right(1)M1027();
        for(i=[0,20,70,90])back(i)down(1)zflip()M1052(2);
        back(100){
            xrot(180)M3037();
            back(6)right(30)down(5)zrot(90)yrot(90){    
                M1005();
                back(20)up(1.3)M1052(2);
            }
        }
        fwd(10){
            yrot(180)M4037();
            fwd(7)right(30)down(5)zrot(90)yrot(90){
                M1005();
                back(20)zflip()M1052(2);
            }
        }
    }
    //motor
    back(65)right(10)up(1){
        zrot(180)M1400();
        fwd(15)right(15)up(6)zrot(180)yrot(-90)M3076();
        up(45){
            back(8)xrot(90)M2050();
            back(29)xrot(90)M1049();
            fwd(20)xrot(90)M1049();
            back(5)M2060();
            back(53)xrot(90)M1046();
            fwd(95)M1061();
            fwd(93)xrot(-90)M1046();
        }
    }
    fwd(35)up(45)right(50)zrot(90)radl1(alpha);
}
//zdvih();

module dozer(angle=-15){
    up(1)fwd(30)zrot(-90)zdvih(alpha=angle);
    yrot(180)pojezd();
}
$fn=30;
dozer(-15);
$vpt=[ 53.56, -21.26, -4.99 ];
$vpr=[65,0,130];
$vpd=580;