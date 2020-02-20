function plot_i(p,i)

global gamma ph c r1 r2 r3 col;

plot(r1*c,ph(4))
hold on
plot(r2*c,ph(4))
r=0.08*abs(i);
w=0.2;
if i>=0
   o=pi/2;
else
   o=-pi/2;
end
	plot((0.1*c+r3*exp(j*(gamma(p)+o))),ph(4))
	plot((0.1*c+r3*exp(j*(gamma(p)-o))),ph(4))
	H=fill(real(0.8*r*c+r3*exp(j*(gamma(p)+o))),imag(r*c+r3*exp(j*(gamma(p)+o))),ph(p));
   set(H,'edgecolor',col(p,:));
   H=fill(real(r3*exp(j*(gamma(p)-o))+[-r-j*r*w,-r+j*r*w,+r+j*r*w,+r-j*r*w]),imag(r3*exp(j*(gamma(p)-o))+[-r-j*r*w,-r+j*r*w,+r+j*r*w,r-j*r*w]),ph(p));
   set(H,'edgecolor',col(p,:));
   H=fill(real(r3*exp(j*(gamma(p)-o))+[-j*r-r*w,-j*r+r*w,+j*r+r*w,+j*r-r*w]),imag(r3*exp(j*(gamma(p)-o))+[-j*r-r*w,-j*r+r*w,+j*r+r*w,+j*r-r*w]),ph(p));
   set(H,'edgecolor',col(p,:));
return
