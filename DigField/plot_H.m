function plot_H(Hx,Hy,Core)

%Select units. (only mm defined at the moment)
switch Core.Units
  case 'mm'
   xCoord=(0:Core.iW4-1)/Core.NodeDensity;
   yCoord=(0:Core.iH6-1)/Core.NodeDensity;
  otherwise
   xCoord=1:Core.iW4;
   yCoord=1:Core.iH6;
end
[Xpos, Ypos]=meshgrid(xCoord,yCoord);

%% Plot H lines
hold on;
quiver(Xpos,Ypos,Hx,Hy);
hold on;
plot_coreframe(Core);
axis([0 (Core.iW4-1)/Core.NodeDensity 0 (Core.iH6-1)/Core.NodeDensity])
xlabel('Width');
ylabel('Height');
title('Directional vectors of H');

% Plot magnitude of H
H=sqrt(Hx.^2+Hy.^2);
figure;
plot_3Dvalues(H,Core,'Magnitude of H [A/m]');  
