clear
clc
close all
[rows, cols] = getMeshDimens; 
EpsMask = zeros(rows, cols);
 for i=1:1:rows
    for j=1:1:cols
        EpsMask(i,j) = getEpsilon(i,j);
    end
 end
 figure('name','Wartoœci eps')
%  mesh(EpsMask);
contour(EpsMask);