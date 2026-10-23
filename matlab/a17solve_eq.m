%% example
% 1=5*x+y;
% 1=6*x+y;
% d*X=e
% X=inv(d)*e  or  X=d\e  where X=[x;y]
d=[5 -1;6 -1];
e=[-1;-1];
X=inv(d)*e;
fprintf('sol is\n');
disp(X);