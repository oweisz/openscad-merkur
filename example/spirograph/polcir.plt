set terminal png size 600, 600
set polar
set output "tm1.png"

set nokey
set noborder
set noxtics
set noytics
set noraxis
set nortics
set key noautotitle
set notitle

set size ratio -1

set trange [0:2*pi]
set samples 2001
plot 1 lc "black", 2 lc "black"
