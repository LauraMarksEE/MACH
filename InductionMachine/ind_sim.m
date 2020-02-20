% ind_sim.m
% Written October 1998 by T Green
% Animates images of flux distributions in air-gap of induction machine
% Run script calc_ind_sim.m to record images before running this script
% Only phase numbers of 1 or 3 are handled correctly - other answers not trapped!

display('Please execute calc_ind_sim.m first, to set up variable parameters');

clf
Hf1=gcf;
set(Hf1,'Position', [50 100 900 600]);

n=input('Number of Phases? <1 or 3>');
if n==1
   Mi=Mi1;
else
   Mi=Mi3;
end

[r,c]=size(Mi);

subplot(2,3,4)
axis([0 0.02 -1.2 1.2])
title('Current Waveform')
subplot(2,3,1)
axis([-1.5 1.5 -1.5 1.5])

if n==1
   title('Flux Distribution')
else
   title('Flux (Phase A)')
	subplot(2,3,2)
	axis([-1.5 1.5 -1.5 1.5])
   title('Flux (Phase B)')
	subplot(2,3,3)
	axis([-1.5 1.5 -1.5 1.5])
   title('Flux (Phase C)')
	subplot(2,3,6)
	axis([-1.5 1.5 -1.5 1.5])
	title('Total Flux')
end

for l=1:20
	for k=1:c
		subplot(2,3,4)
      movie(Mi(:,k))
		subplot(2,3,1)
		movie(Mr(:,k))
	   if n==3
		   subplot(2,3,2)
			movie(My(:,k))
		   subplot(2,3,3);
	   	movie(Mb(:,k))
			subplot(2,3,6);
	      movie(Mft(:,k))
      end
	end
end