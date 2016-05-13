function Number_Recognition(image_URL)
Image=imread(image_URL);
%x=imread(image_URL);
%Image=im2bw(x);
Cropped_Image=crop(Image);
imshow(Cropped_Image)
vector_Centroid=img_centroid(Cropped_Image,6,6);

trained_data=dlmread('C:\Users\HP WIN 8\Desktop\trained_data.txt');

Lables=dlmread('C:\Users\HP WIN 8\Desktop\Lables.txt');
[r,c]=size(trained_data);
Error=1000000000;

for i=1:r
    sum=0;
    for j=1:c
      sum=sum+(abs( trained_data(i,j)- vector_Centroid(1,j)) )^2;
    end
    if sum<Error
        number=i;
        Error=sum;
    end
end
'number is ='
Lables(number)


end
