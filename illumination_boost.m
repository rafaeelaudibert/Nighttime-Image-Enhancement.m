function [I5] = illumination_boost(X, lambda)
% Enhances an image illumination using the method proposed at
% Nighttime image enhancement using a new illumination boost algorithm
% by Al-Ameen, Zohair
%
% Parameters:
%   X: RGB Image
%   lambda: Factor used in the equations I3 and I4
%% Convert image to double, even if it is already a double
X = im2double(X);

I1 = (max(max(max(X))) ./ log(max(max(max(X))) + 1)) .* log(X + 1);
I2 = 1 - exp(-X);
I3 = (I1 + I2) ./ (lambda + (I1 .* I2));
I4 = erf(lambda * atan(exp(I3)) - 0.5 * I3);
I5 = (I4 - min(min(min(I4)))) ./ (max(max(max(I4))) - min(min(min(I4))));
end