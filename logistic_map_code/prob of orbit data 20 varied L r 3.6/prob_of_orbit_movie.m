%making a movie

clear
clc
close all

tol = 10e-6;
% global tol
figure('Renderer','zbuffer')
set(gca,'NextPlot','replaceChildren');
% cMovie(nFrames) = struct('cdata',[],'colormap',[]);
frameind = 1;
kmax = 1; 
L = linspace(0+tol,1-tol,20);
maxp = 32;
r = 3.6;

axis([0 maxp 0 1]) 
axis manual
for k = 1:length(L)
    fname = strcat(strcat(strcat('prob_of_orbit_',num2str(L(k))),num2str(k)),'.csv');
    M = csvread(fname);
    
%     set(gcf,'toolbar','none')
    plot(M(:,1),M(:,2),'--ks',...
        'LineWidth',0.5,...
        'MarkerSize',3,...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor',[0.5,0.5,0.5])
    xlabel('Period Order')
    ylabel('Probability')       
    title(strcat('Probability of Period Orders, r =', num2str(r)))
    % Compose and display two multiline text
    % annotations as cell arrays
    str1(1) = {strcat('L = ',num2str(L(k)))};
    text(16,0.8,str1)
    F(k) = getframe; 
%     frameind = frameind+1;    
end

movie(F,20,1) 