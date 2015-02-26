% removed function call to S.m on 2/19/15

function [av, bv] = myrand(L,N,r)
a = zeros(N,1);
b = zeros(N,1);
sigma = log(4/r) * (sqrt(2/3)) * ( tanh(L*0.25) / sqrt(tanh(L*0.5)) );
alpha = sigma^2 * tanh(L/2);
for j = 1:N
    Mn = sqrt( 1.5 * ( alpha * exp(-L * abs(j)) ) );
    %     pd = makedist('Normal','mu',mu,'sigma',stddev);
    pd = makedist('Uniform','lower',-Mn,'upper',Mn);
    a(j) = random(pd);
    b(j) = random(pd);
end
av = a;
bv = b;
end