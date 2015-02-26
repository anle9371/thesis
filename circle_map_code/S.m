% Lorentzian distribution

function y = S(L,n,alpha)
y = alpha * exp(-L * abs(n));
end