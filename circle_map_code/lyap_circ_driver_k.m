
clear; clc; close all
kmin = 0;
kmax = 5;
maxj = 10000;
x0 = 0.7;
alpha = 10e-5;

L = [0.1, 0.3, 0.5, 0.7, 0.9];
N = 100;
q = 1;
w = [0.1, 0.2, 0.4, 0.06, 0.8];
for j = 1:length(w)
    disp('round one')
%     l = lyapunov_circ_k( kmin, kmax, maxj, x0, w(j), L, N, alpha, 0 );
    l = lyapunov_circ_k( kmin, kmax, maxj, x0, w(j), .05, 200, alpha, q );
    
    for i = 1:length(L)
        disp(i)
        l = lyapunov_circ_k( kmin, kmax, maxj, x0, w(j), L(i), N, alpha, q );
    end
end

lyap_circ_driver