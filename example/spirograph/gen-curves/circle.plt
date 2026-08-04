# gnuplot
# generator kruhu (circle generator)

#radius, angle
r=200; s=130

set terminal png size 600,600



set output "circle.png"


set nokey
set noborder
set noxtics
set noytics
set notitle
unset autoscale
set xrange [-300:300]
set yrange [-300:300]

x(t)=r*sin(t)
y(t)=r*cos(t)

set size ratio -1

set parametric

set trange 
set samples 2001
plot [t=0:s*pi/180] x(t),y(t) lc "black" lw 3
