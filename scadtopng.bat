rem --imgsize x,y x,x -- podle dostupne graficke pameti, vetsi cislo lepsi rozliseni 

rem OPENSCADPATH - no unicode https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Libraries
rem set OPENSCADPATH="M:\Dokumenty\OpenSCAD\library
rem "c:\program files\openscad-2025\openscad.exe" -o "%~n1.png" --imgsize 3000,1500 --projection p --enable all --colorscheme White --backend Manifold --summary all "%1"


"c:\program files\openscad\openscad.exe" -o "%~n1.png" --imgsize 3000,1500 --projection p --enable all --colorscheme White --summary all "%1"
