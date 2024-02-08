function xg_svm_face()

%im0 = imread('Angad.jfif');
im0 = imread('Angad.jfif');
im0 = imresize(im0,0.25);       % making the process faster
[M, N, dim] = size(im0)
im =  rgb2hsv(im0);     %double(im0); %converting to HSV colour space
figure(1),
subplot(2,4,1), imshow(im0), title('RGB');
subplot(2,4,2), imshow(im), title('HSV');

% Converting an image into a 2D table with each row has RGB values
hs =[reshape(im(:,:,1),1,[]);...
        reshape(im(:,:,2),1,[]); %...   
        reshape(im(:,:,3),1,[])];

[dim, no] = size(hs)
X = hs';
X(1:10,:)

Y = zeros(no,1);
Y = (X(:,1) <0.2);      %define ground truth with Hue<0.2

svm = fitcsvm(X,Y);     %train SVM
cv = crossval(svm)
loss = kfoldLoss(cv)
[~, score] = kfoldPredict(cv);

predX = (score(:,2)>0);     %find face pixels
predX = predX .* X;

% reshape back to image resolution (50x50)
im_pred(:,:,1) = reshape(predX(:,1),M,N);
im_pred(:,:,2) = reshape(predX(:,2),M,N);
im_pred(:,:,3) = reshape(predX(:,3),M,N);
im_pred_rgb = hsv2rgb(im_pred);
subplot(2,4,3), imshow(mat2gray(im_pred)), title('Predicted HSV');
subplot(2,4,4), imshow(mat2gray(im_pred_rgb)), title('Predicted RGB');

% display edges
%im_eg = rgb2gray(im_pred_rgb);
im_eg = rgb2gray(im_pred);
subplot(2,4,5), imshow(edge(im_eg,'sobel')); title('Edge= Sobel');
im22 = edge(im_eg,'canny');
[row, col] = size(im22);
im22(end-20:end,:) = 0;
subplot(2,4,6), imshow(im22); title('Edge= Canny');
subplot(2,4,7), imshow(edge(im_eg,'roberts')); title('Edge= Roberts');
subplot(2,4,8), imshow(edge(im_eg,'log')); title('Edge= LOG');


