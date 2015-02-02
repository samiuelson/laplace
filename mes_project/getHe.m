function he = getHe( p, E )
    bi = p(2,2)-p(3,2);
    bj = p(3,2)-p(1,2);
    bk = p(1,2)-p(2,2);

    ci = p(3,1)-p(2,1);
    cj = p(1,1)-p(3,1);
    ck = p(2,1)-p(1,1);

    he = E*[ bi*bi+ci*ci bi*bj+ci*cj bi*bk+ci*ck;
        bj*bi+cj*ci bj*bj+cj*cj bj*bk+cj*ck;
        bk*bi+ck*ci bk*bj+ck*cj bk*bk+ck*ck ]/(4*getTriangleArea(p));
end

