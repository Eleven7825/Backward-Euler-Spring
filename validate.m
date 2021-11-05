function difference = validate(M, X, Z, S,R0, dt,jj,kk)
DX = X(jj,:) - X(kk,:);
R = sqrt(sum(DX.^2,2));
DXN = DX./[R,R,R];
T = S.*(R-R0);
leftHandSide = [M,M,M].*(X-Z);
rightHandSide = zeros(size(X,1),3);
for l = 1:length(jj)
    rightHandSide(kk(l),:) = rightHandSide(kk(l),:)+dt^2*T(l)*DXN(l,:);
    rightHandSide(jj(l),:) = rightHandSide(jj(l),:)-dt^2*T(l)*DXN(l,:);
end
difference = leftHandSide - rightHandSide;
end