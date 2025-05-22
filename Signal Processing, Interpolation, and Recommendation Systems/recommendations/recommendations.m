function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
	mat = read_mat(path);
	mat = preprocess(mat, min_reviews);
	[~, ~, V] = svds(mat, num_features);
	V = V';

	similarities = zeros(size(V, 2), 1); % calculez similaritatea
	for i = 1 : size(V, 2)
		similarities(i) = cosine_similarity(V(:, liked_theme), V(:, i));
	endfor
	
	[~, indici] = sort(similarities, 'descend'); % vector de indici
    indici = indici';
    
	for i = 1 : length(indici) % scot tema pe care sa bazat comparatia
		if indici(i) == liked_theme
			indici(i) = [];
			break;
		endif
	endfor

    recoms = indici(1:num_recoms);
endfunction
