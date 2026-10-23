% max 3x1+5x2
% x1+2x2<=2000
% x1+x2<=1500
% x2<=600
% x1,x2>=0
a=[1 2;1 1;0 1];
b=[2000;1500;600];
c=[3 5];
y=0:1:max(b);%take x1 as y
%% plotting graph
x21=(b(1)-a(1,1).*y)./a(1,2);
x22=(b(2)-a(2,1).*y)./a(2,2);
x23=(b(3)-a(3,1).*y)./a(3,2);
x21=max(0,x21);% for non negative solutions
x22=max(0,x22);% for non negative solutions
x23=max(0,x23);% for non negative solutions
plot(y,x21,'r',y,x22,'g',y,x23,'b');
xlabel('x1/y');
ylabel('x2');
legend('x1+2x2=2000','x1+x2=1500','x2=600');
%% point of intersection with axis
cx1=find(y==0);%return index where y is 0
c1=find(x21==0);
line1=[y(:,[c1 cx1]);x21(:,[c1 cx1])];
c2=find(x22==0);
line2=[y(:,[c2 cx1]);x22(:,[c2 cx1])];
c3=find(x23==0);
line3=[y(:,[c3 cx1]);x23(:,[c3 cx1])];
corpt = [line1 line2 line3];
%% point of intersection of lines
pt=[0;0];
for i=1:size(a,1)
    for j=i+1:size(a,1)
        a1=a([i j],:);
        b1=b([i j],:);
        x=inv(a1)*b1;
        pt=[pt x];
    end
end
%% combine all points
allpt = unique([pt corpt]','rows');% here i took complement also
%% check feasibility
for i=1:size(allpt,1)
    const1(i)=a(1,1)*allpt(i,1)+a(1,2)*allpt(i,2)-b(1);
    const2(i)=a(2,1)*allpt(i,1)+a(2,2)*allpt(i,2)-b(2);
    const3(i)=a(3,1)*allpt(i,1)+a(3,2)*allpt(i,2)-b(3);
end
s1 = allpt(find(const1<=0),:);
s2 = allpt(find(const2<=0),:);
s3 = allpt(find(const3<=0),:);
feasible = intersect(s1,s2,'rows');
feasible = intersect(feasible,s3,'rows');
%% finding objective
value = feasible*c';
%% optimizing
[max_value,max_index] = max(value);
fprintf('max value is %d at x,y = %d,%d',max_value,feasible(max_index,1),feasible(max_index,2)); 