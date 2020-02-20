function plot_B(Bx,By,Core,varargin)

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

% Get magnitude of B
B=sqrt(Bx.^2+By.^2);

% Plot B magnitude along the experimental test line
Test_index=round((Core.iH3-1+Core.iH4)/2);
plot(xCoord,B(Test_index,:));
xlabel('Width [m]');
ylabel('B [T]');
title('B along the middle of the airgap [T]');
grid on;
