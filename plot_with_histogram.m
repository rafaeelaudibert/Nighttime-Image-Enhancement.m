close all;

filename = './input_images/city_at_night.jpg';
plot_title = 'CityAtNight - Lambda: 1.5';
lambda = 1.5;

I = imread(filename);
figure, sgtitle(plot_title);

subplot(2,2,1), imshow(I), title('Original Image');
subplot(2,2,2), histogram(I, 'BinLimits', [0, 255]), title('Original Histogram');

enhanced_I = illumination_boost(I, lambda);
subplot(2,2,3), imshow(enhanced_I), title('Enhanced Image');
subplot(2,2,4), histogram(enhanced_I * 255, 'BinLimits', [0, 255]), title('Enhanced Histogram');
