img=imread('cameraman.tif');
img_n=imnoise(img,'salt & pepper',0.1);
h=fspecial('average',[3 3]);

smothed1=imfilter(img_n,h);


smothed2=medfilt2(img_n,[3 3]);

smothed3=ordfilt2(img_n,2,true(3));

figure;
subplot(4 , 4,1);
imshow(img);

subplot(4 , 4,2);
imshow(img_n);

subplot(4 , 4,3);
imshow(smothed1);

subplot(4 , 4,4);
imshow(smothed2);


subplot(4 , 4,5);
imshow(smothed3);


%sh1=fspecial('perwitt');

sh2=fspecial('sobel');

%smothed4=imfilter(img_n,sh1);


smothed5=imfilter(img_n,sh2);


%subplot(4 , 4,6);
%imshow(smothed4)

subplot(4 , 4,7);
imshow(smothed5)
