function [newVm,Error]=solve_air_only(Vm,muN,Core)


newVm=Vm;

%% Sorrounding air solver
%% ~~~~~~~~~~~~~~~~~~~~~~
%Solve air to the left of the core
for m=2:Core.iH5-1,
   for n=2:Core.iW1-1,
      newVm(m,n)=(Vm(m-1,n)+Vm(m,n-1)+Vm(m+1,n)+Vm(m,n+1))/4;
   end
end
%Solve air to the right of the core
for m=2:Core.iH5-1,
   for n=Core.iW3:Core.iW4-1,
      newVm(m,n)=(Vm(m-1,n)+Vm(m,n-1)+Vm(m+1,n)+Vm(m,n+1))/4;
   end
end


%% AIRGAP solver
%% ~~~~~~~~~~~~~
%Solve first part of the airgap
for m=Core.iH2:Core.iH3-1,
   for n=Core.iW2:Core.iW4-1,
      % - Type the finite difference equation immediately below this line -
      newVm(m,n)=(Vm(m-1,n)+Vm(m,n-1)+Vm(m+1,n)+Vm(m,n+1))/4;
   end
end
%Solve second part of the airgap
for m=Core.iH3:Core.iH4-1,
   for n=2:Core.iW4-1,
      % - Type the finite difference equation immediately below this line -
      newVm(m,n)=(Vm(m-1,n)+Vm(m,n-1)+Vm(m+1,n)+Vm(m,n+1))/4;
   end
end


% Deal with special cases with in the problem such as corners
newVm=solveproblemcontours(newVm,Core);

%%Calculate error
maxVm=max(max(sqrt(Vm.^2)));
maxChange=abs(max(max(Vm-newVm)));
Error=maxChange/maxVm;

