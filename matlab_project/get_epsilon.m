%
% Funkcja zwracajaca epsilon dla danych pozycji siatki j,k
%
function mEps = get_epsilon(i,j)
    %% constants
    e1=60;
    e2=5;
    e3=e1;
    rows = rowsNum;
    cols = colsNum;
    %% returned
    mEps=e3;
%     %% wspolrzedne prostokata zawierajacego eps1
%     e1x1=5;
%     e1x2=20;
%     e1y1=5;
%     e1y2=30;
    %% wspolrzedne prostokata zawierajacego eps2
     e2x1=colsNum-10;
     e2x2=e2x1-20;
     e2y1=rowsNum-10;
     e2y2=e2y1-20;
%     e2x1=30;
%     e2x2=e2x1-20;
%     e2y1=cols-10;
%     e2y2=e2y1-20;
    %% sprawdzanie obszaru dla j,k
if i<rows && j<rows
%         if (j>=e1x1 && j<=e1x2) && (k>=e1y1 && k>e1y2)
%             mEps = e1;
%         else
    if (i<=e2x1 && i>=e2x2) && (j<=e2y1 && j>e2y2)
            mEps = e2;
    end
end