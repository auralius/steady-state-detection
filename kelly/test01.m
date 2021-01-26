clc
clear all
close all

% Test 1st order system
s = tf('s');
G = 10/(10*s+1);
[y,t] = step(G, 0:0.1:100);

y_noisy = y + 0.1 * randn(length(y),1); % added noise, normal distribution

P = ssd(y_noisy, 100, 2);

yyaxis left
hold on
plot(y_noisy)
plot((10+0.05*10)*ones(1,length(t)),'-.k')
plot((10-00.05*10)*ones(1,length(t)),'-.k')
xlim([0 length(y)])
ylim([0 12])

yyaxis right
hold on
plot(P)
plot(ones(1,length(t)),'k')
xlabel('n-th sample')
ylabel('SS Probability')
%ylim([0 5])