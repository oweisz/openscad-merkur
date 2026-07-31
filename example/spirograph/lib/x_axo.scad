axo_z=[0,0,0];
axo_x=[0,90,0];
axo_y=[90,0,0];

module axo(axo_len = 1, rot=axo_x, dia=1){
  rotate(rot)for(i=[0:axo_len/2])translate([0,0,i*2])cylinder(h=1,d=dia);
}  

//axo(5,axo_z);