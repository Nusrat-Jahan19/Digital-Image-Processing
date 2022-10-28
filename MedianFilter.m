A=imread('G:\CSE 4228\Lab 4\noisedChips.png');
figure,imshow(A);

[r,c] = size(A);

Replica = zeros(r + 2, c + 2);
for x = 2 : r + 1
    for y = 2 : c + 1
        Replica(x,y) = A(x - 1, y - 1);
    end
end

B = zeros(r, c);
array=zeros(9,1);
for x = 1 : r
    for y = 1 : c
        inc=1;
        for i = 1 : 3
            for j = 1 : 3
                q = x - 1;     w = y -1;
                array(inc) = Replica(i + q, j + w);
                inc=inc+1;
            end
        end
        B(x, y) = max(array(:));
    end
end

figure, imshow(uint8(B));