% create wheel
g = 9.8      %gravitational acceleration (m/s^2)
omega = 10   %initial angular velocity (radians/s)

r = 1          %radius of wheel (m)
a = 0.5        %length of axle (m)
n = 20         %number of points on the rim
M_rim = 1      %total mass of the rim (Kg)
M_axle = 1     %total mass of the axle (Kg)
S_rim = 2e7*(M_rim/n)*omega^2  %stiffness of each rim link (Kg/s^2)
D_rim = 0*(M_rim/n)*omega   %damping constant of each rim link (Kg/s)
S_spoke = S_rim %stiffnes of each spoke (Kg/s^2)
D_spoke = D_rim %damping constant of each spoke (Kg/s)
S_axle =  S_rim %stiffness of the axle (Kg/s^2)
D_axle =  D_rim %damping constant of the axle (Kg/s)

[kmax,lmax,X,jj,kk,S,D,Rzero,M] = ...
wheel(r,a,n,M_rim,M_axle,S_rim,D_rim,S_spoke,D_spoke,S_axle,D_axle);
N = size(X,1);
X0 = X;
U0 = omega*[-X(:,2),X(:,1),zeros(kmax,1)];
M3 = zeros(3*N,1);
R0 = Rzero;

for j = 1:N                        % setup for M3
    M3(3*j-2:3*j) = M(j);
end