function cimg=crop(img_Matrix)  
    [r,c]=size(img_Matrix);
    
    leftj=500;
    rightj=-500;
    topi=500;
    downi=-500;
    
    for i=drange(1:r)
        for j=drange(1:c)
            if img_Matrix(i,j)==1
                 img_Matrix(i,j)=0;
            else
                leftj=min(leftj,j);
                rightj=max(rightj,j);
                topi=min(topi,i);
                downi=max(downi,i);
                 img_Matrix(i,j)=1;
            end
           
        end
    end
       %Crop:
      cimg=img_Matrix(topi:downi,leftj:rightj);
    %  imshow(cimg);
    
end