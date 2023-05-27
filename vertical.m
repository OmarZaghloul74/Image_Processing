%line sharpining
function [image1]=vertical(img)
image=double(img);
filter=[0 0 0 ; 1 1 -1 ; 0 0 0];
image1=imfilter(image,filter);
image1=uint8(image1);
imshow(image1);
end
