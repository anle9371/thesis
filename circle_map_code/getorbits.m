% get some test stable orbits
clear; clc; close all

L = 0.1;    % correlation length
N = 10/L;    % number of Fourier modes
maxp = 52;    % look for this maximum period order
iter = 1000;    % number of times the cobweb iterates
tol = 10e-6;    % set tolerance
x0 = 0.1;    % initial condition
alpha = 10e-5;    % part of random parameters (myrand)
k = 1;   % set the constant coupling strength parameter
om = 0.1;
[a,b] = myrand(L,N,alpha);
M = [a,b];
dlmwrite('ab.txt',M,'precision','%.15f')
% tmp = dlmread('ab.txt');
% a = tmp(:,1);
% b = tmp(:,2);
x = zeros(iter,1);
x(1) = x0;
Om = zeros(iter-1,1);

for i = 1:iter-1
    Om(i) = omega(a,b,om,x(i),N);
    x(i+1) = x(i) + Om(i) - (k/(2*pi)) * sin(2.0 * pi * x(i));
    x(i+1) = mod(x(i+1),1.0);
end
% return the last trunc iterates only (remove transients)
trunc = maxp+5;    % number of results to print
orbits = ones(1, maxp + 1)*-1;
xv = x(end-trunc:end);

% check period of orbit
for w = 1:maxp    
    if abs(xv(end-w) - xv(end)) < tol
        orbits(1,1) = w;    % w is period order
        orbits(1,2) = xv(end);        % xv has orbit location        
        for v = 3:w+1    % get higher order period orbit locations
            orbits(1,v) = xv(end-v+2);
        end        
        break
    end
end
period_order = orbits(1);
period_loc = orbits(2:period_order+1);
disp(sprintf('Stable Period: %d ',period_order))
disp('Stable Locations:')
for i = 1:period_order
    disp(sprintf('%.15f', period_loc(i)))
end