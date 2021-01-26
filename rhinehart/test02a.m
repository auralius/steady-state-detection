clc
clear all
close all

load data.mat;
y = M(1:2400,3);

R = CalculateR(y);


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
plot(R)
plot(ones(1,length(y)),'--k')
xlabel('n-th sample')
ylabel('R-values')
xticks([0:5:40]*60)
xlim([0 2400])
%ylim([0 2])