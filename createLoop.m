% This example creates a loop with N nodes and N springs connecting them

% setup stuff related to the nodes
N = 10;
M = ones(N,1);                         % their mass
M3 = zeros(3*N,1);

for j = 1:N                        % setup for M3
    M3(3*j-2:3*j) = M(j);
end

r = 1;                             % radius of the circle
X0 = [r.*cos(2*pi*((1:N)')./N),... % their x locations
     r.*sin(2*pi*((1:N)')./N),...  % their y locations
     zeros(N,1)];                  % their z locations
 
U0 = zeros(N,3);                  % inital speed of the nodes

% setup stuff related to the spring
R0 = ones(N,1).*0.5; % their inital length
S = ones(N,1).*2;    % stiffness
jj = 1:N;            
kk = [N, 1:N-1];
