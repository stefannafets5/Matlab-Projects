function [x] = conjugate_gradient (A, b, x0, tol, max_iter)
    r = b - A * x0;
    v = r;
	x = x0;
    tolsqared = tol ^ 2;
    k = 1;
    while k <= max_iter && (r' * r) > tolsqared
        tk = (r' * r) / (v' * A * v);
        x = x + tk * v;
		aux = r;
        r = r - tk * A * v;
        sk = (r' * r) / (aux' * aux);
        v = r + sk * v;
        k = k + 1;
    end
endfunction