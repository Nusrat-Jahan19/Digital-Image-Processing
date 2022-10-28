%Read an Image
a = imread('panda.jpg');
Img=rgb2gray(a);

figure,imshow(a);
figure,imshow(Img);

I = double(Img);

%Design the Gaussian Kernel

prompt='Enter the sigma value:';
sigma=input(prompt);

%Kernel size(3X3 matrix)
sz = 3;
[x,y]=meshgrid(-sz:sz,-sz:sz);

M = size(x,1)-1;
N = size(y,1)-1;
Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel= exp(Exp_comp)/(2*pi*sigma*sigma);

%Initialize
Output=zeros(size(I));
%Pad the vector with zeros
I = padarray(I,[sz sz]);

%Convolution
for i = 1:size(I,1)-M
    for j =1:size(I,2)-N
        Temp = I(i:i+M,j:j+M).*Kernel;
        Output(i,j)=sum(Temp(:));
    end
end

Output = uint8(Output);
figure,imshow(Output);

title('After Gausian Filter');
imwrite(Output,'D:\Fall 2022\DIP Lab\Output_image.jpg');
imshow(Output);