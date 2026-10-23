x=-2:pi/100:2*pi;
y=sin(x);
plot(x, y);
xlabel('x (radians)');
ylabel('sin(x)');
title('Sine Wave');
gtext('y=sin x');
xlim([-10 10])%for x axis
ylim([-2 2]);%for y axis
