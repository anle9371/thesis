% Lorentzian distribution

function y = S(L,n,alpha)

% sigma = 0.5;    % standard deviation of xi
% y = (2*L*sigma^2) * (1 - ((-1)^n)*exp(-1/(2*L)) )/ (1 + (2*pi*L*n)^2);

y = alpha * exp(-L * abs(n));
end