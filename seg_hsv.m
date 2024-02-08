function seg_hsv()

%imRGB = imread('Angad.jfif');
imRGB = imread('Angad.jfif');
imHSV = rgb2hsv(imRGB);                 % convert RGB image to HSV space

figure(1),                              % display  images in 2 colour spaces
subplot(2,3,1), imshow(imRGB); title('RGB');
subplot(2,3,2), imshow(imHSV); title('HSV');

% define thresholds that can be found using 'improfile'
hT = 0.8;
sT = 0.5;
vT = 0.2;
Lface= imHSV(:,:,3) > hT & imHSV(:,:,1) <vT & imHSV(:,:,2) < sT;
Lface255 = Lface * 255;                    % converting [0.1] to [0,255]
subplot(2,3,6), imshow(Lface255); title('mask')

% segment face using mask
imFace(:,:,1) = imRGB(:,:,1) .* uint8(Lface);
imFace(:,:,2) = imRGB(:,:,2) .* uint8(Lface);
imFace(:,:,3) = imRGB(:,:,3) .* uint8(Lface);
subplot(2,3,3), imshow(imFace); title('segmented Face')

% removal noise below neck, using 'improfile' to determine
imFace(207:end,:,:) = 0;

subplot(2,3,4), imshow(imFace); title('Face only')
subplot(2,3,5), imshow(edge(rgb2gray(imFace))); title('Edge')
