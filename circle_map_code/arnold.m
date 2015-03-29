% Arnold circle map
% Amy Le
% Oct 20, 2014
% k (coupling strength) is simulation parameter (constant), 0<k<1
% omega (driving phase) is random param

function [xt,t,mymap] = arnold(x0, iter, a, b, k, w, N, trunc,s)
kk = 1:N;

if s ~= 1
    % smooth function
    t = x0;
    myW = zeros(1,length(t));
    for j = 1:length(t)
        xtmp = t(j)*ones(1,N);
        res = 2*(a'.*cos(2*pi*kk.*xtmp) - b'.*sin(2*pi*kk.*xtmp));
        myW(j) = exp( log(w) + sum(res) );
    end
    mymap = mod(t + myW - (k/(2*pi)) * sin(2.0 * pi * t),1);
    xt = 0;
else
    % % bifurcation diagram calcs
    x = zeros(iter,1);
    x(1) = x0;
    for j = 1:iter-1
        xtmp = x(j)*ones(1,N);
        res = 2*(a'.*cos(2*pi*kk.*xtmp) - b'.*sin(2*pi*kk.*xtmp));
        myW = exp( log(w) + sum(res) );
        x(j+1) = x(j) + myW - (k/(2*pi)) * sin(2.0 * pi * x(j));
        x(j+1) = mod(x(j+1),1.0);
    end
    
    % % return the last trunc iterates only (remove transients)
    if trunc ~=0
        xt = x(end-trunc+1:end);
    else
        xt = x;
    end
    t = 0;
    mymap = 0;
end

end