% random function Omega(x) 
% ln(Omega(x)) = xi(x)
% xi(x) = ln(omega) + Sigma[ xi_n * exp(2pi * i * n * x) ]
% xi_n = a_n + i*b_n

% Amy Le
% Oct 20, 2014
% vetorized on 2/19/15

function y = omega(a,b,w,x,N)
k = 1:N;
x = x*ones(1,N);
res = 2*(a'.*cos(2*pi*k.*x) - b'.*sin(2*pi*k.*x));
y = exp( log(w) + sum(res) );
end