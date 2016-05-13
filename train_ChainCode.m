function  train_matrix=train_ChainCode ()

 my=dir('C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\*.bmp');
 s1='C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\';
 train_matrix=cell(10 ,10);
nfiles=length(my);
trained=[ ];
lable=[ ];
i_row =1;
i_col=0;
for i=1:nfiles
  
    i_col=i_col+1;
    cname=my(i).name;
   %image=imread(strcat(s1,cname));
    image=imread('C:\Users\HP WIN 8\Desktop\FCI4 term 2\Pattern\Assignment\Pattern Recognition Data Set (0-9)\0_1.bmp');
    image=crop(image);
    image=1-image;
    [r c]=size(image);
    %[Xc,Yc,L]=centroid1(image);
  %  ds = bwtraceboundary(image, [row(1), col(1)], 'W', 8, Inf,'clockwise');

     [indr,indc]=find(image==1);   % get first 1 in image
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
      Cell=cell(4,8);
      [Cr,Cc]=size(Cell);
      % initaial vector of zeros
      vzeros=zeros(8,1);
      for i=1:Cr
          for j=1:Cc
               Cell{i,j}=vzeros;
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
         
             
            vector=Cell{T,S}; 
            vector(direction)=vector(direction)+1;
            Cell{T,S}=vector;
            
                          
     end
     
      train_matrix{i_row,i_col}=Cell;
     if i_col==10
         i_col=0;
         i_row=i_row+1;
     end
     
         
   % lable=[lable;cname(1)];
  
  
end
 train_matrix

end
