function [ ] = MidPoint(img)

[h,w,l]=size(img);
if l==1
noisy_img=imnoise(img,'gaussian');
%figure,imshow(noisy_img);
img=padarray(img,[1,1]);
[h,w]=size(img);
 
for i=2:h-1
    for j=2:w-1
        out=img(i-1:i+1,j-1:j+1);
       a=max(out(:));
       b=min(out(:));
       img(i,j)=(a+b)/2;
    end
end
imshow(img);
else
  
noisy_img=imnoise(img,'gaussian');
%imshow(noisy_img);
img=padarray(img,[1,1]);
[h,w,l]=size(img);
 for k=1:3
 for i=2:h-1
    for j=2:w-1
        out=img(i-1:i+1,j-1:j+1,k);
        a=max(out(:));
        b=min(out(:));
        img(i,j,k)=(a+b)/2;
    end
 end
 end
imshow(img);
end
end


