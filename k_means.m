function k_means()
 my=dir('C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\*.bmp');
 s1='C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\';

nfiles=length(my);
DataMatrix=[ ];
lable=[ ];
for i=1:nfiles
    cname=my(i).name;
    img=imread(strcat(s1,cname));
    v=img_centroid(img,3,3);
    DataMatrix=[DataMatrix;v];
    lable=[lable;cname(1)];
end

 matrix1=[];matrix2=[];matrix3=[];matrix4=[];
 lable1=[];lable2=[];lable3=[];lable4=[];
 
%get the mean of matrix  1* 18 
M1=mean(DataMatrix);

% split mean  2 vector 
v1=M1+1;v2=M1-1;
 
 for i=1:100
    v=DataMatrix(i,:);
    res1= sum((v1-v).^2);
    res2= sum((v2-v).^2);
    if res1 < res2
         matrix1=[matrix1;v];
         lable1=[lable1;lable(i)];
    else
         matrix2=[matrix2;v];
         lable2=[lable2;lable(i)];
    end
    
    
 end
 
 M1=mean(matrix1);
 M2=mean(matrix2);
 % 4 split of 2 vector mean
 v1=M1+1;v2=M1-1;
 v3=M2+1;v4=M2-1;
 %build the 4 matrix
  for i=1:100
    v=DataMatrix(i,:);
    res1= sum((v1-v).^2);
    res2= sum((v2-v).^2);
    res3= sum((v3-v).^2);
    res4= sum((v4-v).^2);
    
    if res1<res2 && res1<res3  && res1<res4 
         matrix1=[matrix1;v];
         lable1=[lable1;lable(i)];
    elseif res2<res3  && res2<res4
         matrix2=[matrix2;v];
         lable2=[lable2;lable(i)];
    elseif res3<res4
          matrix3=[matrix3;v];
         lable3=[lable3;lable(i)];
              
    else
         matrix4=[matrix4;v];
         lable4=[lable4;lable(i)];
         
    end
    
    end
 
 M1=mean(matrix1);
 M2=mean(matrix2);
 M3=mean(matrix3);
 M4=mean(matrix4);
 %==============================
  for i=1:100
    v=DataMatrix(i,:);
    res1= sum((M1-v).^2);
    res2= sum((M2-v).^2);
    res3= sum((M3-v).^2);
    res4= sum((M4-v).^2);
    
    if res1<res2 && res1<res3  && res1<res4 
         matrix1=[matrix1;v];
         lable1=[lable1;lable(i)];
    elseif res2<res3  && res2<res4
         matrix2=[matrix2;v];
         lable2=[lable2;lable(i)];
    elseif res3<res4
          matrix3=[matrix3;v];
         lable3=[lable3;lable(i)];
              
    else
         matrix4=[matrix4;v];
         lable4=[lable4;lable(i)];
         
    end
    
    end
 
 
 
 
 %-------------------------------
%  Mn1=[];Mn2=[];Mn3=[];Mn4=[];
%  'befor while'
%  
%  
%  while Mn1 ~=M1 && Mn2~=M2 && Mn3~=M3 && Mn4~=M4
%      
%      
%    for i=1:100
%     v=DataMatrix(i,:);
%     res1= sum((M1-v).^2);
%     res2= sum((M2-v).^2);
%     res3= sum((M3-v).^2);
%     res4= sum((M4-v).^2);
%     
%     if res1<res2 && res1<res3 && res1<res4 
%          matrix1=[matrix1;v];
%          lable1=[lable1;lable(i)];
%     elseif res2<res3 && res2<res4
%          matrix2=[matrix2;v];
%          lable2=[lable2;lable(i)];
%     elseif res3<res4
%           matrix3=[matrix3;v];
%          lable3=[lable3;lable(i)];
%               
%     else
%          matrix4=[matrix4;v];
%          lable4=[lable4;lable(i)];
%          
%     end
% 
%     
%    end
%    
%     M1=Mn1;M2=Mn2;M3=Mn3;M4=Mn3;
%     
%     Mn1=mean(matrix1);
%     Mn2=mean(matrix2);
%     Mn3=mean(matrix3);
%     Mn4=mean(matrix4);
%  
% 
%  end
 
 'cluster 1'
 lable1
 
 'cluster 2'
 lable2
 
 'cluster 3'
 lable3
 
 'cluster 4'
 lable4
 
 
 
 
 
 
 
 
 
 

end
