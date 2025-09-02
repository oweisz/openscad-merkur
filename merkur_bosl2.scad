/* díly Merkur pro OpenSCAD
 * pieces of Merkur for OpenSCAD
 * https://openscad.org
 * https://www.merkurtoys.cz
 * http://merkur.kreteni.cz
 *
 * (c) 2020-2026 Ondrej Weisz
 * no licensed: free for any use
 *
 * modul Merkuru
 * Merkur module 10 mm, screw, nuts M3.5, hub wheel and gear - M3x4
 * or worm M4x4. Oldest version use unc screw 
 * strip zinc Nx10 x 10.0 x 1, strip color Nx10 x 10.3 x 1,3
 *
 * použití: zkopíruj soubor do knihovní složky
 * use: copy file to library directory use to OpenSCAD eg:
 * $HOME/Documents/OpenSCAD/library/merkur
 * 
 * do souboru scad vlož řádku
 * insert to file scad include line:
 * include <merkur/merkur.scad>
 * 
 *  install library BOSL2
 *  instaluj knihovnu BOSL2
 *  https://github.com/BelfrySCAD/BOSL2.git
 *
 */

////  modules and function (moduly a funkce)
include <merkur_utils1.scad>

////  basic pieces (základní díly)
include <merkur_basic.scad>

////  comment or uncomment (zakomentuj, oskomentuj): include <merkur_wheel0.scad> | include <merkur_wheel1.scad* 
////  simplest: screw, wheel, gears, etc...
////  zjednodušené: šrouvy, kola, ozubená kola atd...
//    include <merkur_wheel0.scad>
////  wheel1 is the same as wheel0. For detailed render use BOSL2: screw, wheel, gears, etc...
////  plné vykreslení s použitím knihovny BOSL2 (werry slow - velmi pomalé!)
include <merkur_wheel1.scad>

////  piseces for TODO (díly pro dodělání)
////  if create new pieces move M#### to merkur_basic or merkur_wheel0 and  wheel1
include <merkur_other.scad>

//    LOGO for use
//    B2_logo();
module B2_logo(){
translate([-80,2.5,0])rotate([0,0,-17.5])M1006("silver");translate([-65,50,2.6])M1052(2.5);translate([-65,70,2.6])M1052(2.5);translate([-55,40,1.2])M3038();translate([-55,80,3.9])M1052(2.5);translate([-55,90,2.4])M2041("silver");translate([-45,70,2.6])M1052(2.5);translate([-45,50,2.6])M1052(2.5);translate([-30,2.5,0])rotate([0,0,17.5])M1006("silver");translate([-15,70,0])rotate([0,0,90])M1009();translate([-10,15,6])M1038();translate([0,15,7])M1052(3.5);translate([0,15,3.8])rotate([5,0,-135])M1037("silver");translate([0,25,7])M1052(2.5);translate([0,25,3.8])M1026();translate([0,35,7])M1052(2.5);translate([0,45,6])rotate([0,180,0])M1041();translate([30,2.5,0])rotate([0,0,-17.5])M2006();translate([35,50,2.4])M1017();translate([35,90,5])M1052(2.5);translate([35,90,3.6])rotate([0,0,125])M1005("red");translate([45,50,4])M1053(4);translate([45,90,5])M1052(2.5);translate([45,90,3.6])M1002();translate([45,100,6.3])M1052(2.5);translate([45,110,4.8])M2041("silver");translate([55,90,5])M1052(2.5);translate([55,90,3.6])rotate([0,0,-150])M1005("red");translate([60,2.5,1.2])rotate([0,0,17.5])M2006();$vpt=[-67.12, 64.47, 2.90];$vpr=[12,0,0];$vpd=400;$fn=30;
}

