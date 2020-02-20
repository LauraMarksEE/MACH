function plot_coreframe(Core,varargin)

 
xFrame1=[Core.iW1 Core.iW1 Core.iW2-1 Core.iW2-1 Core.iW3-1 Core.iW3-1 Core.iW1];
yFrame1=[Core.iH1 Core.iH3-1 Core.iH3-1 Core.iH2-1 Core.iH2-1 Core.iH1 Core.iH1];
xFrame2=[Core.iW1 Core.iW1 Core.iW3-1 Core.iW3-1 Core.iW1];
yFrame2=[Core.iH4 Core.iH5 Core.iH5 Core.iH4 Core.iH4];

xFrame1=(xFrame1-1)/Core.NodeDensity;
yFrame1=(yFrame1-1)/Core.NodeDensity;
xFrame2=(xFrame2-1)/Core.NodeDensity;
yFrame2=(yFrame2-1)/Core.NodeDensity;

LH=patch(xFrame1,yFrame1,'k');
set(LH,'facecolor','none');
hold on;
LH=patch(xFrame2,yFrame2,'k');
set(LH,'facecolor','none');
xlabel('Width [m]');
ylabel('Height [m]');
