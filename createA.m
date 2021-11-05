function A = createA(X,R0,S,M3,jj,kk,dt)
DX = X(jj,:) - X(kk,:);
R = sqrt(sum(DX.^2,2));
DXN = DX./[R,R,R];
T = S.*(R-R0);
TR = T./R;

A = diag(M3);

for l = 1:length(jj)
    P = (DXN(l,:))'*DXN(l,:);
    AA = -(dt^2)*(S(l)*P+TR(l)*(eye(3)-P));
    j = (3*jj(l)-2):(3*jj(l));
    k = (3*kk(l)-2):(3*kk(l));
    A(j,k) = AA;
    A(k,j) = AA;
    A(j,j) = A(j,j) - AA;
    A(k,k) = A(k,k) - AA;
end
end