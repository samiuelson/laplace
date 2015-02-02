%
% Funkcja zwracajaca epsilon dla danych pozycji siatki j,k
%
function mEps = getEpsilon(i,j) %i-wiersz, j-kolumna
    %% wartosci stale
    e1=1;
    e2=1;
    e3=e1;
    [rows, cols] = getMeshDimens;
    [w, h] = getWidthHeight;
    dx = w/rows;
    dy = h/cols;
    % returned
    mEps=e3;
    % wspolrzedne prostokata zawierajacego eps2
     e2x1=w-40;
     e2x2=e2x1-40;
     e2y1=40;
     e2y2=e2y1+40;
    %% sprawdzanie obszaru dla j,k
if i<=rows && j<=cols
    if (i*dx <= e2x1 && i*dx >= e2x2) && (j*dy >= e2y1 && j*dy < e2y2)
            mEps = e2;
    end
else
    disp('Wybrane wspolrzedne poza granicami siatki!');
    mEps = 1;
end