//include <openscad-merkur/merkur.scad>
include <openscad-merkur/merkur_bosl2.scad>
include <lib/prevody.scad>
include <lib/sasi.scad>
//include <lib/stylus.scad>
include <lib/vrut29-bosl2.scad>
//include <lib/vrut29.scad>


prevod09(prevod=2);

sasi800();

module hr_pom(){
    render()hr_sv3(pre=false);
}

hr_sv3(pre=true);
color(c=[.9,.5,.5,.2])hr_pom();


$fn=50;
$vpt=[ -6.61, -4.66, 26.97 ];
$vpr=[55,0,134];
$vpd=900;


