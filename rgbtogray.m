function [gray] = rgbtogray(img)
[H , W , L] = size(img);
gray = zeros(H,W);
gray = double(gray);
for a=1:H
    for b=1:W
        
        gray(a,b) = (img(a,b,1)+img(a,b,2)+img(a,b,3))/3;
       
        
        
    end
end
gray = uint8(gray);
imshow(gray);
end

