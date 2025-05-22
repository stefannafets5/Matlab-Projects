function retval = polynomial_kernel(x, y, d)
	retval = (x * y' + 1) ^ d;
endfunction