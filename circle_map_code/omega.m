% random function Omega(x) 
% ln(Omega(x)) = xi(x)
% xi(x) = ln(omega) + Sigma[ xi_n * exp(2pi * i * n * x) ]
% xi_n = a_n + i*b_n

% Amy Le
% Oct 20, 2014
% vetorized on 2/19/15

function y = omega(a,b,w,x,N)
k = 1:N;
y = zeros(length(x),1);
for i = 1:length(x)
xt = x(i)*ones(1,N);
res = 2*(a'.*cos(2*pi*k.*xt) - b'.*sin(2*pi*k.*xt));
y(i) = exp( log(w) + sum(res) );
end
plot(x,y,'k','Linewidth',1)
ylabel('\Omega(x)')
xlabel('x')
set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)

end