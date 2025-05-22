function mat = read_mat(path)
	mat = csvread(path);
	% csvread ia in plus un rand si o coloana
	mat = mat(2 : size(mat, 1), 2 : size(mat, 2));
endfunction
