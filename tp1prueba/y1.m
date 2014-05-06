function [ X ] = y1 (a0, a1, a2, t)
X = exp(a0 + a1*t + a2*(t.^2));
end