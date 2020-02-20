% File inducti.m
% Written November 1997 by Tim Green
% Edited December 1999 by Dave Sandells

% Calculates stator current and torque for a range
% of rotor speeds using standard steady-state model.
% Uses matrix operators to avoid for loop.

% Dec 1999 edits allow inputs from command line execution on the function.

function inducti(RS, XS, RI, XM, RR, XR, Vline);

%***********************************************%
% End of parameters section                     %
%***********************************************%


p=2;         %Number of pole-pairs (ie 4 poles)
we=2*pi*50;  %Electrical supply frequency for 50Hz
ws=we/p;     %Synchronous speed
Vphase=Vline/sqrt(3);  %Phase voltage

K=250;  %number of points at which torque will be calculated

VS=Vphase*ones(1,K);         %array of stator voltage
wr=(0:(K-1))/K*ws;        %array of rotor speed
s=(ones(1,K)*ws-wr)/ws;   %array of slip reducing from 1 to 0

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

%deal with s=0 (RR/s=inf) condition as a special case
VS(K+1)=Vphase;
wr(K+1)=ws;  
IS(K+1)=VS(K+1)/((RS+i*XS)+(RI*i*XM)/(RI+i*XM));
VAG(K+1)=VS(K+1)-IS(K+1)*(RS+i*XS);
IR=[IR 0];
T=[T 0];

Pmech=T.*wr;                %mechanical ouput power  
Pelec=real(3*VS.*conj(IS)); %electrical input power
eff=100*Pmech./Pelec;       %efficency
nr=60*wr/2/pi;

figure;
plot(nr,T,'r');
title('Induction Motor Torque/Speed Curve');
xlabel('Rotor Speed <rpm/s>');
ylabel('Torque <Nm>');

figure;
plot(nr,T,'b');
axis([1400 1500 0 40]);
title('Induction Motor Torque/Speed Curve');
xlabel('Rotor Speed <rpm/s>');
ylabel('Torque <Nm>');
