function y_interp = P_vandermonde (coef, x_interp)
    y_interp = zeros(size(x_interp));

    for i = 1 : length(x_interp)
        polinom = 0;
        for j = 1 : length(coef) % calculez polinomul de pe pozitia i
            polinom = polinom + coef(j) * x_interp(i)^(j-1);
        endfor
        y_interp(i) = polinom;
    endfor
endfunction
