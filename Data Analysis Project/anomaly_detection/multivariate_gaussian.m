% Computes the probability density function of the multivariate gaussian distribution.
function probabilities = multivariate_gaussian(X, mean_values, variances)
    n = size(X, 2); % n = nr de coloane
    probabilities = zeros(size(X, 1), 1); % vect coloana de 0
    for i = 1:size(X, 1)
        a = (2 * pi) ^ (-n / 2) * det(variances) ^ (-0.5);
        ex = exp(-0.5 * (X(i,:) - mean_values) * inv(variances) * (X(i,:) - mean_values)');
        % a = prima parte a formulei
        % ex = partea exponentiala din formula
        probabilities(i) = a * ex;
    end
endfunction
