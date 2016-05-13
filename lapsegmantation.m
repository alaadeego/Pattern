img=imread('cameraman.tif');

sh2=fspecial('laplacian');
smothed=imfilter(img,sh2);

[H,T,R] = hough(smothed,'ThetaResolution',0.5);
H
plot(H)