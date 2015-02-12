%envelope movie

%making a movie

clear
clc
close all

global tol

nFrames = 10;
figure('Renderer','zbuffer')
set(gca,'NextPlot','replaceChildren');
% cMovie(nFrames) = struct('cdata',[],'colormap',[]);
frameind = 1;
tol = 10e-6;
r = linspace(0+tol,4-tol,20);
kmax = 500; 
axis([0 1 0 1]) 
axis manual
for k = 1:length(r)
    fname = strcat(strcat(strcat('envelope_',num2str(kmax)),num2str(r(k))),'.csv');
    myextrema = csvread(fname);    
    plot(myextrema(:,1),myextrema(:,2),'b',myextrema(:,1),myextrema(:,3),'k')
    xlabel('x_n')
    ylabel('x_{n+1}')
    title('Upper and lower bounds on the random logistic map')
    % Compose and display two multiline text
    % annotations as cell arrays
    str1(1) = {strcat('r = ',num2str(r(k)))};
    text(.8,.9,str1)
    F(k) = getframe; 
end

movie(F,20,1) 