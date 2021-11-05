
function B = createB(X,R0,S,jj,kk,dt,M,Z)
B = zeros(3*size(X,1),1);
% X = Z;

for inx = 1 : size(X,1) % Here, inx is the index of the node
    k = 3*inx-2:3*inx;  % k is the corresponding index in the B
    B(k,1) = -M(inx)*(X(inx,:)-Z(inx,:))';
    
    % neighs are indices for spring that are neighbor of node inx
    headconnected = find(kk==inx); % index of spring that head connects
    toeconnected = find(jj==inx);   % index of spring
    
    for i = headconnected'         % for spring index that head connects with node inx
        neigh = jj(i);            % neigh is node index
        direct = X(neigh,:)-X(inx,:);
        len = norm(direct);
        Tjk = S(i)*(len-R0(i));
        B(k,1) = B(k,1) + dt^2*Tjk*(direct'./len);
    end 

    for i = toeconnected'       % for spring that toe connects with node inx
        neigh = kk(i);           % neigh is node index
        direct = X(neigh,:)-X(inx,:);
        len = norm(direct);
        Tjk = S(i)*(len-R0(i));
        B(k,1) = B(k,1) + dt^2*Tjk*(direct'./len);
    end 
    
end

% for inx  = 1:length(jj)
%     direct = X(jj(inx),:)-X(kk(inx),:);
%     len = norm(direct);
%     Tjk = S(inx)*(len-R0(inx));
%     k = 3*kk(inx)-2:3*kk(inx);
%     B(k,1) = B(k,1) + dt^2*Tjk*(direct'./len);
% end
end