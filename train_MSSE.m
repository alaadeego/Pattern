function Cells=train_MSSE()
 my=dir('C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\*.bmp');
 s1='C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\';

nfiles=length(my);
trained=[ ];
lable=[ ];
for i=1:nfiles
    cname=my(i).name;
    
    img=imread(strcat(s1,cname));
     cimg=crop(img);
    v=img_centroid(cimg,3,3);
    v(end+1)=1;
    trained=[trained;v];
  %   lable=[lable;cname(1)];
end

j=1;
b=ones(100,1);
Cells=cell(10,1);
for i=1:10:99
 Z=trained*-1;   
 Z(i:i+9,:)=trained(i:i+9,:);  
 W=(pinv(Z'*Z)*Z')*b;
 Cells{j,1}=W;
 j=j+1;
end

dlmwrite('C:\Users\HP WIN 8\Desktop\trained_data.txt', Cells);

 
    'Done'
end