% get location of orbits for bifurcation diagram
% rho = (final position - start position after removing transients) /
% numSteps

function rho = staircase(N, w, k, iter, x0, a, b)
x = x0;

% m = zeros(iter-1,1);
for i = 1:floor((iter-1)/2) % transients
    om = omega(a,b,w,x,N);
    x = x + om - (k/(2*pi)) * sin(2.0 * pi * x);
end

xin = x;

for i = 1:floor((iter-1)/2) % output
    om = omega(a,b,w,x,N);
    x = x + om - (k/(2*pi)) * sin(2.0 * pi * x);
    rho = (x-xin)/i;    %rho changes each time until end of loop
%     m(i+1) = floor(x(i+1)) + m(i); % integer part
%     x(i+1) = x(i+1) - m(i+1); % fractional part
end
% disp(rho)

end