function retval = word_idx (distinct_wds)
    a = containers.Map();
    for i = 1 : length(distinct_wds)
        a(distinct_wds{i}) = i;
    end
    retval = a;
endfunction
