
% Initially, the substance is concentrated in an unique point
siz = 30;
uN = zeros(siz, siz);
u0 = zeros(siz, siz);
u0(siz/2, siz/2) = 10000;
k = 0.025;
h = 0.01;
deltaT = 0.0001;
iterations = 300;

v0 = 2;
f0 = 1/3600;

colormap(gray(255));

for t = 2:iterations
    vX = wind(t, v0, f0)(1);
    vY = wind(t, v0, f0)(2);
    
    for i = 2:length(uN)-1
        for j = 2:length(uN)-1
            vXdUdX = vX*(u0(i+1, j) - u0(i-1, j))/(2*h);
            vXdUdY = vY*(u0(i, j+1) - u0(i, j-1))/(2*h);
            
            d2Ud2x = (u0(i+1, j) - 2*u0(i,j) + u0(i-1,j))/h^2;
            d2Ud2y = (u0(i,j+1) - 2*u0(i,j) + u0(i,j-1))/h^2;
            
            uN(i,j) = 2*deltaT*( k * ( d2Ud2x + d2Ud2y ) - vXdUdX - vXdUdY) + u0(i,j);
        endfor
    endfor
    
    image(uN);
    print("-dpng", strcat("../images/iter", num2str(t), ".png"));
    pause(0.001);
    u0 = uN;
endfor


