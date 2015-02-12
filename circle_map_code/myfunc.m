% circle map function for use in finding unstable orbits
% n = number of times to compose f with itself (unstable period order)
% g(x0) = fn(x0) - x0
% g'(x0) = pi_{t=0}^{t=n-1} f'(xt) - 1

function [func,deriv] = myfunc(x,a,b,om,N,k,period_order)%,m)
vals = zeros(period_order,1);
for i = 1:period_order
    vals(i) = x;                   % save orbit location
    w = omega(a,b,om,x,N);
    f = x + w - (0.5*k/pi)*sin(2*pi*x);
    x = f;    
end
func = f - vals(1);% - m;  % = g(x0)

prod = 1;
for t = 1:period_order
    prod = prod * (1 - k*cos(2*pi*vals(t)));
end
deriv = prod - 1;   % = g'(x0)
end