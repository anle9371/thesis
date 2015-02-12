%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all,
clear
clc
omega = .5;
kmin = 0.0;
kmax = 4;

nkstep = 500;

trans = 500; % number of transient points
out = 200;   % number of plotted points
x0 = 0.1;    % starting values x_0 for iterations for all parameters

kstep = (kmax-kmin)/(nkstep-1);

k = (kmin:kstep:kmax);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iteration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = x0 * ones( 1, length(k) );  % row vector of initial conditions of
                                % length r

for i = 1:trans % transient iterations for all selected parameters
  x = x + omega - k .* sin(2.0 * pi * x) / 2.0 / pi; % circle map
  x = mod(x,1.0);
end;

y = [];

for i = 1:out % output iterations
  x = x + omega - k .* sin(2.0 * pi * x) / 2.0 / pi; % circle map
  x = mod(x,1.0);
  y = [y;x];            % columns of y are map iterates
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(k,y,'r.','markersize',1);

xlabel('Bifurcation parameter k');
ylabel('amplitude');
title('Bifurcation diagram for circle map');
grid on;

set(gca,'xlim',[kmin kmax]);