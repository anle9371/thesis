% draw solution curve of circle map on bifurcation diagram
clear; clc; close all
omega = linspace(0,1,1000);
k = 1;
x = (1/(2*pi))*asin(mod(2*pi*(omega-1)/k,1));
wleft = fliplr(omega);
tol = 10e-6;
plot(omega,x)

wlind = 100;
for i = 1:length(x)
    if abs(-x(i)-0.25) < tol
        wlind = i;
    end
end

% axis([0 1 0 1])