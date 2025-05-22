% Finds the best threshold to use for selecting outliers.
function [best_epsilon best_F1 associated_precision associated_recall] = optimal_threshold(truths, probabilities)
    best_epsilon = 0; % initializare
    best_F1 = 0;
    associated_precision = 0;
    associated_recall = 0;
    mini = min(probabilities);
    maxi = max(probabilities);
    pas = (mini + maxi) /1000;

    for epsilon = mini:pas:maxi
        predictions = probabilities < epsilon;
        % 1 sau 0 daca elem din probabilities < sau > decat epsilon
        
        tp = 0; % true positives
        fp = 0; % false positives
        fn = 0; % false negatives
        for i = 1:length(predictions)
            if predictions(i) == 1 && truths(i) == 1
                tp = tp + 1;
            elseif predictions(i) == 1 && truths(i) == 0
                fp = fp + 1;
            elseif predictions(i) == 0 && truths(i) == 1
                fn = fn + 1;
            end
        end
        
        precision = tp / (tp + fp);
        recall = tp / (tp + fn);
        F1 = 2 * precision * recall / (precision + recall);

        if F1 > best_F1
            best_F1 = F1;
            best_epsilon = epsilon;
            associated_precision = precision;
            associated_recall = recall;
        end
    end
endfunction
