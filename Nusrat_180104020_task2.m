%a
I = imread('cameraman.png');
figure();
subplot(2,2,1);
imshow(I);
title('Input image I');

[row,col]=size(I);
hist=zeros(1,256);
for i=1:row
    for j=1:col
        hist(I(i,j))=hist(I(i,j))+1;
    end
end

subplot(2,2,3);
bar(hist);
title('Histogram of Input image I');

I = im2double(I);
A = min(min(I)); %b
B = max(max(I)); %c
D = B - A; %d

%e
M = 255;
R = I - A;
R = R./D;
R = R.*M;
R = R + A;
R = uint8(R);

%f
subplot(2,2,2);
imshow(R);
title('Output image R');

%g
[row,col]=size(R);
hist=zeros(1,256);
for i=1:row
    for j=1:col
        hist(R(i,j)+1)=hist(R(i,j)+1)+1;
    end
end

subplot(2,2,4);
bar(hist);
title('Histogram of Output image R');