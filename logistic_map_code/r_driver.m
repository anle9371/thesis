% % prob of orbit
% % pick a value of r that has a long tail and do 10^6 iterates
% % 2 < r < 3

clear ; clc; close all

L = linspace(0,1,11);
L(3:end) = L(2:10);
L(1) = 0.025;
L(2) = 0.05;
N = 100*ones(length(L),1);
N(1) = 400;
N(2) = 200;
maxp = 100;
tol = 10e-6;
r = linspace(.5,4-tol,6);
xrng = 10;
pth = 'C:\Users\amy\Dropbox\thesis\logistic_map_code\figures\histograms\';
numiters = 500;
numsims = xrng*numiters;

for i = 1:length(L)
    for j = 2:length(r)
        [data,sigma,alpha] = prob_of_orbits(L(i),N(i),r(j),xrng,numiters,maxp);
        fname = ['rlog_hist_L_',num2str(L(i)),'_r_',num2str(r(j)),...
            '_s_',num2str(sigma),'_a_',num2str(alpha),'_sims_',num2str(numsims)];
        dlmwrite([pth,fname,'.csv'], data, '-append');
        plot_prob_of_orbits(data, pth, fname, L(i), r(j), maxp)
    end
end