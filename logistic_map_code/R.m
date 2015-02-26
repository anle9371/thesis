% random function R(x) on [0,1]
% ln(R(x)) = xi(x)
% xi(x) = ln(r) + Sigma[ xi_n * exp(2pi * i * n * x) ]
% xi_n = a_n + i*b_n

% Amy Le
% May 29, 2014
% vetorized on 2/19/15

function y = R(x,a,b,r,N)

k = 1:N;
x = x*ones(1,N);
res = 2*(a'.*cos(2*pi*k.*x) - b'.*sin(2*pi*k.*x));
y = exp( log(r) + sum(res) );

if y > 4 
    disp('more than 4')
    y = y * (1 + tanh(10*(4-y)));
end
% plot(x,y,'k','Linewidth',1)
% ylabel('R(x)')
% xlabel('x')
% set(gca,'FontSize',15)
% set(findall(gcf,'type','text'),'FontSize',15)
end