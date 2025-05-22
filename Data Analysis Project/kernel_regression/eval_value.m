function pred = eval_value(x, X, f, f_param, a)
	n = size(X, 1);
    K = zeros(n, 1);
    for i = 1:n
        K(i) = f(x, X(i, :), f_param);
    end
    pred = K' * a;
endfunction