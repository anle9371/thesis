% bif_driver
% main function to call bifurcation function for logistic map
% 3/13/15

clear; clc; close all

% set up params
nr1 = 10;
nr2 = 10;
nx = 10;
nL = 10;
maxp = 52;
numSims = 2;   % repeat for each (r,L,x0) tuple
mdname = 'rlog_bif_metadata.csv';
fname = 'rlog_bif_3_13_15_L';
tol = 10e-6;
N = 100;                        % number of Fourier modes
dr1 = floor((3-tol)/nr1);
dr2 = floor(((4-tol) - (3+tol))/nr2);

L = linspace(0+tol,1-tol,nL);
r = [linspace(tol,3,nr1),linspace(3+tol,4-tol,nr2)];
x0 = linspace(tol, 1-tol, nx);         % initial conditions
sigma_vec = zeros(length(r),1);
%[L, dr1, dr2, N, minsigma, maxsigma, nx, numSims]
metadata = zeros(1,7);   

for i = 1:length(L)
    disp(i);
    for j = 1:length(r)
        [a,b, sigma, alpha] = myrand(L(i),N,r(j));    
        sigma_vec(j) = sigma;        
        res = bifur(r(j), N, a, b, x0, maxp, tol, numSims);        
        tmpname = ['C:\Users\amy\Dropbox\thesis\logistic_map_code\bifurcation_data\',fname,num2str(L(i)),'.csv'];
        dlmwrite(tmpname, res, '-append');        
    end
    plotbif(tmpname, L(i), length(r), N, length(x0), maxp, tol, numSims)    
    metadata = [L(i), dr1, dr2, N, min(sigma), max(sigma), nx, numSims];
    dlmwrite(mdname, metadata, '-append');
end

