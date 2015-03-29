
% lyapunov_circ( wmin, wmax, maxj, x0, k, L, N, alpha, q )

clear; clc; close all
wmin = 0;
wmax = 1;
maxj = 10000;
x0 = 0.7;
k = 1.5;
alpha = 10e-5;
q = 1;

L = 0.05;
N = 200;
lambda = lyapunov_circ( wmin, wmax, maxj, x0, k, L, N, alpha, q );

L = [0.1, 0.3, 0.5, 0.7, 0.9];
N = 100;
for i = 1:length(L)   
    lambda = lyapunov_circ( wmin, wmax, maxj, x0, k, L(i), N, alpha, q );
end