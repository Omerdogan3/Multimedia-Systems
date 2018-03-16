clear all;
clc;

%Enter the name of the image then select the size of the filter.
clc;
clear;
original_image = 'Name of the image: '; %Prompts the screen.
original_image = input(original_image,'s'); %Gets user input
original_image = imread(original_image); %Reads the image
original_image = im2double(original_image); %Converts it to integer


up_image = im2double(original_image);
right_image = im2double(original_image);

up_filter = zeros(5,5);
up_filter(1,3) = 1;

up_image = conv2(original_image, up_filter);
up_image = up_image(:,3:end-3);

right_filter = zeros(7,7);
right_filter(4,7) = 1;
right_image = conv2(original_image, right_filter);
right_image = right_image(4:end-3,:);

subplot(1,3,1);imshow(original_image);
subplot(1,3,2);imshow(up_image);
subplot(1,3,3);imshow(right_image);