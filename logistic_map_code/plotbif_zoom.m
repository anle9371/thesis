% zoom in on bifurcation diagram for the logistic map
clear; clc; close all
pth = 'C:\Users\amy\Dropbox\thesis\logistic_map_code\bifurcation_data\big_run\';
fname = 'rlog_bif_3_15_15_L';
L = linspace(0,1,11);
rlen = 1800;
x0len = 1000;
maxp = 256;
for i = 2:length(L)
    fname = [fname, num2str(L(i)),'.csv'];
    plotbif(pth, fname, L(i), rlen, x0len, maxp)
end