I  = imread('Image1.jpg');
I = im2double(I);

LF = [0 1 0;
    1 -4 1;
    0 1 0;
    ];

sobelFV = [
    1 0 -1;
    2 0 -2;
    1 0 -1
    ];

sobelFH = [
     1 2 1;
     0 0 0;
     -1 -2 -1
     ];

sobelT = 0.4;

avgF = [
        1/25 1/25 1/25 1/25 1/25;
        1/25 1/25 1/25 1/25 1/25;
        1/25 1/25 1/25 1/25 1/25;
        1/25 1/25 1/25 1/25 1/25;
        1/25 1/25 1/25 1/25 1/25
       ];

[row,col] = size(I);
LFI = ones(row, col);
sobelFIV =  ones(row, col);
sobelFIH =  ones(row, col);
sobelFI = ones(row, col);
avgFI = ones(row, col);
powerLawTansI = ones(row, col);

for i = 1:row-2
    for j = 1:col-2
        temp = I(i:i+2,j:j+2);
        filtered = temp .* LF;
        LFI(i+1,j+1) = sum(filtered(:));    
    end    
end

b = LFI;
c = I - LFI;

% Sobel
for i = 1:row-2
    for j = 1:col-2
        temp = I(i:i+2,j:j+2);
        filteredV = temp .* sobelFV;
        filteredH = temp .* sobelFH;
        sobelFIV(i+1,j+1) = sum(filteredV(:));  
        sobelFIH(i+1,j+1) = sum(filteredH(:));  
    end    
end


for i = 1:row
    for j = 1:col
        dis = sqrt((sobelFIH(i,j)^2 + sobelFIV(i,j)^2));
        
        if dis > sobelT
            sobelFI(i,j) = dis;
        else
            sobelFI(i,j) = 0;
        end
     end    
end
d = sobelFI;


% AvgFilter
for i = 1:row-4
    for j = 1:col-4
        temp = d(i:i+4,j:j+4);
        filtered = temp .* avgF;
        avgFI(i+2,j+2) = sum(filtered(:));   
    end    
end

e = avgFI;
f = c .* e;
g = I + f;

% Power Law Transform
cnst = 1;
gamma = 0.5;
for i = 1:row
    for j = 1:col
        powerLawTansI(i,j) = cnst*I(i,j)^gamma;  
    end
end
h = powerLawTansI;


out = subplot(2,4,1);
imshow(I);
title('Image1');
subplot(2,4,2);
imshow(b,[]);
title('Image2');
subplot(2,4,3);
imshow(c);
title('Image3');
subplot(2,4,4);
imshow(d);
title('Image4');
subplot(2,4,5);
imshow(e);
title('Image5');
subplot(2,4,6);
imshow(f);
title('Image6');
subplot(2,4,7);
imshow(g);
title('Image7');
subplot(2,4,8);
imshow(h);
title('Image8');