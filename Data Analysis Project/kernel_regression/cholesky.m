function [L] = cholesky (A)
    n = size(A, 1);
    L = zeros(n); 
    for i = 1:n
        for j = 1:i
            if i == j
                L(i, j) = sqrt(A(i, i) - sum(L(i, 1:j - 1).^2));
            else
                L(i, j) = (A(i, j) - sum(L(i, 1:j - 1) .* L(j, 1:j - 1))) / L(j, j);
            end
        end
    end
endfunction
