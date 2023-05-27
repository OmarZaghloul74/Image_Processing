function [ft] = fourier_transform(image)
ft   = fft2(image) ;
fshift = fftshift(ft);
fabs =abs(fshift) ;
flog = log(fabs+1) ;
fm = mat2gray(flog) ;
imshow (fm);
end
