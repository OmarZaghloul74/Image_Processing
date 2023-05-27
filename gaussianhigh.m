function [NI ] =gaussianhigh( I,D0 )
    [H ,W ,L]=size(I);
    filter=zeros(H,W,L);
    for j=1:H
        for k=1:W
            dis=sqrt((j-(H/2)).^2+(k-(W/2)).^2);
            filter(j,k)=1-exp(-(dis)^2/(2*(D0^2)));
        end
    end

    fi=fft2(I);
    fi=fftshift(fi);
    reall=real(fi);
    imagin=imag(fi);
    nreall=filter.*reall;
    nimagin=filter.*imagin;
    NI=nreall(:,:)+i*nimagin(:,:);
    NI=fftshift(NI);
    NI=ifft2(NI);
    zz=mat2gray((abs(NI)));


        


end


