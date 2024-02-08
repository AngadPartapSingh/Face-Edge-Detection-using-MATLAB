function seg_hsv_pp()

imRGB = imread('Angad.jfif');
%imRGB = imread('Angad.jfif');
imHSV = rgb2hsv(imRGB);                 % convert RGB image to HSV space

hT = 0.80;                          % Blue hue threshold 

bluePP = imHSV(:,:,3)> hT;           % 1 = hue
bluePP = bluePP *255;                 % Convert to 8-bit from [0,1

figure(1),                          % display  images in 2 colour spaces
subplot(1,3,1), imshow(imRGB); title('RGB');
subplot(1,3,2), imshow(imHSV); title('HSV');
subplot(1,3,3), imshow(bluePP); title('Seg-Blue')


