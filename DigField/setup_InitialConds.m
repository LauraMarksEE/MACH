function [Anew]=setup_InitalConds(A,muN,Core);

% Calculate the initial conditions for the 
% top and bottom boundaries of the core
% according to Biot-Savart
Anew=A;

NI=Core.nTurns*Core.I;

if Core.Ideal
   disp(sprintf('Initialising for an ideal core'));
   Anew(Core.iH1:Core.iH2-1,Core.iW1:Core.iW3-1)=-NI/2; 
   Anew(Core.iH2:Core.iH3-1,Core.iW1:Core.iW2-1)=-NI/2;
   Anew(Core.iH4:Core.iH5,Core.iW1:Core.iW3-1)=+NI/2; 
else
   disp(sprintf('Initialising for a non-ideal core')); 
   maxRow=size(A,1);
   Anew(Core.iH1,Core.iW1:Core.iW3-1)=-NI/2; 
   Anew(Core.iH5,Core.iW1:Core.iW3-1)=+NI/2; 

end

