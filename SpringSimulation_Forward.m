% clear 
% clf
% create loop first
createWheel

% constants 
Tfinal = 10;
% dt = 1e-3;
t = 0;
X = X0;
U = U0;
% plotX(X,kk,jj)

E = [];

i = 0;

E = [];
ts = [];
locs = [];
% vidi = VideoWriter('backward.mp4','MPEG-4');
open(vidi);

while t < Tfinal
  i = i+1;
  t = t + dt;
  DX = X(jj,:) - X(kk,:); %link vectors
  DU = U(jj,:) - U(kk,:); %link velocity difference vectors
  R = sqrt(sum(DX.^2,2)); %link lengths
  
  T = S.*(R-R0); %link tensions
  TR=T./R; %link tensions divided by link lengths
  FF=[TR,TR,TR].*DX; %link force vectors

  F=zeros(size(X,1),3); %initialize force array for mass points 

  % For each link, add its force with correct sign
  % to the point at each end of the link:
  for link=1:length(jj)
    F(kk(link),:)=F(kk(link),:)+FF(link,:);
    F(jj(link),:)=F(jj(link),:)-FF(link,:);
  end

  U = U + dt*F./[M,M,M]; %update velocities of all points,
  
  %but if the index of the point is on the list "fixed",
  %set its velocity equal to zero:
%   U(size(X,1),:)=0; 

  X = X + dt*U; %update positions of all points
  
%   if mod(i,1e1)==0
      disp(t)
      plotX(X,kk,jj)
%       frame = getframe(gca);
%       xlim([-1.5,1.5]);ylim([-1.5,1.5]);zlim([-1.5,1.5])
%       writeVideo(vidi,frame);
%   end
  
  E = [E, calcEnergy(X, R0, U, jj, kk, M, S)];
  ts = [ts,t];
  locs = [locs, X(1,1)];
end