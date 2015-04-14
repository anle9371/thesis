% plot the lyapunov exponent of the circle map
% input
% [wmin, wmax] = min and max values of omega, e.g. [0,1]
% maxj = number of lyapunov exponents to find
% x0 = initial condition for the map
% k = parameter, chaos is observed for k>1
% q = random map flag; if q == 1 then use random map, else, use det map
% L = correlation length
% N = number of fourier modes

% output
% plot of the lyapunov exponent vs omega
function lambda = lyapunov_circ_k( kmin, kmax, maxj, x0, w, L, N, alpha, q )
close all
kk=1:N;
k = linspace(kmin,kmax,maxj);
lambda = zeros(maxj,1);
n = 1000;
if q == 1 %random map    
    xlen = 0;    
    for j = 1:maxj
        [a,b] = myrand(L,N,alpha);
%         arnold(x0, iter, a, b, k, w, N, trunc,s)
        [xv, ~, ~] = arnold(x0, n, a, b, k(j), w, N, xlen, q);
        
        %compute xi'(x) and xi(x)        
        Dxi = zeros(n,1);
        xi = zeros(n,1);
        for ic = 1:n
            xtmp = xv(ic)*ones(1,N);
            res = 2*(-a'.*2*pi.*kk.*sin(2*pi*kk.*xtmp) + b'.*2*pi.*kk.*cos(2*pi*kk.*xtmp));
            Dxi(ic) = sum(res) ;
            xi(ic) = log(k(j)) + sum(2*(a'.*cos(2*pi*kk.*xtmp) - b'.*sin(2*pi*kk.*xtmp)));
        end
        
        %compute Omega'(x)
        DW = exp(xi).*Dxi;        
        
        %compute f'(x)
%         Df = DR.*xv.*(1-xv) + R.*(1-2*xv);
        Df = 1 - k(j) * cos(2.0 * pi * xv) + DW;
        lambda(j) = sum(log(abs(Df)))/n;
    end    
    pname = ['rcirc_u_halfa_lyap_',num2str(maxj),'_L_',num2str(L),'_w_',num2str(w),'_k.png'];
else
    for j = 1:maxj
        x = zeros(n,1);
        x(1) = x0;
        
        for iter = 1:n-1
            x(iter + 1) = x(iter) + w - (k(j)/(2*pi)) * sin(2.0 * pi * x(iter));
        end
        lambda(j) = sum(log( 1 - k(j) * cos(2.0 * pi * x)))/n;
    end
    pname = ['detcirc_u_lyap_',num2str(maxj),'_w_',num2str(w),'_k.png'];
end
plot(k, lambda, 'k.','MarkerSize',3)
axis([kmin kmax -1 1])
hold on
plot(k, zeros(maxj,1),'k')
set(gca,'fontsize',16)
xlabel('k','FontSize',16)
ylabel('\lambda','FontSize',16)
title(['\omega = ',num2str(w)],'FontSize',16)
h = gcf;
pth = 'C:\Users\amy\Dropbox\thesis\circle_map_code\figures\lyapunov\uniform\halfa\';
% pth = 'C:\Users\swamy\Documents\amy\thesis\circle_map_code\circle_map_code\figures\lyapunov\';
saveas (h, [pth,pname], 'png');
end
