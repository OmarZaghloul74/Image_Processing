%line detection
function [image1]=left_diagonal_sobel(img)
image=double(img);
filter=[0 -2 -1 ; -1 0 1 ; 1 2 0];
image1=imfilter(image,filter);
image1=uint8(image1);
imshow(image1);
end
