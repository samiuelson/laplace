%% ZMN lab. Projekt, cw. 15
% 
% 
%% 
clc
clear all
close all
%% init variables
% wymiary siatki
cols=colsNum;
rows=rowsNum;
% dimens of area
get_height;
get_width;
% dx, dy
dx = get_width / colsNum;
dy = get_height / rowsNum;
% wymuszenia na brzegach
V1 = 1;
v2 = 2;
% macierz wartoœci V w pktach siatki
V_now = zeros(rows, cols);
V_prev = zeros(rows, cols);
% przenikalnoœæ (epsilon) struktury
for i=1:1:rows
    for j=1:1:cols
         V_now(i,j)=get_epsilon(i,j);
    end
end
% warunki brzegowe
V_now(1,1:cols) = 0;
V_now(rows,1:cols) = 0;
V_now(1:rows, 1) = 1 * V_now(1:rows, 1);
V_now(1:rows, cols) = 2 * V_now(1:rows, cols);

% licznik iteracji
iter=0;
% wartosc bledu
error=max(max(abs(V_now-V_prev)));
% constant
cons = 1/(2*dx^2*dy^2)*(dy^2+dx^2);
while(error>0.5 && iter<300)%Run this until convergence
    iter=iter+1; % Iteration counter increment
    % Updating present iteration using 4 point Central diffrence form
    % of Laplace equation obtained using Finite Difference method
    for i=2:1:rows-1
        for j=2:1:cols-1
            V_now(i,j)=((V_now(i-1,j)+V_now(i+1,j)+V_now(i,j-1)+V_now(i,j+1))/4);
            %V_now(i,j)=get_epsilon(i,j)*cons * (dy^2*(V_now(i+1,j)+V_now(i-1,j)) + dx^2*(V_now(i,j+1)+V_now(i,j-1)));
        end
    end
    error=max(max(abs(V_now-V_prev))); % Calculate the maximum error between previous and current iteration at all points
    V_prev=V_now; % Updating previous iteration matrix to the last iteration performed
        %Movie type colour scaled image plot to see how solution progresses
    imagesc(V_now);colorbar;
    title(['Voltage distribution on a ',int2str(rows),' x ',int2str(cols),' grid at iteration no ',int2str(iter)],'Color','k'); 
    getframe;
end
%Plot the electric field distribution
figure;
[ex,ey]=gradient(V_now,2,2);
quiver(-ex,-ey); %Quiver command creates a plot, E=-grad(V), hence the negative sign
%
figure;
mesh(V_now);

