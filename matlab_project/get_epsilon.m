%
% Funkcja zwracajaca epsilon dla danych pozycji siatki j,k
%
function mEps = get_epsilon(i,j)
    %% constants
    e1=1;
    e2=150;
    e3=e1;
    rows = rowsNum;
    cols = colsNum;
    %% returned
    mEps=e3;
    %% wspolrzedne prostokata zawierajacego eps2
     e2x1=colsNum-10;
     e2x2=e2x1-20;
     e2y1=rowsNum-10;
     e2y2=e2y1-20;
    %% sprawdzanie obszaru dla j,k
if i<rows && j<rows
    if (i<=e2x1 && i>=e2x2) && (j<=e2y1 && j>e2y2)
            mEps = e2;
    end
end