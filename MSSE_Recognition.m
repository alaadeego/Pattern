function MSSE_Recognition()
image=imread('C:\Users\HP WIN 8\Desktop\test data\3_2.bmp');

Cells=cell(10,1);
file_read=dlmread('C:\Users\HP WIN 8\Desktop\trained_data.txt');
j=1;
for i=1:19:190
Cells{j,1}=file_read(i:i+18,:);    
j=j+1;
end    
    cimage=crop(image);
Featur_Vector=img_centroid(cimage,3,3);
Featur_Vector(end+1)=1;
result=0;
count=0;

for i=1:10
    class=Cells{i,1};
    'class size'
    size(class)
    'feature vector size'
    size(Featur_Vector)
    Mul=class'*Featur_Vector';
    'mul ============='
    size(Mul)
    positive=find(Mul >0);
    sz=size(positive);
    if sz>=1
       count=count+1;
       result=i;
    end 
    
end
if count==1
    'Number is ' 
    result
else if count >1
    'class undefiened'
else
   'new Class '
end
        
        
        







end