function show_physicalproblem(muN,Core,varargin)

   
switch Core.Units
  case 'mm'
   xCoord=(0:size(muN,2)-1)/Core.NodeDensity;
   yCoord=(0:size(muN,1)-1)/Core.NodeDensity;
  otherwise
   xCoord=1:size(muN,2);
   yCoord=1:size(muN,1);
end


maxMu=max(max(muN));
muN_mm=muN/maxMu*0.2*max(xCoord);
mH=mesh(xCoord,yCoord,muN_mm);
set(mH,'linestyle','none','marker','+','MarkerFaceColor','flat','MarkerSize',4);
xlabel('Width [m]');
ylabel('Height [m]');
title('Physical problem mesh');
view(0,90); 
