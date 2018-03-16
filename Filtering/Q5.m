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

result = zeros(size(original_image)); %Result array.
result = im2double(result); %Converts it to integer
total = 0; %Temporary total value.
for i= 1:size(tmp_image,1)-filter_size-1
    for j=1:size(tmp_image,2)-filter_size-1
        total = 0;
        filtering_window=zeros(filter_size,filter_size);
        for x=1:filter_size
            for y=1:filter_size
                filtering_window(x,y) = tmp_image(i+x-1,j+y-1) * filter(x,y);
            end
        end   
        filtering_window = sort(filtering_window);
        result(i,j) = filtering_window(fix(filter_size/2)+1,fix(filter_size/2)+1);
    end
end

% To remove black padding around the image, i have resized the result
% array.
result = result(fix(filter_size/2):end-fix(filter_size/2), fix(filter_size/2):end-fix(filter_size/2));


subplot(1,2,1);
imshow(original_image);
subplot(1,2,2);
imshow(result);