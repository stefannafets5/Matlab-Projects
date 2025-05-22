function x = oscillator(freq, fs, dur, A, D, S, R)

	t = zeros(1, round(dur * fs)) % vector cu 0
	for i = 1 : round(dur * fs)
		t(i) = (i - 1) / fs;
	endfor
  	
	fct_sin = sin(2 * pi * freq * t);

	% nr de sample-uri
	attack = floor(A * fs);
	decay = floor(D * fs);
	release = floor(R * fs);
	sustain = length(t) - attack - decay - release;

	attack_env = linspace(0, 1, attack);
	decay_env = linspace(1, S, decay);
	sustain_env = S * ones(1, sustain);
	release_env = linspace(S, 0, release);

	final_env = [attack_env decay_env sustain_env release_env];
	x = (fct_sin .* final_env)';
end