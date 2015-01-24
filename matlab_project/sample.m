clear all;
close all;
clc;

%Dimensions of the simulation grid in x (xdim) and y (ydim) directions
xdim=colsNum;
ydim=rowsNum;

%Initializing previous (V_prev) and present (V_now) voltage matrices
V_now=zeros(xdim+1,ydim+1);
V_prev=zeros(xdim+1,ydim+1);

for i=1:1:xdim
    for j=1:1:ydim+1
        V_now(i,j)=get_epsilon(i,j);
    end
end

%Initializing boundary conditions only for V_now
i=1:1:xdim+1;%x-co-ordinates for boundary at y=ydim*grid_size 
V_now(i,ydim)=2;
V_now(i,1)=1;
%Iteration counter
iter=0;

%Calculation of maximum error between V_now and V_prev at all points
%By setting the applied voltage for only V_now, we have made V_no and
%V_prev different, hence error will be greater than zero and the program
%will enter the while loop following this command.
error=max(max(abs(V_now-V_prev)));

%Iteration loop
while(error>0.5 && iter<300)%Run this until convergence
    
    iter=iter+1; % Iteration counter increment
    
    % Updating present iteration using 4 point Central diffrence form
    % of Laplace equation obtained using Finite Difference method
    for i=2:1:xdim
        for j=2:1:ydim
            V_now(i,j)=((V_now(i-1,j)+V_now(i+1,j)+V_now(i,j-1)+V_now(i,j+1))/4);
        end
    end
    error=max(max(abs(V_now-V_prev))); % Calculate the maximum error between previous and current iteration at all points
    V_prev=V_now; % Updating previous iteration matrix to the last iteration performed
    
    %Movie type colour scaled image plot to see how solution progresses
    imagesc(V_now);colorbar;
    title(['Voltage distribution on a ',int2str(xdim),' x ',int2str(ydim),' grid at iteration no ',int2str(iter)],'Color','k'); 
    getframe;
end
% for i=2:1:xdim
%         for j=2:1:ydim
%             %V_now(i,j)=(V_now(i-1,j)+V_now(i+1,j)+V_now(i,j-1)+V_now(i,j+1))/4;
%             V_now(i,j)=V_now(i,j)*get_epsilon(i,j);
%         end
% end
%Plot the electric field distribution
figure;
[ex,ey]=gradient(V_now);
quiver(-ex,-ey); %Quiver command creates a plot, E=-grad(V), hence the negative sign
figure;
mesh(V_now);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF PROGRAM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%