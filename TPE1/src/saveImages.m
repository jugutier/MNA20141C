function ans = saveImages(noisy, corrected)
	imwrite(uint8(noisy), gray(256), '../img/received.png');
	imwrite(uint8(corrected), gray(256), '../img/corrected.png');
endfunction