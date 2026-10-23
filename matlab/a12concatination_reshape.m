a=[2 1 7;0 9 3];
b=[1 2 3;4 5 6];
c=cat(2,a,b)
d=cat(1,a,b)
%reshape(matrix,new row,new column)
reshape(a,3,2)%total element should be same
a(:)
%inverse
b=[1 2;2 1];
inv(b)