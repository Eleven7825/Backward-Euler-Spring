function [E,K,Spring] = calcEnergy(X, R0, U, jj, kk,M,S)
% kinetic energy
K = sum(M.*sum(U.^2,2)./2);

% The energy stored in the spring
Spring = sum(S.*(sqrt(sum((X(jj,:)-X(kk,:)).^2,2))-R0).^2)./2;
E = K+Spring;
end