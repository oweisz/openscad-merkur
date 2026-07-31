


module arrow1(lenght=30,a1=true,a2=true){
  if(a1)cylinder(h=5,d1=0,d2=5);
  translate([0,0,a1?5:0])cylinder(h=lenght-(a1?5:0)-(a2?5:0),d=1);
  if(a2)translate([0,0,lenght-5])cylinder(h=5,d1=5,d2=0);
}


module arrow2(xlenght=30,ylenght=30,xa1=true,xa2=true,ya1=true,ya2=true){
  rotate([90,0,0])translate([0,0,-ylenght/2])arrow1(ylenght,ya1,ya2);
  rotate([0,90,0])translate([0,0,-xlenght/2])arrow1(xlenght,xa1,xa2);

}



//arrow1(40,true,false);
//arrow2(50,40,true,false,false,true);
