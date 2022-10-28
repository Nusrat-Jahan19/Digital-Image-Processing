S = im2double(rgb2gray(imread('coins.jpg')));

% sigma = 0.6 is used

h = [0.0000    0.0004    0.0017    0.0004    0.0000;
     0.0004    0.0275    0.1102    0.0275    0.0004;
     0.0017    0.1102    0.4421    0.1102    0.0017;
     0.0004    0.0275    0.1102    0.0275    0.0004;
     0.0000    0.0004    0.0017    0.0004    0.0000];

R = imfilter(im2double(S), h);

figure;
subplot(1,2,1);
imshow(S);
title('input');

subplot(1,2,2);
imshow(R);
title('blurred using gaussian filter');
