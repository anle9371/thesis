% devil's staircase
% plot the roation number rho as a function of omega
% L = correlation length
% k = set the constant coupling strength parameter
% n = number of om to test in [0,1]

function staircase_driver(L,k,n)
close all;
x0 = 0.1;    % initial condition

N = ceil(10/L);    % number of Fourier modes
iter = 1000;    % number of times the cobweb iterates
alpha = 10e-5;    % param for random parameters (myrand)
om = linspace(0,1,n);

[a,b] = myrand(L,N,alpha);
rho = zeros(length(om),1);
for i = 1:length(om)
    rho(i) = staircase(N, om(i), k, iter, x0, a, b);
    %         dlmwrite(fname, res, '-append');
end
figure
plot(om,rho,'b.','markersize',3)
xlabel('\omega')
ylabel('Rotation number \rho')
text(.1,.9,['\fontsize{10}L=',num2str(L)])
title(['Devil''s staircase k=',num2str(k)])
axis([min(om) max(om) -.10  1.1])
h = gcf;
t = strcat('devil_k',num2str(k));
p = strcat('_L',num2str(L));
name = strcat([t,p],'.png');
% path = 'C:\Users\swamy\Documents\amy\thesis\circle map code\figures\';
path = 'C:\Users\amy\Dropbox\thesis\circle map code\figures\';
saveas (h, [path,name], 'png');
end