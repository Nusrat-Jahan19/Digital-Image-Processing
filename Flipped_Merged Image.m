clc
clear all
close all
a=imread('input.jpg');
subplot(121)
imshow(a);
title('Original image');
[r c z]=size(a);

i=1;
for j=c:-1:1
    b(i,:,:)=a(j,:,:);
    i=i+1;
end   

subplot(122)
imshow(b);
title('Flipped image');
imwrite(b, 'flipped.jpg');

z=[a;b];
figure; 
imshow(z);
title('Merged image');
imwrite(z, 'output.jpg');
