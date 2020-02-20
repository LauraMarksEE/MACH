function plot_f(p,i);

global gamma ph pha phna r1 r2;

plot_a(0,0.8*i*exp(j*gamma(p)),p)
N=8;
nf=round(N*i);
if (nf~=0)
if (nf>0)
	for k=0:(nf-1)
		theta=(1-cos(k/nf*pi/2))*pi/2;
		plot_a(r1*exp(j*(theta+gamma(p))),r2*exp(j*(theta+gamma(p))),p)
		plot_a(r1*exp(j*(-theta+gamma(p))),r2*exp(j*(-theta+gamma(p))),p)
		plot_a(r2*exp(j*(pi+theta+gamma(p))),r1*exp(j*(pi+theta+gamma(p))),p)
		plot_a(r2*exp(j*(pi-theta+gamma(p))),r1*exp(j*(pi-theta+gamma(p))),p)
	end
else
   nf=abs(nf);
   for k=0:(nf-1)
		theta=(1-cos(k/nf*pi/2))*pi/2;
		plot_a(r2*exp(j*(theta+gamma(p))),r1*exp(j*(theta+gamma(p))),p)
		plot_a(r2*exp(j*(-theta+gamma(p))),r1*exp(j*(-theta+gamma(p))),p)
		plot_a(r1*exp(j*(pi+theta+gamma(p))),r2*exp(j*(pi+theta+gamma(p))),p)
		plot_a(r1*exp(j*(pi-theta+gamma(p))),r2*exp(j*(pi-theta+gamma(p))),p)
	end   
end
end
return