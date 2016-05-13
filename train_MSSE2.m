function [mean_matrix, cov_matrix]=train_MSSE2()
 my=dir('C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\*.bmp');
 s1='C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\';

nfiles=length(my);
trained=[ ];
for i=1:nfiles
    cname=my(i).name;
    img=imread(strcat(s1,cname));
    cimg=crop(img);
    v=img_centroid(cimg,3,3);
    trained=[trained;v];
end

j=1;
 mean_matrix=[];
 cov_matrix=cell(10 , 1);
for i=1:10:99
 class=trained(i:i+9,:);  
 v=Mean1(class);
 mean_matrix=[ mean_matrix;v];
 covclass=cov(class);
 cov_matrix{j,1}=covclass;
 j=j+1;
end
'size mean matrix '
size(mean_matrix)
'Size cov matrix'
cov_matrix;
'Done'
end 

function v=Mean1(m)
[r,c]=size(m);
v=[];
sum=0;
for i=1:c
    for j=1:r
        sum=sum+m(j,i);
       
    end
    v(end+1)=sum/r;
    sum=0;
end   

    
end