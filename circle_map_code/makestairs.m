% -----------------------------------------------------------------
% generate a bunch of staircases
% L = correlation length
% k = set the constant coupling strength parameter
% n = number of om to test in [0,1]

clear; clc; close all;

% L = [0.1 0.3 0.5];
% k = [1 0.7 0.5];
% n = 10000;
% for i = 1:3
%     for j = 1:3
%         staircase_driver(L(i),k(j),n)
%     end
% end


% -----------------------------------------------------------
% histogram of rotation number over 1000 realizations for fixed om

k = 1;
L = 0.1;
n = 1000;     % number of realizations
x0 = 0.1;    % initial condition
N = ceil(10/L);    % number of Fourier modes
iter = 1000;    % number of times the cobweb iterates
alpha = 10e-5;    % param for random parameters (myrand)
om = 0.225;
rho = zeros(n,1);

for i = 1:n
    [a,b] = myrand(L,N,alpha);
    rho(i) = staircase(N, om, k, iter, x0, a, b);
end

s = num2str(n);
t = strcat(s, ' Simulations');
figure
h = gcf;
% hist(rho)
[f,xi] = ksdensity(rho);
plot(xi,f)
ylim([0 n])
tmp = xlim;
text(tmp(1)+0.01,n*0.75,['\fontsize{10}L=',num2str(L),', \fontsize{10}k=',num2str(k),', \fontsize{10}\omega=',num2str(om)])
xlabel('\rho')
ylabel('frequency')
title(['Kernel Density Estimator of Rotation Numbers;',t])
name = ['kde_rho_k',num2str(k),'_L',num2str(L),'_om',num2str(om),'.png'];
path = 'C:\Users\amy\Dropbox\thesis\circle map code\figures\';
saveas (h, [path,name], 'png');

