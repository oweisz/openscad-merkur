module deska(full=true){
  ha=3.05;
  color("brown")translate([0,0,-ha/2])difference(){
    cylinder(h=ha,d=225);
    if(full)for(i=[0:360/56:360])rotate([0,0,i])translate([105.5,0,-.1])cylinder(h=ha+.2,d=9);
    else;
  }
}

$fn=100;deska();

//https://www.expresslaser.cz/dna-na-hackovane-kosiky/dno-na-hackovany-kosik-kruh-22-5cm/