% tongues_driver

plotbif_zoom
clear; clc; close all

tol = 10e-6;
L = linspace(tol,1-tol,11);
ind = [2,4,6,8,10];
L = L(ind);
%tongues(kmin, kmax, wmin, wmax, nstep, L, N)
% tongues(0, 1.5, 0, 1, 1000, 0.025, 100)
% close all
% tongues(0, 1.5, 0, 1, 1000, 0.05, 100)
for i = 1:length(L)
    close all
    tongues(0, 1.5, 0, 1, 1000, L(i), 100)
end
