set terminal png size 600,600 
      set output "tm3.png"
       set size ratio -1
        set nokey
	 set noxtics
	  set noytics
	   set noborder
	    set parametric
	    #
	     x(t)=(R-r)*cos(t) + p*cos((R-r)*t/r)
	      y(t)=(R-r)*sin(t) - p*sin((R-r)*t/r)
	      #
	X(t)=sin(t)*(D+E*D*sin(F*t))
	Y(t)=cos(t)*(D+E*D*sin(F*t))

	       R=100.0; r=2.0; p=70.0
	       D=200; E=1; F=17
	        set samples 2001
		#
		 plot [t=0:2*pi] x(t)+X(t),y(t)+Y(t) lc "black"
		 #, x(t),y(t) lc "red",  X(t),Y(t) lc "green"
