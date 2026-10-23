% max 2x1+3x2+4x3+7x4
% 2x1+3x2-x3+4x4<=8
% x1-2x2+6x3-7x4<=-3
%% phase 1-input parameters
a=[2 3 -1 4;1 -2 6 -7];
b=[8;-3];
c=[2 3 4 7];
%% phase 2-no. of constraints and variables
m=size(a,1);% no. of constraints
n=size(a,2);%no. of variables
if(n>m)
    %% phase 3-calc. nCm and find pairs of variables to solve
    ncm=nchoosek(n,m);
    pairs = nchoosek(1:n,m);% means choose m nos. out of 1 to n
    %% phase 4-evaluate combinations
    sol=[];
    for i=1:ncm
        y=zeros(n,1);
        x=inv(a(:,pairs(i,:)))*b;
        if all(x>=0 & x~=-inf & x~=inf)
            y(pairs(i,:))=x
            sol=[sol,y];
        end
    end
    sol
    z=c*sol%%finding objective
    [zmax,zind]=max(z);
    sol(:,zind)% display optimized solution
    max(z)% display optimized value
else
    error('variables lesser than constraints');
end