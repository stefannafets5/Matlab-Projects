function signal = apply_reverb(signal, impulse_response)
	impulse_response = stereo_to_mono(impulse_response);
	signal = fftconv(signal, impulse_response); % convolutie
	signal = signal / max(abs(signal)); % normalizare
endfunction
