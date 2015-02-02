%%
clc
close all
clear all
%% sta³e
V1 = 2;
V2 = 1;
[rows, cols] = getMeshDimens;
[w, h] = getWidthHeight;
dx = w/rows;
dy = h/cols;

areaOfSquare = dx*dy;
areaOfTriangle = areaOfSquare / 2;

numberOfSquares = rows*cols;
numberOfTriangles = numberOfSquares*2;

%% dyskretyzacja, war. brzegowe, war. pocz¹tkowe epsilon
V = zeros(rows, cols);
 EpsMask = zeros(rows, cols);
 for i=1:rows
    for j=1:cols
        EpsMask(i,j) = getEpsilon(i,j);
    end
 end
 figure('name','Wartoœci eps')
 % mesh(EpsMask);
 contour(EpsMask);
 
 V=EpsMask;
 V(1,:) = V1(1);
 V(rows,:) = V2(1);

xs = [0:1:rows-1]';
ys = [0:1:cols-1]';
x = size(xs, 1);
y = size(ys, 1);

[X,Y] = meshgrid(xs, ys);
points = [X(:) Y(:)]; % posortowana lista wspó³rzêdnych punktów (Macierz W)

indexes = 1:size(points, 1);% macierz indeksów punktów (macierz N)
indexes = reshape(indexes, y, x); 

triangles = []; %lista trójk¹tów. ka¿dy trójk¹t to 3 indeksy punktów. (Macierz T)
for i = 1:x-1
    pl = [indexes(1:end-1, i) indexes(1:end-1, i+1) indexes(2:end, i)];
    pu = [indexes(1:end-1, i+1) indexes(2:end, i+1) indexes(2:end, i)];
    triangles = [triangles; pl; pu];
end

m = size(points, 1);
eps = reshape(EpsMask, numberOfSquares, 1);
epsTri = reshape(EpsMask, numberOfSquares, 1);
epsTri = epsTri(ceil((1:2*size(epsTri,1))/2), :); % duplicate rows

% H matrix
H = zeros(m);
for i=1:size(triangles,1)
    ns = triangles(i,:);
    p = [ points(ns(1),:); points(ns(2),:); points(ns(3),:) ];
    he = getHe(p, epsTri(i)) * epsTri(i);%epsilon);    
    H(triangles(i,1:3), triangles(i,1:3)) = H(triangles(i,1:3), triangles(i,1:3)) + he;
end

v = zeros(m, 1);
% v = reshape(V, m, 1);
v(1:y) = V1(1);%1;
v(end-y:end) = V2(1);
f(mod(1:y*x, y) == 0) = 0;
f(mod(y:y*x-y, y) == 0) = 0;

for i=1:size(v, 1)
%     if(eps>)
   v(i) = v(i) * eps(i); 
end

for i=1:m
   if v(i) ~= 0
       H(i,:) = 0;
       H(i,i) = 1;
   end
end

%% rozwi¹zanie uk³adu równañ
A = H\v;
figure();
trimesh(triangles,points(:,1),points(:,2),A);
% 
A = reshape(A',y,x);
figure()

contour(xs, ys, A);















