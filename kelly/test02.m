clc
clear all
close all

load data.mat;
y = M(1:2400,3);

P = ssd(y, 5*60, 2.25);

figure
subplot(3,1,1)
hold on
plot(M(:,2));
plot(M(:,4));
xticks([0:5:40]*60)
ylabel('T(K)')
xlim([0 2400])
ylim([280 330])

subplot(3,1,2)
hold on
plot(y)
xticks([0:5:40]*60)
ylabel('C_A');
xlim([0 2400])

subplot(3,1,3)
hold on
plot(P)
plot(ones(1,length(t)),'k')
xlabel('n-th sample')
ylabel('SS Probability')
xticks([0:5:40]*60)
xlim([0 2400])
ylim([0 1.1])