function area = getTriangleArea( p )
    area = det([ones(3, 1), p]) / 2;    
end

