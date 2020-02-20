function plot_vec(i)
global gamma ph;
hold on
old=0;
for phase=1:3
	inc=0.5*i(phase)*exp(j*gamma(phase));
   plot_a(old,(old+inc),phase)
	old=old+inc;
end
plot_a(0, old, 4,':')
return