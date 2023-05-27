function[]=MAX_Filter(image)
image=padarray(image,[1,1]);
[H , W ,L]=size(image);
B=zeros(H , W);
if L==1
    for i=2:H-1
        for j=2:W-1
            temp=image(i-1:i+1,j-1:j+1);
            B(i,j)=max(temp(:));
        end
    end
    B=uint8(B);
    imshow(B);
else
    for k=1:3
        for i=2:H-1
            for j=2:W-1
                temp=image(i-1:i+1,j-1:j+1,k);
                B(i,j,k)=max(temp(:));
            end
        end
    end
    B=uint8(B);
    imshow(B);
end
            
           
        
    

