
% lyapunov_circ( wmin, wmax, maxj, x0, k, L, N, alpha, q )

clear; clc; close all
wmin = 0;
wmax = 1;
maxj = 10000;
x0 = 0.7;
alpha = 10e-5;
q = 1;

L = [0.1, 0.3, 0.5, 0.7, 0.9];
N = 100;
k = [0.8, 1, 1.3, 2];

for j = 1:length(k)
    disp(['k=',num2str(k(j))])   
    lambda = lyapunov_circ( wmin, wmax, maxj, x0, 2, 0.1, N, alpha, 0 );
    lambda = lyapunov_circ( wmin, wmax, maxj, x0, k(j), 0.05, 200, alpha, q );
    for i = 1:length(L)
        disp(['L=',num2str(L(i))])
        lambda = lyapunov_circ( wmin, wmax, maxj, x0, k(j), L(i), N, alpha, q );
    end
end