%line detection
function [image1]=vertical_sobel(img)
image=double(img);
filter=[0-1 0 1 ; -2 0 2 ; -1 0 1];
image1=imfilter(image,filter);
image1=uint8(image1);
imshow(image1);
end
