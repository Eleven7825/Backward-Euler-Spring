function B = create_B(X,R0,S,M3,jj,kk,dt,Z)
DX = X(jj,:) - X(kk,:);
R = sqrt(sum(DX.^2,2));
DXN = DX./[R,R,R];
T = S.*(R-R0);

B = -M3.*(reshape(X',[],1)-reshape(Z',[],1));

for l = 1:length(jj)
    k = (3*kk(l)-2):(3*kk(l));
    j = (3*jj(l)-2):(3*jj(l));
    B(k) = B(k)+(dt^2)*T(l)*DXN(l,:)';
    B(j) = B(j)-(dt^2)*T(l)*DXN(l,:)';
end
end