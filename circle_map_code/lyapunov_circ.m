function poslamb = lyapunov_circ( wmin, wmax, maxj, x0 )
%plot the lyapunov exponent of the circle map
close all
k = 1;
om = linspace(wmin,wmax,maxj);
lambda = zeros(maxj,1);
n = 1000;
for j = 1:maxj 
    x = zeros(n,1);
    x(1) = x0;
    
    for iter = 1:n-1                      
        x(iter + 1) = x(iter) + om(j) - (k/(2*pi)) * sin(2.0 * pi * x(iter));
%         x(iter+1) = mod(x(iter+1),1.0);
    end    
    lambda(j) = sum(log( 1 - k * cos(2.0 * pi * x)))/n;    
end
plot(om, lambda, 'k.','MarkerSize',3)
axis([wmin wmax -1 1])
hold on
plot(om, zeros(maxj,1),'k')
set(gca,'fontsize',16)
xlabel('\omega','FontSize',16)
ylabel('\lambda','FontSize',16)
i = 1;
poslamb = zeros(1,2);
for j = 1:maxj
    if lambda(j) > 0
        poslamb(i,:) = [om(j), lambda(j)];        
        i = i+1;
    end
end
plot(poslamb(:,1),poslamb(:,2), 'r.', 'MarkerSize', 5)
end
