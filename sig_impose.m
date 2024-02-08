function sig_impose()

sign=imread('Sign.jpg');
I= imread('Angad.jfif');
I1 = I;     %copy
I2 = I;     %copy

sign1 = sign<50;       %converting signature to be binary, 1=sig, 0=bg
sign1 = sign1 * 255;   % converting to 8-bit for display

[row, col, dim] = size(sign1)
r_offset = 100;             %signature can be place at anywhere of I
c_offset = 80;              %signature can be place at anywhere of I

x0 = 1 + c_offset;          % column minimum
x1 = col + c_offset;        % column maximum
y0 = 1 + r_offset;          % row minimum
y1 = row + r_offset;        % row maximum

I1(y0:y1,x0:x1,1:3) = I1(y0:y1,x0:x1,1:3) - uint8(sign1(:,:,1:3)); % bright signature
I2(y0:y1,x0:x1,1:3) = I2(y0:y1,x0:x1,1:3) + uint8(sign1(:,:,1:3)); % darker sig

figure(3), 
subplot(2,3,1), imshow(sign), title('Signature')
subplot(2,3,2), imshow(I), title('Image')
subplot(2,3,3), imshow(I1), title('Sig-on-Img')
subplot(2,3,4), imshow(sign1), title('inverted-Sig')
subplot(2,3,5), imshow(I2), title('Sig-on-Img')