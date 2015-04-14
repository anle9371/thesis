% % prob of orbit

clear ; clc; close all
L = linspace(0,1,11);
L(3:end) = L(2:10);
L(1) = 0.025;
L(2) = 0.05;
L = [L(1:3) L(5) L(7) L(9) L(11)];
N = 100*ones(length(L),1);
N(1) = 400;
N(2) = 200;
maxp = 100;
tol = 10e-6;
r = linspace(.5,3.9,6);
xrng = 10;
pth = 'C:\Users\amy\Dropbox\thesis\logistic_map_code\figures\histograms\halfsig\';
numiters = 500;
numsims = xrng*numiters;

for i = 1:length(L)
    for j = 2:length(r)
        [data,sigma,alpha] = prob_of_orbits(L(i),N(i),r(j),xrng,numiters,maxp);
        fname = ['rlog_hist_hs_L_',num2str(L(i)),'_r_',num2str(r(j)),...
            '_s_',num2str(sigma),'_a_',num2str(alpha),'_sims_',num2str(numsims)];
        dlmwrite([pth,fname,'.csv'], data, '-append');
        plot_prob_of_orbits(data, pth, fname, L(i), r(j), maxp)
    end
end