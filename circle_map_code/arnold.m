% Arnold circle map
% Amy Le
% Oct 20, 2014
% k (coupling strength) is simulation parameter (constant), 0<k<1
% omega (driving phase) is random param

function [xt,t,mymap] = arnold(x0, iter, a, b, k, w, N, trunc,s)
x = zeros(iter,1);
x(1) = x0;
% Om = zeros(iter-1,1);
kk = 1:N;

% % bifurcation diagram calcs
for i = 1:iter-1
    xtmp = x(i)*ones(1,N);
    res = 2*(a'.*cos(2*pi*kk.*xtmp) - b'.*sin(2*pi*kk.*xtmp));
    myW = exp( log(w) + sum(res) );
%     Om(i) = omega(a,b,w,x(i),N);
    x(i+1) = x(i) + myW - (k/(2*pi)) * sin(2.0 * pi * x(i));
    x(i+1) = mod(x(i+1),1.0);
end

% % return the last trunc iterates only (remove transients)
xt = x(end-trunc+1:end);

if s == 1
    % smooth function
    t = linspace(0,1,iter);
    t = t';
    myW = zeros(iter,1);
    for j = 1:length(t)
        myW(j) = omega(a,b,w,t(j),N);
    end
    mymap = mod(t + myW - (k/(2*pi)) * sin(2.0 * pi * t),1);
else
    t = 0;
    mymap = 0;
end

end