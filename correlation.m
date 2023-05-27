function [ new_image ] = correlation( old_image )
filter = [1 1 1;1 1 1;1 1 1];
filter=double(filter);

p=1;
old_image = double(padarray(old_image,[p,p]));
[h , w , l] =size(old_image);
new_image = zeros(h,w,l);
if l==1
    for i=2:h-1
        for j=2:w-1
            s= old_image(i-1:i+1,j-1:j+1);
            sum1=sum(sum(s.*filter));
            new_image(i,j)=sum1;
            if new_image(i,j)>255
                new_image(i,j)=255;
            elseif new_image(i,j)<0
                new_image(i,j)=0;
            end
        end
    end
    
else
    
    for k=1:3
        for i=2:h-1
            for j=2:w-1
                s= old_image(i-1:i+1,j-1:j+1,k);
                sum1=sum(sum(s.*filter));
                new_image(i,j,k)=sum1;
                if new_image(i,j,k)>255
                    new_image(i,j,k)=255;
                elseif new_image(i,j,k)<0
                    new_image(i,j,k)=0;
                end
            end
        end
    end
end

new_image = uint8(new_image);
imshow(new_image);
end

