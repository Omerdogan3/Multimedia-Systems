%Enter the name of the image then select the size of the filter.
clc;
clear;
original_image = 'Name of the image: '; %Prompts the screen.
image_name = input(original_image,'s'); %Gets user input
original_image = imread(strcat('sample images2/', image_name)); %Reads the image
original_image = im2double(original_image); %Converts it to integer

filter_size = 3;
filterX = [0,0,0;1,-1,0;0,0,0];
filterY = [0,0,0;0,-1,0;0,1,0];

derivativeX = conv2(original_image,filterX);
derivativeY = conv2(original_image,filterY);

result = zeros(size(original_image));

for i=1:size(original_image,1)
    for j=1:size(original_image,2)
        result(i,j) = sqrt(derivativeX(i,j)*derivativeX(i,j) + derivativeY(i,j)* derivativeY(i,j));
    end
end

subplot(1,4,1);
imshow(original_image); title(image_name);
subplot(1,4,2);
imshow(derivativeX); title('Derivative X');
subplot(1,4,3);
imshow(derivativeY); title('Derivative Y');
subplot(1,4,4);
imshow(result); title('Result');