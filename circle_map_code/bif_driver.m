% main function to call bifurcation diagram routine

clear; clc; close all

x0 = 0.3;    % initial condition
L = 0.1;    % correlation length
k = 1;   % set the constant coupling strength parameter
fname = 'test_bif_x0.3_L0.1_k1.csv';
numSims = 1;

N = 10/L;    % number of Fourier modes
maxp = 52;    % look for this maximum period order
iter = 1000;    % number of times the cobweb iterates
tol = 10e-6;    % set tolerance
alpha = 10e-5;    % param for random parameters (myrand)
om = 0:0.001:1;    % set a base omega value

% data cols
% x0, period order, period locations

for t = 1:numSims
    disp(t)
    [a,b] = myrand(L,N,alpha);    % keep random a,b same for each sim
    for i = 1:length(om)
        res = bif_orbs(N, om(i), k, maxp, iter, x0, tol,a,b);
        dlmwrite(fname, res, '-append');
    end
end

M = dlmread(fname);
si = 12; %marker size
plot_bif(M,k,numSims,si)