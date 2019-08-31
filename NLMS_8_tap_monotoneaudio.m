clc
close all
clear all
[Signal,gs]=audioread('closer.wav');
%  bt=audioplayer(Signal,gs);
%  play(bt);
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
% ft=audioplayer(x,gs);
% play(ft);
figure(3)
plot(x);
title('Signal+Noise');
W = ones(8,minlength);
mu=0.006;
W(:,1) = [0 0 0 0 0 0 0 0]';
for k = 8:minlength;
   X = [x(k);x(k-1);x(k-2);x(k-3);x(k-4);x(k-5);x(k-6);x(k-7)];
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
 o=audioplayer(y,gs);
  play(o);
  figure(5)
 n = 1:minlength+1;
 plot(n,W(1,:),n,W(2,:),n,W(3,:),n,W(4,:),n,W(5,:),n,W(6,:),n,W(7,:),n,W(8,:));
 hold on
 grid on
 title('Weight convergence 8-tap NLMS');
 xlabel('iterations');
 ylabel('weights');
figure(6)
plot(E);
title('error curve 8-tap NLMS');
figure(7)
plot(E2);
title('squared 8-tap error NLMS')
plot(8)
plot(Mean);
title('Mean squared error 8-tap NLMS ')