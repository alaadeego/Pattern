function ChainCode()
 train_matrix=train_ChainCode ();
  image=imread('C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\1_1.bmp');
  image=crop(image);
  image=1-image;
  [r c]=size(image);
  [indr,indc]=find(image==1);
   contour = bwtraceboundary(image ,[indr(1), indc(1)],'N');
   [contourRow,contourCol]=size(contour);
   
   
   
   
    % --------------Calculate Center of Centroid-------------------
     v=regionprops(image,'Centroid');
     xc=v.Centroid(1);
     yc=v.Centroid(2);
     
     %----------------Calculate R--------------------
     R=-1;
     
     for i=1:contourRow
       
              point=contour(i,:);
              r=sqrt((point(2)-yc)^2+(point(1)-xc)^2);
              R=max(R,r);
     end
    
     % ---------------- Sector and track----------------
      image_Cell=cell(4,8);
      [Cr,Cc]=size(image_Cell);
      % initaial vector of zeros
      vzeros=zeros(8,1);
      for i=1:Cr
          for j=1:Cc
               image_Cell{i,j}=vzeros;
          end
      end
     
     for i=1:contourRow-1
          point=contour(i,:);
          nextpoint=contour(i+1,:);
          x=point(1);y=point(2);
          m=(y-yc)/(x-xc);
          r=sqrt(((y-yc)^2)+((x-xc)^2));
          T=ceil((r/R)*4);
          
          ang=(atan(m)*(180/pi));   
          if (ang<0)
             ang=ang+360;
          end
          S=floor((ang/360)*8)+1;
          
         
           if x>nextpoint(1) && y<nextpoint(2)
                   direction=1;
           elseif x>nextpoint(1) && y==nextpoint(2)
                   direction=2;
           elseif x>nextpoint(1) && y>nextpoint(2)
                    direction=3;
           elseif x==nextpoint(1) && y>nextpoint(2)
                    direction=4;   
           elseif x<nextpoint(1) && y>nextpoint(2)
                    direction=5; 
           elseif x<nextpoint(1) && y==nextpoint(2)
                    direction=6;
                    
           elseif x<nextpoint(1) && y<nextpoint(2)
                    direction=7;
                    
           elseif x==nextpoint(1) && y<nextpoint(2)
                    direction=8;
           end
           
           
            vector=image_Cell{T,S}; 
          
            vector(direction)=vector(direction)+1;
            image_Cell{T,S}=vector;
            
            
     end
            %------------MSE----------------
            mini=500;
            index=-1;
            [row,col]=size(train_matrix);
            for i=1:row
                for j=1:col
                  subCell=train_matrix{i,j};
                  for k=1:4
                      for n=1:8
                          vector_train_matrix=subCell{k,n};
                          vector_image_cell=image_Cell{k,n};
                          MSE=0;
                          for f=1:8
                              MSE=MSE+(vector_train_matrix(f,1)- vector_image_cell(f,1))^2;
                          end
                      end
                       if mini>MSE
                           mini=MSE;
                           index=i;
                       end
                  end
                end
            end
            
            'image'
            index
end
   
   
   
