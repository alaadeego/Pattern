function X=Mean(M)
[r,c]=size(M);

X=[];
for i=1:r
    sum=0;
    for j=1:c
        sum=sum+M(i,j);
    end
    X=[X;sum/c];
    
end



end