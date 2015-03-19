% tongues_driver

clear; clc;

tol = 10e-6;
L = linspace(tol,1-tol,10);
ind = [2,4,6,8,10];
% for i = 2:length(ind)
    close all
    tongues(0, 1.5, 0, 1, 1000, .05, 100)
% end
