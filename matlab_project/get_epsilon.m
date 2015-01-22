%
% Funkcja zwracajaca epsilon dla danych pozycji siatki j,k
%
function mEps = get_epsilon(j,k)
    %% constants
    e1=60;
    e2=5;
    e3=60;
    rows = rowsNum;
    cols = colsNum;
    %% returned
    mEps=0;
    %% wspolrzedne prostokata zawierajacego eps1
    e1x1=5;
    e1x2=20;
    e1y1=5;
    e1y1=30;
    %% wspolrzedne prostokata zawierajacego eps2
    e2x1=cols-5;
    e2x2=cols-5-15;
    e2y1=5;
    e2y1=30;
    %% sprawdzanie obszaru dla j,k
    if j<rows && k<rows
        if (j>=e1x1 && j<=e1x2) && (k>=e1y1 && k>e1y2)
            mEps = e1;
        elseif (j>=e2x1 && j<=e2x2) && (k>=e2y1 && k>e2y2)
            mEps = e2;
        else
            mEps = e3;
        end
    end
end