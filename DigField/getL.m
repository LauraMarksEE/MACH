function [L]=getL(Core,Bx,By)
   
% Define the test line in the middle of the airgap
Test_index=round((Core.iH3-1+Core.iH4)/2);

% Get magnitude of B and integrate it over the test line
B=sqrt(Bx.^2+By.^2);
integral_B=sum(B(Test_index,:))/Core.NodeDensity;
%% Calculate Phi 
Phi=integral_B*Core.Depth;
% Calculate inductance L= (N Phi)/I
L=Phi*Core.nTurns/Core.I;

