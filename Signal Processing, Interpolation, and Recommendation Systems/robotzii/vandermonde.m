function coef = vandermonde(x, y)
    A = vander(x);
    coef = inv(A) * y;
    coef = flip(coef);
endfunction
