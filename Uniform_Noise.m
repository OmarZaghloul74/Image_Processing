function [ result ] = Uniform_Noise( image,a,b )
[H W L]=size(image);

pixels=round((1/(b-a))*H*W);
for i = 1:255
    
    for j = 1 :pixels
        r=ceil(rand(1,1)*H);
        c=ceil(rand(1,1)*W);
        image(r,c)=image(r,c)+i;
    end
end
result=contrast_stretching(image);
result=uint8(result);
end

