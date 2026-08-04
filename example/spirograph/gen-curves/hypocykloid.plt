#gnuplot
# generator hypocykloidy, hypocykloids generator

set terminal png size 600,600 

#radius, small radius (R/r cykloids on revolution), generation radius, angle (revolutions)
R=100.0; r=2.0; p=70.0; s=90


set output "hypocykloids.png"

set size ratio -1
set nokey
set noxtics
set noytics
set noborder
set parametric
unset autoscale
set xrange [-300:300]
set yrange [-300:300]

#
x(t)=(R-r)*cos(t) + p*cos((R-r)*t/r)
y(t)=(R-r)*sin(t) - p*sin((R-r)*t/r)
#
set samples 2001
plot [t=0:s*pi/180] x(t),y(t) lc "black" lw 3
