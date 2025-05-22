function B = k_secv (A, k)
	n = length(A);
    B = cell(n - k, 1);
    for i = 1 : (n - k)
        aux = '';
        for j = i : i + k - 1;
            aux = [aux, A{j}];
            if ~(j == i + k - 1)
                aux = [aux, ' '];
            endif
        end
        B{i} = aux;
    end
endfunction
