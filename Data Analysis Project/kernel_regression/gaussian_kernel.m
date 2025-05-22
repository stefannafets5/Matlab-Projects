function retval = gaussian_kernel(x, y, sigma)
	retval = exp(-sum((x - y) .^ 2) / (2 * sigma^2));
endfunction