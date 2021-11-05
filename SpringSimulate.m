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
repeats = 5;
% plotX(X,kk,jj)
normB = [];
B = 20;
round = 1;
E = [];
Ks = [];
Springs = [];
ts = [];
iterations = [];
locs = [];
% vidi = VideoWriter('forward.mp4','MPEG-4');
% open(vidi);
while t<Tfinal
    t = t + dt;
    Xold = X;
    round = round +1;
    
    i = 0;
    
    Z = X+dt*U;
%     X = Z;
    for repeat = 1:repeats
        i = i+1;
        A = createA(X,R0,S,M3,jj,kk,dt);
%         B = createB(X,R0,S,jj,kk,dt,M,Z);
        B = create_B(X,R0,S,M3,jj,kk,dt,Z);
        normB = [normB, norm(B)];
        dX = A\B;
        X = X+reshape(dX,3,[])';
    end
    
    iterations = [iterations, i];
    
    B = 20;
    
    % calculate U
    U = (X - Xold)./dt;
%     U(size(U,1),:) = [0,0,0];
%     X(size(U,1),:) = [0,0,0];
    
    if mod(round,333)==0
        plotX(X,kk,jj)
%         xlim([-1.5,1.5]);ylim([-1.5,1.5]);zlim([-1.5,1.5])
        disp(t)
%         frame = getframe(gca);
%         writeVideo(vidi,frame);
    end
    
    [TotalE, ~, ~] = calcEnergy(X, R0, U, jj, kk, M,S);
    ts = [ts,t];
    E = [E, TotalE];
    locs = [locs, X(1,1)];
%     validate(M, X, Z, S,R0, dt,jj,kk)
end
close(vidi)