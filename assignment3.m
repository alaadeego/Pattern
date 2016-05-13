image=imread('cameraman.tif');
pad_image=padarray(image,[4 4],'post');
pad_image=double(pad_image);
[r c]=size(pad_image);
   matrix=[];
for i=1:10:r
    for j=1:10:c
        subMatrix=pad_image(i:(i+9), j:(j+9));
        vector=[];
        for ii=1:10
            for jj=1:10
              vector=[vector;subMatrix(ii,jj)];
            end
        end
        matrix=[matrix vector];
    end   
end
mean_vector=Mean(matrix);
matrix_mean=[];


%size(mean_vector)

[r,c]= size(matrix);
for i=1:r
    for j=1:c
       matrix_mean(i,j)=matrix(i,j)-mean_vector(i);
    end
end
%'----------------------'
%size(matrix)
%size(matrix_mean)
cov_matrix=cov(matrix_mean);
[eig_vector,values]=eig(cov_matrix);
%eig_values=diag(values);
flip_matrix =fliplr(eig_vector);
y =flip_matrix'* matrix_mean';
'size ------------------'
%size(y)
y(: ,91:100)=0;
diff=y'* flip_matrix';
rmean_vector=repmat(mean_vector,1,676);
'rep ----------------'
%size(rmean_vector)
diff=diff+rmean_vector;

%size(diff)
finaldata=[];
r=1;
c=1;
 for i=1:676
    m=[];
    m=vec2mat(diff(:,i),10);
    'm -------------'
    size(m)
    
    finaldata(r:r+9,c:c+9)=m;
    
    c=c+10;
    if c>=260
        r=r+10;
        c=1;
    end
    
 end
 size(finaldata)
 
 imshow(uint8(finaldata));
 
 
