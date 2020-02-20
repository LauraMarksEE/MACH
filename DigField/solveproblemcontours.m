function [Anew]=SolveProblemContours(A,Core)

Anew=A;
maxCol=size(A,2);
maxRow=size(A,1);

% Left border
Anew(:,1)=(A(:,1)+A(:,2))/2;
% Right border
Anew(:,maxCol)=(A(:,maxCol)+A(:,maxCol-1))/2;
%Left corners: Propagate to the left
for m=Core.iW1-1:-1:1;
   Anew(1,m)=(A(1,m)+A(1,m+1))/2;
   Anew(maxRow,m)=(A(maxRow,m)+A(maxRow,m+1))/2;
end
% Right corners: Propagate to the right
for m=Core.iW3:Core.iW4;
   Anew(1,m)=(A(1,m)+A(1,m-1))/2;
   Anew(maxRow,m)=(A(maxRow,m)+A(maxRow,m-1))/2;
end
