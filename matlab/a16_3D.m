t=-3:0.1:4;
x=sin(t);
y=4-t.*t;
plot3(x,y,t);%for 3-D
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
grid on;
a=[1 2 5];
b=[2 9 11];
[a,b]=meshgrid(a,b);
c=a.^2+b.^2;
surf(a,b,c);