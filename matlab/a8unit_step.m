n=-10:10;
u=[zeros(1,10) ones(1,11)];
subplot(2,1,1);
plot(n,u);% continuous values
subplot(2,1,2);
stem(n,u)% discrete values
axis([-12 12 -1 2]);%this will show default axis length