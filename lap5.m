I=imread('cameraman.tif');
I_noise=imnoise(I,'gaussian',0.25);
I2_noise=imnoise(I,'salt & pepper',0.25);
f1=wiener2(I_noise,[3,3],0.25);
f2=wiener2(I2_noise,[3,3],0.25);

subplot(2,2,1);
imshow(I);

subplot(2,2,2);
imshow(I_noise);

subplot(2,2,3);
imshow(f1);

subplot(2,2,4);
imshow(f2);
