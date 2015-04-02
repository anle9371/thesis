% bifurcation diagram
% deterministic logistic map

clear; clc; close all;
Npre = 200; 
Nplot = 200; 
x = zeros(Nplot,1); 
rmin = 0;
for r = rmin:0.001:4.0, 
  x(1) = 0.5; 
  for n = 1:Npre, 
    x(1) = r*x(1)*(1 - x(1)); 
  end, 
  for n = 1:Nplot-1, 
    x(n+1) = r*x(n)*(1 - x(n)); 
  end, 
  plot(r*ones(Nplot,1), x, '.', 'markersize', 2); 
  hold on; 
end, 
% title('Bifurcation diagram of the logistic map'); 
xlabel('r');  ylabel('x_n'); 
set(gca, 'xlim', [rmin 4.0]); 
set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
