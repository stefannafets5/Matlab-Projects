function [K] = build_kernel (X, f, f_param)
    K = zeros(size(X, 1), size(X, 1)); % matrice de 0
    for i = 1:size(X, 1)
        for j = 1:size(X, 1)
            K(i, j) = f(X(i, :), X(j, :), f_param);
        end
    end
endfunction
