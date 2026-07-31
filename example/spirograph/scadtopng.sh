#!/bin/bash

# --imgsize x,y x,x -- podle dostupne graficke pameti, vetsi cislo lepsi rozliseni 

# OPENSCADPATH - no unicode https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Libraries
# OPENSCADPATH="M:\Dokumenty\OpenSCAD\library
# "c:\program files\openscad-2025\openscad.exe" -o "%~n1.png" --imgsize 3000,1500 --projection p --enable all --colorscheme White --backend Manifold --summary all "%1"

#echo $1

openscad-nightly -o "$1.png" --imgsize 2000,1000 --projection p --colorscheme White --csglimit 200000 "$1"
