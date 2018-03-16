%Enter the name of the image then select the size of the filter.
clc;
clear;
original_image = 'Name of the image: '; %Prompts the screen.
original_image = input(original_image,'s'); %Gets user input
original_image = imread(original_image); %Reads the image
original_image = im2double(original_image); %Converts it to integer

%If entered filter size is not the integer value. Gives an error
filter_size = str2double(input('Please enter size of the filter: ','s'));
if isnan(filter_size) || fix(filter_size) ~= filter_size
  disp('Please enter an integer')
end

tmp_image = zeros(size(original_image,1) + fix(filter_size)+1, size(original_image,2) + fix(filter_size)+1);
tmp_image = im2double(tmp_image); %Converts it to integer
%Extention size changes according to user input. 
%if you enter 7 as the filter size, it extends the original image 2 pixels from each sides.



%Copy all elements from the original image to tmp_image, pixel by pixel.
for i=1:size(original_image,1)
    for j=1:size(original_image,2)
        tmp_image(i+fix(filter_size/2),j+fix(filter_size/2))=original_image(i,j); 
    end
end

%Filter generated according to user input.
filter = ones(filter_size);

result_image = zeros(size(original_image)); %Result array.
result_image = im2double(result_image); %Converts it to integer
total = 0; %Temporary total value.
for i= 1:size(tmp_image,1)-filter_size-1
    for j=1:size(tmp_image,2)-filter_size-1
        total = 0;
        for x=1:filter_size
            for y=1:filter_size
                total = total + tmp_image(i+x-1,j+y-1) * filter(x,y);
            end
        end   
        result_image(i,j) = total * 1/(filter_size*filter_size);
    end
end

% To remove black padding around the image, i have resized the result
% array.
result_image = result_image(fix(filter_size/2):end-fix(filter_size/2), fix(filter_size/2):end-fix(filter_size/2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Q1.m%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
original_image = original_image(fix(filter_size/2):size(original_image,1)-fix(filter_size/2), fix(filter_size/2):size(original_image,2)-fix(filter_size/2));
subtracted_image = zeros(size(original_image));
subtracted_image = im2double(subtracted_image);
for i=1: size(original_image,1)
    for j=1: size(original_image,2)
        subtracted_image(i,j) = original_image(i,j) - result_image(i,j);
    end
end
subplot(121);imshow(original_image);
subplot(1,2,2);imshow(subtracted_image);