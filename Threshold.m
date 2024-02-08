function angad()
 
img = imread('Angad.jfif');
im1=img;

index = find (img(:,:,1) > 150);
img(index) = 0;

figure(1), 
subplot(1,2,1), imshow(im1), title('original')
subplot(1,2,2), imshow(img), title('Threshold')
