
include <BOSL2/std.scad>
include <BOSL2/screws.scad>

module vrut_29(){
  down(.8)screw("#4-40,5", head="pan", drive="phillips",length=3.7);
}
