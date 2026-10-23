x=-10:1/10:10;
y=power(x,3);
z=x.*x;
plot(x,y,'og',x,z,'y:');
xlabel('x value');
ylabel("sq and cube");
legend('tan(x)',"x^2");
%{ 
'-' → solid
'--' → dashed
':' → dotted
'-.' → dash-dot
'o' → circle
's' → square
'*' → star
Color:
'r' → red
'g' → green
'b' → blue
'k' → black
'm' → magenta
'c' → cyan
'y' → yellow
%}