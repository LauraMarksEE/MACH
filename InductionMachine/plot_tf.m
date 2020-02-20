function plot_tf(a)
global r1 r2 ph;
N=8;
p=4;
a=a+1e-6;
	for k=0:(N-1)
		theta=(1-cos(k/N*pi/2))*pi/2;
		plot_a(r1*exp(j*(theta+a)),r2*exp(j*(theta+a)),p)
		plot_a(r1*exp(j*(-theta+a)),r2*exp(j*(-theta+a)),p)
		plot_a(r2*exp(j*(pi+theta+a)),r1*exp(j*(pi+theta+a)),p)
		plot_a(r2*exp(j*(pi-theta+a)),r1*exp(j*(pi-theta+a)),p)
	end
return