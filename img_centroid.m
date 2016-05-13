function v=img_centroid(img_Matrix,x,y)
img=img_Matrix;
[r,c]=size(img);
for i=1:x
    if i==x
        row(i)=floor(r/x)+mod(r,x);
    else
       row(i)=floor(r/x);
    end
end
for i=1:y
    if i==y
        col(i)=floor(c/y)+mod(c,y);
    else
      col(i)=floor(c/y);
    end
end

blocks=mat2cell(img,row,col);

[R_blocks,C_blocks]=size(blocks);


 Xnum=0;Xdeno=0;Ynum=0;Ydeno=0;
 %caculate centroid
   v=[ ];
for ir=1:R_blocks
    for jc=1:C_blocks
        block=blocks{R_blocks,C_blocks};
  
        [R_block,C_block]=size(block);
      
        for i=1:R_block
            for j=1:C_block
              Xnum=Xnum+i* block(i,j);
              Xdeno=Xdeno+block(i,j);
              Ynum=Ynum+j*block(i,j);
              Ydeno=Ydeno+ block(i,j);
            end
        end
            
          if isnan(Xnum/Xdeno)
             v(end+1)=0;
          else    
             v(end+1)= Xnum/Xdeno;
          end
          if isnan(Ynum/Ydeno)
              v(end+1)=0;
          else
             v(end+1)= Ynum/Ydeno;
          end
          
          Xnum=0;Xdeno=0; Ynum=0;Ydeno=0;
       
    end
end
    
    
end
