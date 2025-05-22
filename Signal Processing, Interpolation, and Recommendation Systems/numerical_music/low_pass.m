function signal = low_pass(signal, fs, cutoff_freq)
    fourier = fft(signal); % fourier
	n = length(signal);
	f = zeros(1, n);

	for i = 0 : (n - 1) % frecvente
    	f(i + 1) = i * (fs / n);
	endfor

	mask = zeros(1, n);
    for i = 1 : n
		if f(i) <= cutoff_freq
			mask(i) = 1;
		endif
	endfor

    signal = fourier .* mask';
    signal = ifft(signal); % fourier invers
	signal = signal / max(abs(signal)); % normalizare
endfunction
