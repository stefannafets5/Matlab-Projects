function retval = stochastic_matrix(k_secv_corpus, corpus_words, word_set, k_secv_set, k)
    % build the stochastic matrix. Bonus if it is sparse
    % The 'stochastic' matrix SHOULD NOT be scaled (divided by sum of all)
    % It should just be entry-wise
    % This is how the checker tests it, to not have to deal with floating point errors

    a = size(k_secv_set, 1); % marimi
    b = size(k_secv_set, 2);
    c = size(word_set, 1);
    d = size(word_set, 2);
    f = size(corpus_words, 1);
    g = size(corpus_words, 2);
    retval = zeros((a * b), (c * d)); % initializare

    for i = 1 : ((f * g) - k)
        for j = 1 : (a * b) % gasire index secventa
            if strcmp(k_secv_set{j}, k_secv_corpus{i})
                secv = j;
                break;
            end
        end
        for j = 1 : (c * d) % gasire index cuv
            if strcmp(word_set{j}, corpus_words{i + k})
                cuv = j;
                break;
            end
        end
        retval(secv, cuv)++;
    end
end