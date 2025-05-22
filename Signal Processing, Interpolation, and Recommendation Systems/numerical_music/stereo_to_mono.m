function mono = stereo_to_mono(stereo)
	% initializare cu 0
	mono = zeros(size(stereo));

	for i = 1 : size(stereo)
		suma = 0;
		for j = 1 : size(stereo, 2)
			suma = suma + stereo (i, j); % suma pe rand
		endfor
		mono(i) = suma / size(stereo, 2);
	endfor
	% Normalize
	mono = mono / max(abs(mono));
endfunction
