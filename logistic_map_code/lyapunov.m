function lambda = lyapunov( rmin, rmax, maxj, x0 )
%plot the lyapunov exponent of the logistic map
close all
r = linspace(rmin,rmax,maxj);
lambda = zeros(maxj,1);
n = 1000;
for j = 1:maxj 
    x = zeros(n+1,1);
    x(1) = x0;
    for iter = 1:n-1        
        x(iter + 1) = r(j) * x(iter) * (1 - x(iter));
    end    
    lambda(j) = sum(log(abs(r(j) - 2*r(j)*x)))/n;    
end
plot(r, lambda, 'k.','MarkerSize',3)
axis([rmin rmax -1 1])
hold on
plot(r, zeros(maxj,1),'k')
set(gca,'fontsize',16)
xlabel('r','FontSize',16)
ylabel('\lambda','FontSize',16)
end
