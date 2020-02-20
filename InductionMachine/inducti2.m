% File inducti2.m
% Written November 1997 by Tim Green
% Edited December 1999 by Dave Sandells

% Calculates stator current and torque for a range
% of rotor speeds using standard steady-state model.
% Uses matrix operators to avoid for loop.

% Dec 1999 edits allow inputs from command line execution of 
% the function and plots acquired data too.

function inducti2(RS, XS, RI, XM, RR, XR, Vline, speed, torque);

%***********************************************%
% End of parameters section                     %
%***********************************************%

K=100;

p=2;         %Number of pole-pairs (ie 4 poles)
we=2*pi*50;  %Electrical supply frequency for 50Hz
ws=we/p;     %Synchronous speed
Vphase=Vline/sqrt(3);  %Phase voltage

VS=Vphase*ones(1,K);          %array of stator voltage
wr=linspace(1450*2*pi/60,1550*2*pi/60);       %array of rotor speed
s=linspace(0.035, -0.035);		%array of slip

%Construct impedance of each branch and find total
ZR=RR./s+i*XR;            %rotor branch impedance
ZM=(RI*i*XM)/(RI+i*XM)*ones(1,K);  %RI and XM are in parallel
                          %magnetising branch impedance  
ZS=(RS+i*XS)*ones(1,K);   %stator branch impedance
ZT=ZS + ZM.*ZR./(ZM+ZR);  %total impedance

IS=VS./ZT;                %stator current
VAG=VS-IS.*ZS;	          %air-gap voltage
IR=VAG./ZR;               %rotor current
T=real(3*(IR.*conj(IR))*RR./s/ws);  %torque

nr=60*wr/2/pi;

figure;
plot(nr,T,'bx-');
axis([1450 1550 -40 40]);
hold;
plot(speed,torque,'ro-');
title('Induction Motor Torque/Speed Curve');
xlabel('Rotor Speed <rpm/s>');
ylabel('Torque <Nm>');
text(1470,35,'x - Model Results');
text(1470,32,'o - Acquired Data');

