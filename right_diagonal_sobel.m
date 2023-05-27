%line detection
function [image1]=right_diagonal_sobel(img)
image=double(img);
filter=[-2 -1 0 ; -1 0 1 ; 0 1 2];
image1=imfilter(image,filter);
image1=uint8(image1);
imshow(image1);
end
