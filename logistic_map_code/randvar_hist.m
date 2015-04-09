% histogram of Tm/sm
clc; clear; close all

L = 0.1;
N = 100;
r = 3.3;
nvec = 1:N;
maxiter = 1000;
myvar = zeros(maxiter,1);

for k = 1:maxiter
[av, bv, sigma, alpha] = myrand(L,N,r);
Tm = 2*sum(av);
sm = sqrt(0.5*alpha + alpha*sum(exp(-L*nvec)));
myvar(k) = Tm/sm;
end

%pdf of normal RV
x = linspace(-6,6,1000);
y = normpdf(x,0,1);

hist(myvar)
axis([-6 6 0 300])
hold on
plot(x,650*y,'r','Linewidth',3.5)
h = findobj(gca,'Type','patch');
set(h,'FaceColor',[0.5 0 0.5],'EdgeColor','k')
xlabel('Number of Observations')
ylabel('Frequency')
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
