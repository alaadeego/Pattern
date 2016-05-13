function [Xc, Yc,L]=centroid1(image)

[r ,c ]=size(image);
% calculate the centroid of image 
  for i=1:r
      for j=1:c
               Xnum=Xnum+i* image(i,j);

              Xdeno=Xdeno+image(i,j);
              Ynum=Ynum+j*image(i,j);
              Ydeno=Ydeno+ image(i,j);
         end
  end
          if isnan(Xnum/Xdeno)
            Xc=0;
          else    
             Xc= Xnum/Xdeno;
          end
          if isnan(Ynum/Ydeno)
              Yc=0;
          else
             Yc= Ynum/Ydeno;
          end
          
   L=-500;    
   %calculate the max distace far of Xc,Yc
  for i=1:r
         for j=1:c
         dist = distance (Xc ,Yc,i,j);
         L=max(dist , L);
         end
  end
  
end
