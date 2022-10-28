a=imread('G:\CSE 4228\practice codes\mr_bean_filter.jpg');
a=rgb2gray(a);
imshow(a);
prompt='Enter the sigma value:';
sigma=input(prompt)
figure;
B = imgaussfilt(a,sigma);
imshow(B);
figure;
imshow(abs(B-a),[0 1]);