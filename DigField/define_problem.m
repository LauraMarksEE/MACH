function [A,muN,Core,FD]=define_problem(varargin)
%%
%% This function defines the following:
%%     + Core dimensions
%%     + Material properties
%%     + Finite difference method parameters
%%     
%% The return variables are:
%%   A(x,y)      Magnetic potential value at coordinates (x,y) [Wb/m] 
%%   muN(x,y)    Permeability [H/m] of the 1st cuadrant of the molecule
%%               at which node in (x,y) is the middle.
%%   Core        An structure with the core physical dimensions and excitation
%%   FD          An structure with the finite difference method parameters   
%%               

% Define core physical dimensions (in metres)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Height1=0.014; % [m]
Height2=; % [m]
Height3=; % [m]
Height4=0.014; % [m]
Width1=;  % [m]
Width2=;  % [m]
Depth=;   % [m]

% Define material properties
% ~~~~~~~~~~~~~~~~~~~~~~~~~~
IdealCore=1;               % Defines if the iron core is ideal (=1) or not (=0)
mu_air = pi*4e-7;          % Permeability of air [H/m]
mu_relative = 1e3;         % Relative permeability of iron [adimensional]
mu_iron=mu_air*mu_relative;% Don't change this line

% Define finite difference method parameters
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NumIterations=;  % Number of iterations to perform
NodeDensity=;   % Num nodes per meter

% Define excitation
% ~~~~~~~~~~~~~~~~~
I=;           % Excitation current [A]
nTurns=;    % Number of turns in the coil

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%                  S T O P
%      Do not change anything below this line
%  (unless,of course, you know what you are doing)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Define aux variables
Core_height=Height1+Height2+Height3+Height4;
Core_width=Width1+Width2;

%Define surrounding air
AirW1=0.1*(Width1+Width2);
AirW2=0.1*(Width1+Width2);
AirH1=0*(Width1+Width2);
AirH2=0*(Width1+Width2);

iH1=1+round(AirH1*NodeDensity);     % Auxiliary variable
iH2=iH1+round(Height1*NodeDensity); % Aux variable
iH3=iH2+round(Height2*NodeDensity); % Aux variable
iH4=iH3+round(Height3*NodeDensity); % Aux variable
iH5=iH4+round(Height4*NodeDensity); % Aux variable
iH6=iH5+round(AirH1*NodeDensity);   % Aux variable

iW1=1+round(AirW1*NodeDensity);        % Aux variable
iW2=iW1+round(Width1*NodeDensity);     % Aux variable
iW3=iW2+round(Width2*NodeDensity);     % Aux variable
iW4=iW3+round(AirW2*NodeDensity);      % Aux variable

%Define problem dimensions
maxRow=iH6; % Aux variable
maxCol=iW4; % Aux variable

%Define matrix dimensions
A=zeros(maxRow,maxCol);
%Set everything to air and then define iron parts
muN=mu_air*ones(size(A)); 
muN(iH1:iH2-1,iW1:iW3-1)=mu_iron;
muN(iH2:iH3-1,iW1:iW2-1)=mu_iron;
muN(iH4:iH5,iW1:iW3-1)=mu_iron;

% Define an structure for the Finite Difference (FD) parameters
FD=struct('NodeDensity',NodeDensity,...
          'NumIterations',NumIterations);
          
Core=struct('NodeDensity',NodeDensity,...
            'Ideal',IdealCore,...
            'Units','mm',...
            'Depth',Depth,...
            'nTurns',nTurns,...
            'I',I,...
            'iH1',iH1,...
            'iH2',iH2,...
            'iH3',iH3,...
            'iH4',iH4,...
            'iH5',iH5,...
            'iH6',iH6,...
            'iW1',iW1,...
            'iW2',iW2,...
            'iW3',iW3,...
            'iW4',iW4);

