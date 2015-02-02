%
% Funkcja zwracajaca epsilon dla danych pozycji siatki j,k
%
function mEps = getEpsilon(i,j) %i-wiersz, j-kolumna
    %% wartosci stale
    e1=150;
    e2=150;
    e3=1;
    [rows, cols] = getMeshDimens;
    [w, h] = getWidthHeight;
%     dx = w/rows
%     dy = h/cols
    % returned
    mEps=e3;
    % wspolrzedne prostokata zawierajacego eps2
     e2x1=rows - 0.10*rows;%w-10;
     e2x2=e2x1 - 0.10*rows;%-10;
%      e2y1=cols - 0.10*cols;%h-10;
%      e2y2=e2y1 - 0.10*cols;%-10;
     e2y1=0.10*cols;%h-10;
     e2y2=e2y1 + 0.10*cols;%-10;
    % wspolrzedne prostokata zawierajacego eps1
     e3x1=0.10*rows;
     e3x2=e3x1 + 0.10*rows;
     e3y1=0.10*cols;
     e3y2=e2y1 + 0.10*cols;
%      e3y1=cols - 0.10*cols;
%      e3y2=e3y1 - 0.1*cols;
    %% sprawdzanie obszaru dla j,k
if i<=rows && j<=cols
    if (i <= e2x1 && i >= e2x2) && (j >= e2y1 && j < e2y2)
        mEps = e1;
       elseif (i >= e3x1 && i <= e3x2) && (j >= e3y1 && j < e3y2)
           mEps = e2;
    else 
        mEps = e3;
    end
else
    disp('Wybrane wspolrzedne poza granicami siatki!');
    mEps = e1;
end
