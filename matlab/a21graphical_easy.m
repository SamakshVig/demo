% max 5x1+4x2
% 6x1+4x2<=24
% x1+2x2<=6
% -x1+x2<=1
% x1,x2>=0
a=[1 2;-1 1;6 4;1 0;0 1];
b=[6;1;24;0;0];
c=[5 4];
y=0:1:max(b);
%% plotting graph
x21=(b(1)-a(1,1).*y)/a(1,2);
x22=(b(2)-a(2,1).*y)/a(2,2);
x23=(b(3)-a(3,1).*y)/a(3,2);
x24=(b(4)-a(4,1).*y)/a(4,2);
x25=(b(5)-a(5,1).*y)/a(5,2);
plot(y,x21,'r',y,x22,'g',y,x23,'b',y,x24,'m',y,x25,'y');
pt=[];
for i=1:size(a,1)
    for j=i+1:size(a,1)
        a1=a([i j],:);
        b1=b([i j],:);
        x=inv(a1)*b1;
        pt=[pt x];
    end
end
pt=pt';
%% check feasibility
for i=1:size(pt,1)
    const1(i)=a(1,1)*pt(i,1)+a(1,2)*pt(i,2)-b(1);
    const2(i)=a(2,1)*pt(i,1)+a(2,2)*pt(i,2)-b(2);
    const3(i)=a(3,1)*pt(i,1)+a(3,2)*pt(i,2)-b(3);
    const4(i)=a(4,1)*pt(i,1);
    const5(i)=a(5,2)*pt(i,2);
end
s1 = pt(find(const1<=0),:);
s2 = pt(find(const2<=0),:);
s3 = pt(find(const3<=0),:);
s4 = pt(find(const4>=0),:);
s5 = pt(find(const5>=0),:);
feasible = intersect(s1,s2,'rows');
feasible = intersect(feasible,s3,'rows');
feasible = intersect(feasible,s4,'rows');
feasible = intersect(feasible,s5,'rows');
%% finding objective
value = feasible*c';
%% optimizing
[max_value,max_index] = max(value);
fprintf('max value is %d at x,y = %d,%d',max_value,feasible(max_index,1),feasible(max_index,2));