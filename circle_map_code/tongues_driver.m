% tongues_driver
clear; clc; close all

tol = 10e-6;
L = [0.025 0.05 0.1 0.3 0.5 0.9];
% tongues(kmin, kmax, wmin, wmax, nstep, L, N)
tongues(0, 1.5, 0, 1, 1000, 0.025, 100)
close all
tongues(0, 1.5, 0, 1, 1000, 0.05, 100)
for i = 1:length(L)
    close all
    tongues(0, 1.5, 0, 1, 1000, L(i), 100)
end

lyap_circ_driver_k
lyap_circ_driver

% L = [0.025 0.05 0.1 0.3 0.5 0.7 0.9];
% n = 1000;
% % pth = 'C:\Users\amy\Dropbox\thesis\circle_map_code\figures\tongues\half_alpha\';
% pth = 'C:\Users\amy\Dropbox\thesis\circle_map_code\figures\tongues\halfa\';
% pmax = 100;
% for i = 1:length(L)
%     fname = ['tongues_u_halfa_',num2str(n),'_L_',num2str(L(i))];
%     plot_tongues(pth,fname,pmax,n)
% end