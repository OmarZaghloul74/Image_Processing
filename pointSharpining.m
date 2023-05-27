function [image1]=pointSharpining(img)
image=double(img);
filter=[0 -1 0 ; 1 5 -1 ; 0 -1 0];
image1=imfilter(image,filter);
image1=uint8(image1);
imshow(image1);
end
