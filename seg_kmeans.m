function seg_kmeans()

%Irgb = imread('peppers.png');
Irgb = imread('Angad.jfif');
%Irgb = imread('endo3-3d.jpg');

I = rgb2hsv(Irgb);
%I = Irgb;
% segment the image into k=2,3,5,10 regions
figure(1),
subplot(3,3,1), imshow(I), title('original');

I = uint8(I); % converting uint8 for the function of imsegkmeans

[L,Centers] = imsegkmeans(I,2); % 2 regions

B = labeloverlay(I,L);
subplot(3,3,2), imshow(B), title('K=2');

[L,Centers] = imsegkmeans(I,3); % 3 regions
B = labeloverlay(I,L);
L3 = (L==1);
size(L3)
im33 = double( I) .* double(L3);

subplot(3,3,3), imshow(mat2gray(im33)), title('K=3');
ll=L;

[L,Centers] = imsegkmeans(I,5); % 5 regions
B = labeloverlay(I,L);
subplot(3,3,4), imshow(B), title('K=5');

[L,Centers] = imsegkmeans(I,7); % 7 regions
B = labeloverlay(I,L);
subplot(3,3,5), imshow(B), title('K=7');

[L,Centers] = imsegkmeans(I,10); % 10 regions
B = labeloverlay(I,L);
subplot(3,3,6), imshow(B), title('K=10');

[L,Centers] = imsegkmeans(I,6); % 10 regions
B = labeloverlay(I,L);
subplot(3,3,7), imshow(B), title('K=6');

[L,Centers] = imsegkmeans(I,8); % 10 regions
B = labeloverlay(I,L);
subplot(3,3,8), imshow(B), title('K=8');

[L,Centers] = imsegkmeans(I,11); % 10 regions
B = labeloverlay(I,L);
subplot(3,3,9), imshow(B), title('K=11');



figure(2),
L8 = (L==3);        % class 3 is for face
im8 = double(I) .* double(L8);
subplot(1,4,1), imshow(mat2gray(im8));
title('Class 3 (HSV)')
im4 = double(Irgb) .* double(L8);
subplot(1,4,2), imshow(mat2gray(im4))
title('Class 3 for RGB')
subplot(1,4,3), imshow(Irgb)
title('original')
eg = edge(rgb2gray(uint8(im4)));
subplot(1,4,4), imshow(eg)
title('Edge on rgb')

