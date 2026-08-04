#gnuplot
#generator vlnovky, sinewave generator

#radius, amplitude, frequency, angle
r=200; a = 0.1; f = 20; s = 360

set terminal png size 600, 600
set output "sinewave.png"

set nokey
set noborder
set noxtics
set noytics
set noraxis
set nortics
set notitle

unset autoscale
set xrange [-300:300]
set yrange [-300:300]
set size ratio -1


x(t)=r*sin(t) *(1+a*sin(f*t))
y(t)=r*cos(t) *(1+a*sin(f*t))


set parametric

set samples 2001
plot [t=0:s*pi/180] x(t),y(t) lc "black" lw 3
