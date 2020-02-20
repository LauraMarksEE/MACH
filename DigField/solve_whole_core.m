function [Anew,Error]=solve_whole_core(A,muN,Core)

% Solve all apart from the borders
Anew=A;

maxCol=size(A,2);
maxRow=size(A,1);
%Solve with nested loops and improve speed later
for m=2:maxRow-1,
   for n=2:maxCol-1,
      u1=muN(m,n);
      u2=muN(m,n-1);
      u3=muN(m+1,n-1);
      u4=muN(m+1,n);
      sumMu=(u1+u2+u3+u4);      
      Anew(m,n)=1/(2*sumMu)*(A(m-1,n)*(u1+u2)+A(m,n-1)*(u2+u3)+...
                             A(m+1,n)*(u3+u4)+A(m,n+1)*(u4+u1));
   end
end

% Deal with special cases with in the problem such as corners
Anew=solveproblemcontours(Anew,Core);

%%Calculate error
maxA=max(max(sqrt(A.^2)));
maxChange=abs(max(max(A-Anew)));
Error=maxChange/maxA;

