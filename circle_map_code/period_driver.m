% % % prob of orbit

clear; clc; close all
pth = 'C:\Users\amy\Dropbox\thesis\circle_map_code\figures\histogram\uniform_maxa\';
fname = 'rcirc_hist_u_L_01_w_06_k_1_sims_5000';
data = csvread([pth,fname,'.csv']);
plot_prob_of_orbits(data, pth, fname, 0.1, 0.6, 1, 100)
% L = linspace(0,1,11);
% L(3:end) = L(2:10);
% L(1) = 0.025;
% L(2) = 0.05;
% L = [L(1:3) L(5) L(7) L(11)];
% N = 100*ones(length(L),1);
% N(1) = 400;
% N(2) = 200;
% maxp = 100;
% tol = 10e-6;
% alpha = (10e-5);
% 
% w = [.4,.6,.9];
% xrng = 10;
% pth = 'C:\Users\amy\Dropbox\thesis\circle_map_code\figures\histogram\normal_maxa\';
% numiters = 500;
% numsims = xrng*numiters;
% k = [1,1.5];
% for kk = 1:length(k)
%     disp(['k: ',num2str(k(kk))])
%     for i = 1:length(L)
%         disp(['L: ',num2str(L(i))])
%         for j = 2:length(w)
%             disp(['w: ',num2str(w(j))])
%             data = prob_of_orbits(L(i),N(i),alpha,w(j),k(kk),xrng,numiters,maxp);
%             fname = ['rcirc_hist_n_L_',num2str(L(i)),'_w_',num2str(w(j)),...
%                 '_k_',num2str(k(kk)),'_sims_',num2str(numsims)];
%             dlmwrite([pth,fname,'.csv'], data, '-append');
%             plot_prob_of_orbits(data, pth, fname, L(i), w(j),k(kk), maxp)
%         end
%     end
% end