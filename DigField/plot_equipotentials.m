function plot_equipotentials(Vm,Core)

%Select units. (only mm defined at the moment)
switch Core.Units
  case 'mm'
   xCoord=(0:Core.iW4-1)/Core.NodeDensity;
   yCoord=(0:Core.iH6-1)/Core.NodeDensity;
  otherwise
   xCoord=1:Core.iW4;
   yCoord=1:Core.iH6;
end
[Xpos Ypos]=meshgrid(xCoord,yCoord);

%% Plot equipotentials
contour(Xpos,Ypos,Vm,15);
hold on;
plot_coreframe(Core);
title('Magnetic equipotential contours');
