function PIB( n ) %n is number of eigenvalues
%defining constants
hbar=6.626E-34/(2*pi);%hbar
m=9.11E-31; %mass in kilograms
l=5E-9; %5 nm
pts=100; %number of discritized points (for second derivative and potential)
w=3; %number of points in barrier
barht=1E6; %bar height on potential matrix
c=-(hbar.^2)./(2.*m); %constants in kinetic energy
%defining second derivative matrix for kinetic energy
% A=-2*eye(pts); % 2 on diagonal
% b=ones(pts-1,1); % vector of 1
% B=diag(b,-1); % 1 below diagnol
% B2=diag(b,1); % 1 above diagnol
% D=A+B+B2; % second derviative
D=-2*eye(pts)+diag(ones(pts-1,1),-1)+diag(ones(pts-1,1),1); % second derivative matrix
%Kinetic energy matrix and constants
T=c.*D;

% defining potential energy matrix
Vvec=zeros(pts,1);
Vvec([1:w,(end-(w-1)):end])=barht;
end

