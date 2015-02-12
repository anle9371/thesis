% random function R(x) on [0,1]
% ln(R(x)) = xi(x)
% xi(x) = ln(r) + Sigma[ xi_n * exp(2pi * i * n * x) ]
% xi_n = a_n + i*b_n

% Amy Le
% May 29, 2014

function y = R(x,a,b,r,N)

mysum = 0;
for j = 1:N  
    fs = 2*(a(j)*cos(2*pi*j*x) - b(j)*sin(2*pi*j*x));
    mysum = mysum + fs;
end

xi = log(r) + mysum;

y = exp(xi);
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