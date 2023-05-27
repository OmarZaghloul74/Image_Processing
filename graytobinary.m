function [ binary ] = graytobinary( gray )
[H,W ]=size(gray);
binary=zeros (H, W) ;
for i = 1 : H
  for  j = 1 : W
      if gray(i,j)>128
          binary(i,j)=1;
      end
      if gray(i,j)<=0
           binary(i,j)=0;
      end
  end
end
 binary=logical(binary);
 %figure,imshow(binary);
end

