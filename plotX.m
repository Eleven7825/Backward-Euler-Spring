function plotX(X,kk,jj)
clf
scatter3(X(:,1),X(:,2),X(:,3));

for inx = 1 : length(jj)
    hold on
    plot3([X(jj(inx),1),X(kk(inx),1)],[X(jj(inx),2),X(kk(inx),2)],...
        [X(jj(inx),3),X(kk(inx),3)],'r')
    hold off
end
axis equal
axis manual
drawnow
end

% Things to do:

% Checking matrices in the backward version

% Could possibly improved: 

% Explore the iterations needed for Newton's method
