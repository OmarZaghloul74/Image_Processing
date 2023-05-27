function [image1]=horizontal_sobel(img)
image=double(img);
filter=[-1 -2 -1 ; 0 0 0 ; 1 2 1];
image1=imfilter(image,filter);
image1=uint8(image1);
imshow(image1);
end
