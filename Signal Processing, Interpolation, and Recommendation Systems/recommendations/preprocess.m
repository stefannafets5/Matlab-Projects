function reduced_mat = preprocess(mat, min_reviews)
	n = size(mat, 1);

	for i = 1 : n % calculez nr de review-uri pt fiecare client
		nr = 0;
		for j = 1 : size(mat, 2)
			if mat(i, j) ~= 0
				nr = nr + 1;
			endif
		endfor
		nr_reviews(i) = nr;
	endfor

	rand_bun = zeros(n, 1); % gasesc randurile bune
	for i = 1 : n
		if nr_reviews(i) >= min_reviews
			rand_bun(i) = 1;
		endif
	endfor

	reduced_mat = mat(logical(rand_bun), :);
endfunction
