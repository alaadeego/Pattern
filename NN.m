function NN
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

T=zeros(100,10);
    indx=1;
for i=1:100
    T(i,indx)=1;
    if mod(i,10)==0
        indx=indx+1;
    end
        
end


img=imread('C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\0_1.bmp')
vi=img_centroid(img,3,3);

net=newff(DataMatrix',T',[3 5 10]);%creat network by random wieght  
'train'
net2=train ( net , DataMatrix', T'  ) ;
'==================='
output = sim (net2 ,  vi' ) ;
 
[v,i]=max(output);
i=i-1













end
