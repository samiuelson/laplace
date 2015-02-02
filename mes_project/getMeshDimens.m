function [x,y] = getMeshDimens
%% stale
meshDensity = 0.2; %gestosc siatki 0-1
%%
[w,h] = getWidthHeight;
x = floor(w * meshDensity); %kolumny 
y = floor(h * meshDensity); %wiersze