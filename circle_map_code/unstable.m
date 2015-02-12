% find unstable orbits on the circle map
% clear; clc; close all
% tmp = dlmread('ab.txt');
% a = tmp(:,1);
% b = tmp(:,2);

L = 0.1;    % correlation length
N = 10/L;    % number of Fourier modes
maxp = 52;    % look for this maximum period order
iter = 1000;    % number of times the cobweb iterates
tol = 10e-6;    % set tolerance
x0 = 0.1;    % initial condition
alpha = 10e-5;    % part of random parameters (myrand)
k = 1;   % set the constant coupling strength parameter
om = 0.1;
x = zeros(iter,1);
x(1) = x0;
Om = zeros(iter-1,1);

ic = [0.090120276590591 0.092806934738866];

% unstable iterations: use newton's method
ux = zeros(iter,1);
ux(1) = ic(1);
uOm = zeros(iter-1,1);
up = 1;
f=1;
i = 1;
% for i = 1:iter-1
% m = ...
% for h = 1:length(ic)
%     ux = zeros(iter,1);
%     ux(1) = ic(h);
%     f=1;
%     i = 1;
%     for j = 1:length(m)
        while abs(f) > tol
            [f,d] = myfunc(ux(i),a,b,om,N,k,up);%,0);
            disp(f)
            ux(i+1) = ux(i) - f/d;
%             ux(i+1) = mod(ux(i+1),1);
            i = i + 1;
            if i > 1000
                disp('diverge')
                break
            end
        end
%     end
% end

% stable iterations: fixed point iteration
% Stable Period: 2 
% Stable Locations:
% 0.090120276590591
% 0.092806934738866
