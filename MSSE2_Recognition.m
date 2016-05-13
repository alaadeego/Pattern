function MSSE2_Recognition()
image=imread('C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\7_2.bmp');

[mean_matrix, cov_matrix]=train_MSSE2();
cimg=crop(image);

max=-1;
indx=-1;
 X=img_centroid(cimg,3,3);
for i=1:10 
 Mk=mean_matrix(i,:);
 Ck= cov_matrix{i,1};
 p=prob1(Ck,Mk,X)
 
 if p>max
    max=p;
    indx=i;
 end
 
end
indx

end

function p=prob1(Ck,Mk,X)
'sssssssssssssssssssssssssssssssss'
size(Ck)
d=det(Ck);
d1=-1/2*log(d)
Ckp= power(Ck,-1)
'X Size -----------------------'
size(X')

'Ckp Size -----------------------'
size(Ckp)

'Mk Size -----------------------'
size(Mk)


d2=X*pinv(Ck)*Mk';
d3=-1/2.*(Mk*pinv(Ck)*Mk');
d4=-1/2.*(X*pinv(Ck)*X');
p=d1+d2+d3+d4;
end