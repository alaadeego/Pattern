%http://www.bogotobogo.com/Matlab/Matlab_Tutorial_Video_Processing_1_Object_Detection_by_Color_Thresholding.php
img1=imread('C:\Users\HP WIN 8\Desktop\imgproj\55.jpg');
img2=imread('C:\Users\HP WIN 8\Desktop\imgproj\ee.jpg');
% 586937037
plot_size = get(0,'ScreenSize');
fg = figure(1);
set(fg, 'Color', [1 1 1], 'Position', plot_size, 'Visible', 'on');

count1=Count_car(img1);
count2=Count_car(img2);
if count1>count2
    'image1'
else
    'image2'
end




%subplot(221); imshow(darkCar)
%subplot(222); imshow(noDarkCar)
%subplot(223); imshow(noSmallStructures)
