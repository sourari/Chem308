function PIB(n)
hbar=1.055E-34;
m=9.11E-31; % mass of electron
l=5E-9; % length of box 5 nm (written in meters)
pts=250; % number of discretized points
w=3; % number of points within infinite wall
x=linspace(0,l,pts); % discretized space
barht=1E6; %bar height on potential matrix
c=-(hbar.^2)/(2.*m); % constant in kinetic energy operator

% Define kinetic energy operator matrix (T)
% A=-2*eye(pts); % 2 on diagonal
% b=ones(pts-1,1); % vector of 1
% B=diag(b,-1); % 1 below diagnol
% B2=diag(b,1); % 1 above diagnol
% D=A+B+B2; % second derviative
D=-2*eye(pts)+diag(ones(pts-1,1),-1)+diag(ones(pts-1,1),1); % second derivative matrix
T=c.*D;

%Define potentiale energy operator matrix (V)
Vvec=zeros(pts,1);
Vvec([1:w,(end-(w-1)):end])=barht;
V=diag(Vvec);

H=T+V; % Hamilotian operator matrix (H)

[vecs,vals]=eig(H); % determining eigen vectors and eigenvalues
[srtvecs,srtvals]=eigsort(vecs,vals); % sorting eigenvalues in ascending order
v=diag(srtvals); % vector of sorted eigenvalues
k=[1:1:pts]; % row vector of evenly spaced numbers with number of pts
n=ones(pts,1) % column vector of 1's
repvals=0.25*n*k;
shiftvecs=srtvecs+repvals; % eigenvectors shifted based on repvals matrix
figure(1);plot(x,shiftvecs(:,1:5),x,Vvec); % plot potential well and eigenvectors (1-5)
axis([-inf inf -.5 2]); % adjusts axes to be able to see eigenvectors
end

