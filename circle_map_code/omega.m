% random function Omega(x) 
% ln(Omega(x)) = xi(x)
% xi(x) = ln(omega) + Sigma[ xi_n * exp(2pi * i * n * x) ]
% xi_n = a_n + i*b_n

% Amy Le
% Oct 20, 2014

function y = omega(a,b,w,x,N)
mysum = 0;

for j = 1:N  
    fs = 2*(a(j)*cos(2*pi*j*x) - b(j)*sin(2*pi*j*x));
    mysum = mysum + fs;
end

y = log(w)+mysum;

end