#gnuplot
#generator slozeneho pohybu - hypocykloida + sinusova vlna
#hypocykloids + sinewave generator

set terminal png size 600,600 
set output "combine.png"
#angle
s=160
#hypocykloid
#radius, small radius (R/r cykloids on revolution), generation radius
R=200.0; r=20.0; p=70.0
#sinewave
#radius, amplitude, frequency (n waves on revolution)
D=20.0; E=1; F=70



set size ratio -1
set nokey
set noxtics
set noytics
set noborder

unset autoscale
set xrange [-300:300]
set yrange [-300:300]


set parametric
# hypocykloida
x(t)=(R-r)*cos(t) + p*cos((R-r)*t/r)
y(t)=(R-r)*sin(t) - p*sin((R-r)*t/r)
# sinusovka
X(t)=sin(t)*(D+E*D*sin(F*t))
Y(t)=cos(t)*(D+E*D*sin(F*t))
#
#
set samples 2001
#
plot [t=0:s*pi/180] x(t)+X(t),y(t)+Y(t) lc "black" lw 3
#debug
#plot [t=0:s*pi/180] x(t),y(t) lc "red",  X(t),Y(t) lc "green"
