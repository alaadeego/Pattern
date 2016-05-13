function k_means2()
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

' DataMatrix'
size(DataMatrix)
Cell =cell(4,1);
k=4;
I=[];
[I,C]=kmeans(DataMatrix,k);
 'I'
[row,col]=size(I);
for i=1:k
    v=[];
    for j=1:row
        if I(j)==i
          v(end+1)=lable(j); 
         end
     end
     Cell{i,1}=v;
     
 end
 
 for i=1:k
     'cluster'
     i
     v=strcat(Cell{i,1})
 end
 



end
