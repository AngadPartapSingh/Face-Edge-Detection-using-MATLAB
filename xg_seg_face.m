function xg_seg_face()

im = imread('Angad.jfif');

r_th=10;
g_th=10;
b_th=10;
bright=200;
[row, col, dim] = size(im)

im_seg = zeros(row,col, dim);

for i=1: row
    for j=1:col,
        if abs(im(i,j,1)-220)<r_th & abs(im(i,j,2)-187)<g_th ...
                & (abs(im(i,j,3)-165)<b_th)
            im_seg(i,j,1:3) = im(i,j,1:3);
        end
        
        if im(i,j,1)>bright & im(i,j,2)>bright & im(i,j,3)>bright
            im_seg(i,j,1:3) = im(i,j,1:3);
        end
    end
end

im_seg2= imbinarize(im_seg);
im_seg3 = imfill(im_seg2,'holes');

figure(1),
subplot(1,3,2),imshow(uint8(im_seg)); title('Segmented')
subplot(1,3,3),imshow(uint8(im_seg)); title('Segmented-no-holes')
subplot(1,3,1),imshow(im); title('Original')