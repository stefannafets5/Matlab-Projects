function [a] = get_prediction_params_iterative(K, y, lambda)
    A = K + lambda * eye(size(K));
    a = zeros(size(K), 1);
    a = conjugate_gradient(A, y, a, 0.001, 1000);
endfunction