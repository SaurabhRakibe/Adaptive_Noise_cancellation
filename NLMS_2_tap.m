clc
close all
clear all
[Signal,gs]=audioread('closer.wav');
%  AA=audioplayer(Signal,gs);
%  play(AA);
figure(2);
plot(Signal,'r');
title('Signal');
Y1=randn(size(Signal))/5;
figure()
plot(Y1);
title('Noise signal');
minlength=min([length(Y1)]);
Z1=Signal(1:minlength);
x=Z1+Y1;
sf=audioplayer(x,gs);
play(sf);
figure(3)
plot(x);
title('Signal+Noise');
W = ones(2,minlength);
mu=0.004;
W(:,1) = [0 0]';
for k = 2:minlength;
   X = [x(k);x(k-1)];
        y(k) = X'*W(:,k);
        e(k) = Z1(k) - y(k);
       W(:,k+1) = W(:,k)+mu*(e(k))*(X)/(X'*X);
        E(k) = e(k);
        E2(k) = (E(k))^2;
        Mean(k)=mean(E2);
        
end
figure(4)
plot(y,'y');
title('Noise removed');
%  o=audioplayer(y,gs);
%   play(o);
  figure(5)
 n = 1:minlength+1;
 plot(n,W(1,:),n,W(2,:));
 hold on
 grid on
 title('Weight convergence 2-tap NLMS');
 xlabel('iterations');
 ylabel('weights');
figure(6)
plot(E2);
title('squared error curve 2-tap NLMS');
figure(7);
plot(Mean);
title('Mean squared 2-tap error NLMS')