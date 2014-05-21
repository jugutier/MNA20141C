function [image map] = loadData(file)
	map = colormap(gray(255));
	image = load(file);
endfunction
