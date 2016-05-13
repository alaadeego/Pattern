function count=Count_car(img)
%img=imread(URL);

imshow(img)
darkCar = rgb2gray(img);
%threshold value 

darkCarValue =50;

% Remove dark cars.
noDarkCar = imextendedmax(darkCar, darkCarValue);

%any small objects from the dark car will be removed
%We removed small objects by comparing the size of our "disk" which is
%created by the function strel(). The strel() create morphological structuring element such as 'ball', 'square', 'line', etc.
%But actually the real worker here is imopen().

sedisk = strel('disk',2);
% Remove lane markings and other non-disk shaped structures.
noSmallStructures = imopen(noDarkCar, sedisk);  %performs morphological opening 
% Remove small structures.
noSmallStructures = bwareaopen(noSmallStructures, 150);


count=0;
[row,col]=size(noSmallStructures);


for i=1:row
    for j=1:col
        if(noSmallStructures(i,j)==1)
            count=count+1;
        end
    end

 
    
    

subplot(221); imshow(darkCar)
subplot(222); imshow(noDarkCar)
subplot(223); imshow(noSmallStructures)


end