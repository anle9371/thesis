function f = devils(k)

% The function <devils> calculates the Devil's Staircase 
% for a value of the parameter K > 0 real 
% Call: devils(K)
% The program draws the staircase graph; 
% Original by J Neubauer / Humboldt U Berlin

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
omegamin = 0.0;
omegamax = 1.0;
nomegastep = 1000;
trans = 400; % number of transient points
out = 400;   % number of plotted points
x0 = 0.9;    % starting values x_0 for iterations for all parameters

omegastep = (omegamax-omegamin)/(nomegastep-1);
% omega = (omegamin:omegastep:omegamax);
omega = rand(1,nomegastep);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iteration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = x0 * ones( 1, length(omega) );  % row vector of IVs of length r
xstart = x;

for i = 1:trans % transient iterations for all selected parameters
	x = x + omega - k .* sin(2.0 * pi * x) / 2.0 / pi; % circle map
end;

xin = x;

for i = 1:out % output iterations
  x = x + omega - k .* sin(2.0 * pi * x) / 2.0 / pi; % circle map
  w = (x - xin)/i; % winding number
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(omega,w,'b.','markersize',5)
% text(.1,.9,['\fontsize{10}k=',num2str(k)])
xlabel('\omega')
ylabel('\rho')
% title('Devil''s staircase')
title(['k = ',num2str(k)],'FontSize',15)
axis([omegamin omegamax -.10  1.1])
set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
end