% tmp file

% close all; clc; clear;
% iter = 1000;
% xlen = 25;
% L = 0.05;
% N = 10/L;
% r = 3.5;
% sigma = log(4/r) * (sqrt(2/3)) * ( tanh(L*0.25) / sqrt(tanh(L*0.5)) )
% envelope(r,N,L,xlen)
% 
% close all; clc; clear;
% iter = 1000;
% xlen = 25;
% L = 0.1;
% N = ceil(10/L);
% r = 3.7;
% sigma = log(4/r) * (sqrt(2/3)) * ( tanh(L*0.25) / sqrt(tanh(L*0.5)) )
% envelope(r,N,L,xlen)
% 
close all; clc; clear;
% iter = 1000;
% xlen = 25;
% L = 0.9;
% N = ceil(100/L);
% r = 2.7;
% sigma = log(4/r) * (sqrt(2/3)) * ( tanh(L*0.25) / sqrt(tanh(L*0.5)) )
% envelope(r,N,L,xlen)

L = 0.1;
N = 0;
r = 3.2;
iter = 1000;
xlen = 25;
[a,b] = myrand(L,N,r);
x0 = linspace(0,1,iter);
[~, t, mymap] = cobweb(x0, iter, a, b, r, N, xlen);
% figure
% no_randomness_cobweb