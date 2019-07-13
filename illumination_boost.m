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

%% Process the image with a logarithmic scaling function
I1 = (max(max(max(X))) ./ log(max(max(max(X))) + 1)) .* log(X + 1);

%% Use a non-complex exponential function to modify the local constrast and attenuate the high-intensities of the input image
I2 = 1 - exp(-X);

%% Use a LIP model, adapting it to the nature of the image, using the lambda parameter
I3 = (I1 + I2) ./ (lambda + (I1 .* I2));

%% Compute a modified CDF-HSD function to increase the brightness of dark regions in the image
I4 = erf(lambda * atan(exp(I3)) - 0.5 * I3);

%% Apply a normalisation function, as I4 is not in a well-defined range (almost white)
I5 = (I4 - min(min(min(I4)))) ./ (max(max(max(I4))) - min(min(min(I4))));
end