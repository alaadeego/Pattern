I=imread('cameraman.tif');
I4=imfilter(I,sobel);

I5=imfilter(I,prewitt);

I6=imfilter(I,laplacian );

I_noise=imnoise(I,'gaussian',0.25);
%BW = edge(I,'sobel');
sobel = fspecial( 'sobel');
prewitt = fspecial( 'prewitt');
laplacian = fspecial( 'laplacian');

I1=imfilter(I_noise,sobel);

I2=imfilter(I_noise,prewitt);

I3=imfilter(I_noise,laplacian );


t=100;
matt4=max(I4,t);
matt4(matt4==t)=0;

matt5=max(I5,t);
matt5(matt5==t)=0;

matt6=max(I6,t);
matt6(matt6==t)=0;


subplot(3,4,1);
imshow(I);

subplot(3,4,2);
imshow(I_noise);

subplot(3,4,3);
imshow(I1);

subplot(3,4,4);
imshow(I2);
subplot(3,4,5);
imshow(I3);



subplot(3,4,6);
imshow(~matt4);

subplot(3,4,7);
imshow(~matt5);

subplot(3,4,8);
imshow(~matt6);

