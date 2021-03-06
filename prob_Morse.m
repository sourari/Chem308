function prob_Morse(n)

hbar=1;
m=1; % mass of electron
pts=250; % number of discretized points
x=linspace(-1,1,pts); % discretized space
dx=x(2)-x(1);
c=-(hbar.^2)/(2.*m); % constant in kinetic energy operator
q=1; %charge of electron (can change value later)
De=1e5;
a=1;
D=(1/((dx)^2)).*(-2*eye(pts)+diag(ones(pts-1,1),-1)+diag(ones(pts-1,1),1)); % second derivative matrix
T=c.*D;

Vvec=De*(1-exp(-a*x)).^2;
V=diag(Vvec);

H=T+V; 

mu=q*diag(x);

[vecs,vals]=eig(H); % determining eigen vectors and eigenvalues
[vecs,vals]=eigsort(vecs,vals); % sorting eigenvalues in ascending order
sc=100;
vecs=sc*vecs;
v=diag(vals);
repvals=(ones(pts,1))*v';
shiftvecs=vecs+repvals;

prob=vecs'*mu*vecs;
size(prob);

% figure(3);plot(x,shiftvecs(:,1:n),x,Vvec); % plot potential well and eigenvectors (1-5)
% axis([-inf inf 0 200]); % adjusts axes to be able to see eigenvectors


figure(1);pcolor(abs(prob(1:n,1:n).^2))
colormap gray
axis square
end


%% Eigsort Function
function [ srtvecs,srtvals ] = eigsort( vecs,vals )
d=diag(vals);
[dsort,ord]=sort(d);
srtvecs=vecs(:,ord);
srtvals=diag(dsort);
end