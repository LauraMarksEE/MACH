%%
%%  Script:  c_core.m   
%%           Studies the magnetic potential in a C-core, as a complement 
%%           to the 2nd year lab, experiment N.
%%
%%   Date:   10-December 2001
%%     By:   Carlos A. Hernandez-Aramburo / Dr. Tim C. Green
%%    
%% Change log:
%%           12-December-2001  CAHA.
%%

% Define Core dimensions, Material properties
%       and Finite difference method parameters
[Vm,muN,Core,FD]=define_problem;

% If the variable prevVm exists, do not reset to initial conditions
if (exist('prevVm'))
   disp(sprintf('Starting from a previous iteration'));
   Vm=prevVm;   
   nIteration=prevIteration;
   FirstIteration=prevIteration;
   TargetIteration=prevIteration+FD.NumIterations;
else
   nIteration=0;
   disp(sprintf('Starting from first iteration'))
   [Vm]=setup_InitialConds(Vm,muN,Core);
   FirstIteration=1;   
   TargetIteration=FD.NumIterations;
   % Show the physical problem
   figure;
   show_physicalproblem(muN,Core);
   
   % Show Vm values in initial conditions
   figure;
   plot_3Dvalues(Vm,Core,'Scalar magnetic potential (Vm) at initial conditions [A]');

end


%Flush pending graphics
drawnow;

more off;
tic; % Start chronometer
for nIteration=FirstIteration:TargetIteration,
   [Vm,Error]=solveFD(Vm,muN,Core);      
   disp(sprintf('%s%d    %s%d','Iteration: ',nIteration,'Error: ',Error));
end
ElapsedTime=toc; % Stop chronometer


% Make iteration results accumulative
prevVm=Vm;
prevIteration=nIteration;

% Plot Vm
figure;
titlestr=sprintf('%s %d %s','Scalar magnetic potential (Vm) after',nIteration,'iteration(s) [A]');
plot_3Dvalues(Vm,Core,titlestr);

% Get H
[Hx,Hy]=gradient_1o(-Vm,'BD');
Hx=Hx*Core.NodeDensity;
Hy=Hy*Core.NodeDensity;

% Compute B
[Bx,By]=getB(Hx,Hy,muN);

% Calculate L
L=getL(Core,Bx,By);

% Plot results
plot_results(Vm,Hx,Hy,Bx,By,muN,Core);

% Print some results to the command line window
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
disp(sprintf('The simulation time was: %f [s]',ElapsedTime));
disp(sprintf('The calculated inductance is: %f [H]',L));
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
