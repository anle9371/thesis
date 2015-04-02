% get location of orbits for bifurcation diagram
% rho = (final position - start position after removing transients) /
% numSteps

function rho = staircase(N, w, k, iter, x0, a, b)
x = x0;
kk = 1:N;
for i = 1:floor((iter-1)/2) % transients
    xtmp = x*ones(1,N);
    res = 2*(a'.*cos(2*pi*kk.*xtmp) - b'.*sin(2*pi*kk.*xtmp));
    myW = exp( log(w) + sum(res) );
    x = x + myW - (k/(2*pi)) * sin(2.0 * pi * x);
end
xin = x;
for i = 1:floor((iter-1)/2) % output
    xtmp = x*ones(1,N);
    res = 2*(a'.*cos(2*pi*kk.*xtmp) - b'.*sin(2*pi*kk.*xtmp));
    myW = exp( log(w) + sum(res) );
    x = x + myW - (k/(2*pi)) * sin(2.0 * pi * x);
    rho = (x-xin)/i;    %rho changes each time until end of loop
end
end