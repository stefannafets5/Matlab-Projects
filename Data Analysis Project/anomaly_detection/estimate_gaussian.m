% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mean_values variances] = estimate_gaussian(X)
	mean_values = mean(X); % medie
	m = size(X, 1); % m = nr de linii
	variances = zeros(size(X, 2));
	for i = 1:m
		variances = variances + (X(i, :) - mean_values)' * (X(i, :) - mean_values);
	end
	variances = variances / m;
endfunction
