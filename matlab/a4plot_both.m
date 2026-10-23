t=0:0.01:1;
y1=sin(t*2*pi);
y2=cos(t*2*pi);
plot(t,y1,'r',t,y2,'g');%do this
xlabel('Time (s)-->');
ylabel('Amplitude-->');
title('Sine and Cosine Waves');
legend('sin','cos');
