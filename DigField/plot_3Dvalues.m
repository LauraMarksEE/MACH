function plot_3Dvalues(Value,Core,title_label)

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

mesh(xCoord,yCoord,Value);
view(-20,22);
xlabel('Width [m]');
ylabel('Height [m]');
title(title_label);
