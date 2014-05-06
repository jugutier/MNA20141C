function ans = saveImages(noisy, corrected)
	imwrite(noisy, gray(255), 'noisy.bmp');
	imwrite(corrected, gray(255), 'corrected.bmp');
endfunction