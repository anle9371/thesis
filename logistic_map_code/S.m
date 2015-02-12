% Lorentzian distribution

function y = S(L,n,r)

% sigma = 0.5;    % standard deviation of xi
% y = (2*L*sigma^2) * (1 - ((-1)^n)*exp(-1/(2*L)) )/ (1 + (2*pi*L*n)^2);

sigma = (log(4/r)/sqrt(3)) * (tanh(L*0.25) / sqrt(tanh(L*0.5)));
alpha = sigma^2 * tanh(L/2);
y = alpha * exp(-L * abs(n));
end