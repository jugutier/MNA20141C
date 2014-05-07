function ans = saveImages(noisy, corrected)
	imwrite(uint8(noisy), gray(256), '../img/received.bmp');
	imwrite(uint8(corrected), gray(256), '../img/corrected.bmp');
endfunction