% main function to call prob_of_orbits and circle map.

clear; clc; close all

L = 0.1;    % correlation length
N = 10/L;    % number of Fourier modes
maxp = 52;    % look for this maximum period order
iter = 1000;    % number of times the cobweb iterates
xrng = 20;    % number of initial x0s
tol = 10e-6;    % set tolerance
x = linspace(0+tol,1-tol,xrng);    % vector of initial positions
alpha = 10e-5;    % part of random parameters (myrand)
om = 0.1;    % set a base omega value
k = 1;   % set the constant coupling strength parameter
fname = 'ENorbits_arnold.csv';
% dlmwrite(fname,zeros(1,maxp)); % create a csv to store results
numSims = 1000;

for ns = 1:numSims
    for i = 1:xrng
        res = prob_of_orbits(L, alpha, N, om, k, maxp, iter, x(i), tol);
        dlmwrite(fname, res, '-append');
    end
end

M = dlmread(fname);

uhist(M, numSims)
plotavg(M, maxp, numSims, xrng)

% plot the circle map
% plot(x(1:end-1),x(2:end),'k.')
% axis([0 1 0 1])
% figure
% plot(tx,ty,'k-')
% hold on
% t = linspace(0,1,100);
% plot(t,t,'r-')
% xlabel('x_n')
% ylabel('x_{n+1}')
% title('Random Arnold Circle Map, k = 1')