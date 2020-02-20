function plot_a(b,e,p,l);
global ph;
if nargin<4
   l='-';
end
r4=0.1;
plot([b,e],[ph(p),l])
plot([e+r4*exp(j*(angle(e-b)+7/8*pi)),e,e+r4*exp(j*(angle(e-b)-7/8*pi))],ph(p));
return