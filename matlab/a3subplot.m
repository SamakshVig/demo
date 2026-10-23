x=-10:0.1:10;
y=x;
y2=x.*x;
subplot(1,2,1);%(horiz. divisions,vert. divisions,no of division for graph to plot)
plot(x, y2);
xlabel('x-axis');
ylabel('y2 = x^2');
title('Plot of y2 = x^2');
grid on;

subplot(1,2,2);
plot(x, y);
xlabel('x-axis');
ylabel('y = x');
title('Plot of y = x');
grid on;
