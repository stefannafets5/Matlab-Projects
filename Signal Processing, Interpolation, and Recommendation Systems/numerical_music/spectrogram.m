function [S f t] = spectrogram(signal, fs, window_size)
	nr = floor(length(signal) / window_size);
	S = zeros(window_size, nr); % initializari
	t = zeros(nr, 1);
	f = zeros(window_size, 1);

	for i = 1 : nr
		window = signal((i - 1) * window_size + 1 : i * window_size);
		window = window .* hanning(window_size);
		window = fft(window, 2 * window_size);
		for j = 1 : size(S)
			S(j, i) = abs(window(j));
		endfor
	endfor

	for i = 1 : window_size
		f(i) = (i - 1) * (fs / (2 * window_size));
	endfor

	t(1) = 0;
	for i = 2 : nr
		t(i) = (i - 1) * (window_size / fs);
	endfor
endfunction
