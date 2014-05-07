function ans = saveImages(noisy, corrected)
	imwrite(uint8(noisy), gray(255), 'noisy.bmp');
	imwrite(uint8(corrected), gray(255), 'corrected.bmp');
endfunction