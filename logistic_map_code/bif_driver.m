% bif_driver
% main function to call bifurcation function for logistic map
% 3/13/15

clear; clc; close all

% set up params
nr1 = 400%0;
nr2 = 500%0;
nx = 1000;
nL = 10;
maxp = 256;
pth = 'C:\Users\swamy\Documents\amy\thesis\logistic map\bifurcation_data\';

% other params
mdname = 'rlog_bif_metadata_3_15_15.csv';
froot = 'rlog_bif_3_15_15_L';
tol = 10e-6;
N = 100;                        % number of Fourier modes
dr1 = (3-tol)/nr1;
dr2 = ((4-tol) - (3+tol))/nr2;
L = linspace(0+tol,1-tol,nL);
r = [linspace(tol,3,nr1),linspace(2.5+tol,4-tol,nr2)];
rlen = length(r);
x0 = linspace(tol, 1-tol, nx);         % initial conditions
sigma_vec = zeros(length(r),1);
numcols = maxp+2; % [r, orbit_order, orbit_locations]

%[L, dr1, dr2, N, minsigma, maxsigma, nx]
metadata = zeros(nL,7);

L = 0.1;

for i = 1:length(L)
    disp(i);  
    res_data = zeros(rlen*nx,numcols); %container for data
    ressum = 1; %keep track of index in container

    for j = 2:rlen
        [a,b, sigma, alpha] = myrand(L(i),N,r(j));
        sigma_vec(j) = sigma;
        res = bifur(r(j), N, a, b, x0, maxp, tol);
        [rres,~] = size(res);
        if rres >= 1
            res_data(ressum:ressum+rres-1,:) = res;
        end
        ressum = ressum + rres;       
    end
    
    % delete the empty space, if it exists
    tmp = res_data(:,1) == 0; %look for the first zero element
    res_ind = find(tmp,1) - 1; %grab index
    if isempty(res_ind) == 0
        res_data = res_data(1:res_ind,:); %remove unfilled entries
    end
    
    % make one large write operation
    tmpname = [froot,num2str(L(i)),'.csv'];
    dlmwrite([pth,tmpname], res_data, '-append');

    % plot diagram
    plotbif(pth,tmpname, L(i), length(r), length(x0), maxp)
    
    % record metadata for later reference
    metadata(i,:) = [L(i), dr1, dr2, N, min(sigma), max(sigma), nx];
end

% write metadata for all sims
dlmwrite([pth,mdname], metadata);


% wrlim0 = ceil((nr1+nr2)/3);
% wrlim = wrlim0;
% res_data = zeros(wrlim, maxp+2);
% rind = 1:ceil(length(r)/3):length(r);
% ctr = 1;
% ressum = 1;
% k = 1;
% for i = 2:length(L)
%     disp(i);
%     ctr = rind(k);
%     rlim = length(r) - rind(end-k+1) + 1;
%     for j = ctr:rlim
%         [a,b, sigma, alpha] = myrand(L(i),N,r(j));
%         sigma_vec(j) = sigma;
%         res = bifur(r(j), N, a, b, x0, maxp, tol);
%         [rres,~] = size(res);
%         if rres >= 1
%             res_data(ressum:ressum+rres-1,:) = res;
%         end
%         ressum = ressum + rres;
%         if ressum > wrlim % allocate more space
%             res_data(wrlim+1:ceil(wrlim*1.5),:) = zeros(ceil(0.5*wrlim),maxp+2);
%             [wrlim, ~] = size(res_data);
%         end
%     end
%     
%     tmp = res_data(:,1) == 0;
%     res_ind = find(tmp,1) - 1;
%     if isempty(res_ind) == 0
%         res_data = res_data(1:res_ind,:); %remove unfilled entries
%     end
%     tmpname = [pth,froot,num2str(L(i)),'_v',num2str(ctr),'.csv'];
%     dlmwrite(tmpname, res_data, '-append');
%     wrlim = wrlim0;
%     res_data = zeros(wrlim, maxp+2);
%     ressum = 1;
%     
%     k = k +1;
% plotbif(pth, froot, L(i), length(r), length(x0), maxp)
% metadata(i,:) = [L(i), dr1, dr2, N, min(sigma), max(sigma), nx];
% end
% dlmwrite([pth,mdname], metadata);