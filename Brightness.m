function [ bright ] = Brightness( gray , offset ,option )
[H,W ]=size(gray);
bright=zeros (H, W) ;
bright=double(bright);
for i = 1 : H
  for  j = 1 : W
      if option==1
          bright(i,j)=gray(i,j)*offset ;
         
      end
      if option==2
          bright(i,j)=gray(i,j)+offset;
          
      end
      if option==3
          bright(i,j)=gray(i,j)/offset ;
         
      end
      if option==4
          bright(i,j)=gray(i,j)-offset;
          
      end
  end
end
bright=uint8(bright);
% figure,imshow(bright);
end
