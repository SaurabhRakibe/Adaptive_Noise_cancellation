clc
clear all
[Signal,gs]=audioread('closer.wav');
%  AA=audioplayer(Signal,gs);
%  play(AA);
figure(2);
plot(Signal,'r');
title('Signal');
Y1=randn(size(Signal))/5;
minlength=min([length(Y1)]);
Z1=Signal(1:minlength);
x=Z1+Y1;
% Rt=audioplayer(x,gs);
% play(Rt);
figure(3)
plot(x);
title('Signal+Noise');
W = ones(8,minlength);
W(:,1) = [0 0 0 0 0 0 0 0]';
mew = 0.006;
for k = 9:minlength;
   X = [x(k);x(k-1);x(k-2);x(k-3);x(k-4);x(k-5);x(k-6);x(k-8)];
        y(k) = X'*W(:,k);
        e(k) = Z1(k) - y(k);
        W(:,k+1) = W(:,k)+2*mew*e(k)*X;
        E(k) = e(k);
        E2(k) = (E(k))^2;
        Mean(k)= mean(E2);
        
end
figure(4)
plot(y,'y');
title('Noise removed');
figure(5);
plot(e);
%  o=audioplayer(y,gs);
%   play(o);
figure(6)
N = 761040;
n = 1:N+1;
plot(n,W(1,:),n,W(2,:),n,W(3,:),n,W(4,:),n,W(5,:),n,W(6,:),n,W(7,:),n,W(8,:));
hold on
title('Convergence of Weights LMS 8-Tap');
figure(7)
plot(E2)
title('Squared Error LMS 8-Tap');
figure(8)
plot(Mean);
title('squared mean error');


 
 
 
