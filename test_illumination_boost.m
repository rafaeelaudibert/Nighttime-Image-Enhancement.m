close all;

all_files = dir('./input_images/*.jpg');
for file = all_files'
    filename = file.name;
    
    figure, sgtitle([upper(filename(1)), lower(filename(2:end-4))]);
    I = imread(strcat('./input_images/', file.name));
    
    subplot(2,3,1), imshow(I), xlabel('Original Image');
    for i = 2:6
        subplot(2,3,i), imshow(illumination_boost(I, i)), xlabel(strcat('Lambda = ', int2str(i)));
    end
    saveas(gcf, strcat('./output_images/', filename(1:end-4)), 'jpg')
    saveas(gcf, strcat('./output_images/', filename(1:end-4)), 'fig')
end