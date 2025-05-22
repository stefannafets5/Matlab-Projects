function retval = k_secv_idx (distinct_k_sec)
	a = containers.Map();
    for i = 1 : length(distinct_k_sec)
        a(distinct_k_sec{i}) = i;
    end
    retval = a;
endfunction