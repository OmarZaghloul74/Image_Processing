function [new_img]= contrast_stretching(img)

[h ,w, l]=size(img);
    new_img=zeros(h,w,l);
    old_min=double(min(min(img)));
    old_max=double(max(max(img)));
    new_min=double(0);
    new_max=double(255);
    
    m=(new_max-new_min)/(old_max-old_min);
    
    for i=1 :h
        for j=1 : w
            new_img(i,j)=(img(i,j)-old_min)* m+new_min;
        end
    end
   new_img=uint8(new_img);
   imshow(new_img);
end
