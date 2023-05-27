function [new_image] = powers(image,gamma)
[H, W, L]=size(image);
new_image=zeros(H,W,L);
image=im2double(image);
new_image=im2double(new_image);
for i = 1 : H
    for j = 1 : W
        if L==3
         new_image(i,j,1)=1*image(i,j,1).^gamma;
          new_image(i,j,2)=1*image(i,j,2).^gamma;
           new_image(i,j,3)=1*image(i,j,3).^gamma;
        else
            new_image(i,j)=1*image(i,j).^gamma;
        end
           
    end
end

%image=im2uint8(image);
new_image=im2uint8(new_image);
imshow(new_image);

end

