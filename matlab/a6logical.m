%{
AND       &
OR        |
NOT       ~
logical means 1-0 format
%}
a=[2,0,1,0];
b=[0,1,5,0];
% Perform element-wise logical operations
disp(a & b);
disp(a | b);
disp(~a);