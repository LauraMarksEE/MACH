function [DAx, DAy]=gradient_1o(A,varargin)


%Deal with optional arguments
DerivativeType=3; % Default value for derivative approximation type
if nargin>1
   k=1;
   while k <= nargin-1
      InvalidOption=1;
      if (ischar(varargin{k}))
         if strcmpi(varargin{k},'CD') % Central difference
            DerivativeType=1;
            InvalidOption=0;
         end
         if strcmpi(varargin{k},'FD') % Forward difference
            DerivativeType=2;
            InvalidOption=0;
         end

         if strcmpi(varargin{k},'BD') % Backward difference
            DerivativeType=3;
            InvalidOption=0;
         end
      end
      if (InvalidOption) 
         disp(sprintf('Please verify. Option ignored: %s',varargin{k}));
         pause;
      end
      k=k+1;
   end   
end


MaxRow=size(A,1);
MaxCol=size(A,2);

DAx=zeros(size(A));
DAy=zeros(size(A));

switch DerivativeType
  case 1, % Use first order central approx
   DAy(2:MaxRow-1,:)=(A(3:MaxRow,:)-A(1:MaxRow-2,:))/2;
   DAx(:,2:MaxCol-1)=(A(:,3:MaxCol)-A(:,1:MaxCol-2))/2;

  case 2, % Use first order forward approx
   DAy(2:MaxRow-1,:)=A(3:MaxRow,:)-A(2:MaxRow-1,:);
   DAx(:,2:MaxCol-1)=A(:,3:MaxCol)-A(:,2:MaxCol-1);
   
  case 3, % Use first order backward approx  
   DAy(2:MaxRow,:)=A(2:MaxRow,:)-A(1:MaxRow-1,:);
   DAx(:,2:MaxCol)=A(:,2:MaxCol)-A(:,1:MaxCol-1);
end
   
% Use forward approx for the first row and backwards for the last
DAy(1,:)=A(2,:)-A(1,:);
DAy(MaxRow,:)=A(MaxRow,:)-A(MaxRow-1,:); 
DAx(:,1)=A(:,2)-A(:,1);
DAx(:,MaxCol)=A(:,MaxCol)-A(:,MaxCol-1);
