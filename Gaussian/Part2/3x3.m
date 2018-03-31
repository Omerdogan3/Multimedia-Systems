clc;
clear;

original_image = imread('Baboon.bmp');
original_image = im2double(original_image);

filter = [1,2,1;2,4,2;1,2,1]; % You can change the output with changing filter values.
div = sum(filter(:));

detail_image = zeros(size(original_image));
detail_image = im2double(detail_image);
total = 0;
for i= 1:size(original_image,1)-2
    for j=1:size(original_image,2)-2
        total = 0;
        for x=1:3
            for y=1:3
                total = total + original_image(i+x-1,j+y-1) * filter(x,y);
            end
        end   
        detail_image(i,j) = total / div;
    end
end

detail_image = detail_image(1:end-fix(size(filter,1)),1 :end-fix(size(filter,2)));

subplot(121);imshow(original_image);title('Original Image');
subplot(122);imshow(detail_image);title('Applied Filter');