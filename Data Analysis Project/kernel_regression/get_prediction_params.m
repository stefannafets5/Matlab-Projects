function [a] = get_prediction_params (K, y, lambda)
	A = K + lambda * eye(size(K));
    a = lambda * inv(A) * y;
endfunction
