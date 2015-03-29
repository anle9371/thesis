%plot the lyapunov exponent of the logistic map
% [rmin, rmax] = interval over r
% maxj = number of exponents to compute
% x0 = initial condition
% q = flag for random map; if 1 then use random, else use det map

function [r,lambda] = lyapunov( rmin, rmax, maxj, x0, L, N, q )
close all
tol = 10e-6;
r = linspace(rmin+tol,rmax-tol,maxj);
r=r';
lambda = zeros(maxj,1);
n = 1000;
k = 1:N;        
if q == 1 %random map    
    xlen = 0;
    for j = 1:maxj
        [a,b] = myrand(L,N,r(j));
        [xv, ~, ~] = cobweb(x0, n-1, a, b, r(j), N, xlen);
        
        %compute xi'(x) and xi(x)        
        Dxi = zeros(n,1);
        xi = zeros(n,1);
        for ic = 1:n
            xtmp = xv(ic)*ones(1,N);
            res = 2*(-a'.*2*pi.*k.*sin(2*pi*k.*xtmp) + b'.*2*pi.*k.*cos(2*pi*k.*xtmp));
            Dxi(ic) = sum(res) ;
            xi(ic) = log(r(j)) + sum(2*(a'.*cos(2*pi*k.*xtmp) - b'.*sin(2*pi*k.*xtmp)));
        end
        
        %compute R'(x) and R(x)
        DR = exp(xi).*Dxi;
        R = exp(xi);
        
        %compute f'(x)
        Df = DR.*xv.*(1-xv) + R.*(1-2*xv);
        lambda(j) = sum(log(abs(Df)))/n;
    end
    
else %deterministic map
    for j = 1:maxj
        x = zeros(n+1,1);
        x(1) = x0;
        for iter = 1:n-1
            x(iter + 1) = r(j) * x(iter) * (1 - x(iter));
        end
        lambda(j) = sum(log(abs(r(j) - 2*r(j)*x)))/n;
    end
end
plot(r, lambda, 'k.','MarkerSize',3)
axis([rmin rmax -1 1])
hold on
plot(r, zeros(maxj,1),'k')
set(gca,'fontsize',16)
xlabel('r','FontSize',16)
ylabel('\lambda','FontSize',16)
h = gcf;
pth = 'C:\Users\amy\Dropbox\thesis\logistic_map_code\figures\';
pname = ['rlog_lyap_L_',num2str(L),'.png'];
saveas (h, [pth,pname], 'png');
end
