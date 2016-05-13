function train_centroid()
 my=dir('C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\*.bmp');
 s1='C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\';

nfiles=length(my);
trained=[ ];
lable=[ ];
for i=1:nfiles
    cname=my(i).name;
    img=imread(strcat(s1,cname));
    %inshow(cimage);
    cimg=crop(img);
    v=img_centroid(cimg,6,6);
    trained=[trained;v];
     lable=[lable;cname(1)];
end

dlmwrite('C:\Users\HP WIN 8\Desktop\trained_data.txt',trained);
dlmwrite('C:\Users\HP WIN 8\Desktop\Lables.txt', lable);
 
    show='Done'
end
%black =0 , white=1;