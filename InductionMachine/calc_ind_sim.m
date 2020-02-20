global gamma c ph col r1 r2 r3;
% calc_ind_sim.m
% Written October 1998 by T Green
% Draws images of flux distributions in air-gap of induction machine
% {Probably too slow to form useful animation}
% Animate these images later with script ind-sim.m
% Uses plot_i, plot_f

n_frames=36;
seq=-1;
clear Mi1 Mi3 Mi Mft Mr Mb My;
r1=0.9;
r2=1.1;
r3=1.25;
phi_r=0;
phi_y=-seq*2*pi/3;
phi_b=seq*2*pi/3;
gamma_r=1e-8;
gamma_y=+2*pi/3;
gamma_b=-2*pi/3;
gamma=[gamma_r,gamma_y,gamma_b];
ph=['r';'y';'c';'w'];
col=[1,0,0;1,1,0;0,0.86,0.86;0,0,0];
midgrey=[0.5,0.5,0.5];
Hf1=gcf;
set(Hf1,'Position', [50 100 900 600]);
n=100;
c=exp(j*(0:n)/n*pi*2);
f=50;

nt=100;
t=(0:nt)/nt/f;
ir=cos(2*pi*f*t+phi_r);
iy=cos(2*pi*f*t+phi_y);
ib=cos(2*pi*f*t+phi_b);
i=[ir;iy;ib];

%current for three phase case
subplot(2,3,4)
cla
plot(t,i(1,:),ph(1));
axis([0 0.02 -1.2 +1.2])
hold on
plot(t,i(2,:),ph(2));
plot(t,i(3,:),ph(3));

%current for single phase case
subplot(2,3,5)
cla
plot(t,i(1,:),ph(1));
axis([0 0.02 -1.2 +1.2])
hold on

for l=0:(n_frames-1);
   
   t=1/f*l/n_frames;
   ir=cos(2*pi*f*t+phi_r);
   iy=cos(2*pi*f*t+phi_y);
   ib=cos(2*pi*f*t+phi_b);
   i=[ir,iy,ib];
   
   H=subplot(2,3,4);
   set(H,'color',midgrey)
   title('Current Waveforms')
   plot(t,i(1),[ph(1),'*']);
	plot(t,i(2),[ph(2),'*']);
	plot(t,i(3),[ph(3),'*']);
   Mi3(:,(l+1))=getframe;
   
   H=subplot(2,3,5);
   set(H,'color',midgrey)
   title('Current Waveform')
   plot(t,i(1),[ph(1),'*']);
   Mi1(:,(l+1))=getframe;

   phase=1;
	H=subplot(2,3,phase);
   cla
   set(H,'color',midgrey)
   title('Phase-A Flux')
   plot_i(phase,i(phase));
   plot_f(phase,i(phase));
   axis([-1.5 1.5 -1.5 1.5])
   Mr(:,(l+1))=getframe;
   
   phase=2;
	H=subplot(2,3,phase);
   cla
   set(H,'color',midgrey)
   title('Phase-B Flux')
   plot_i(phase,i(phase));
   plot_f(phase,i(phase));
   axis([-1.5 1.5 -1.5 1.5])
   My(:,(l+1))=getframe;
   
   phase=3;
	H=subplot(2,3,phase);
   cla
   set(H,'color',midgrey)
   title('Phase-C Flux')
   plot_i(phase,i(phase));
   plot_f(phase,i(phase));
   axis([-1.5 1.5 -1.5 1.5])
   Mb(:,(l+1))=getframe;
   
	H=subplot(2,3,6);
   cla
   set(H,'color',midgrey)
   title('Total Flux')
	plot_i(1,i(1));
   plot_i(2,i(2));
   plot_i(3,i(3));
   axis([-1.5 1.5 -1.5 1.5])
   plot_tf(seq*2*pi*f*t);
   plot_vec(i);
   Mft(:,(l+1))=getframe;
   
   %H=subplot(2,3,6);
   %set(H,'color',[0.5,0.5,0.5])
   %cla
   %plot_vec(i);
   %title('Flux Vectors')
	%axis([-1.6 1.6 -1.6 1.6])
	%Mvec(:,(l+1))=getframe;
end