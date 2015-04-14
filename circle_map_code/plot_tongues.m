function plot_tongues(pth, fname,pmax, n)
close all
wmin = 0;
kmin = 0;
kmax = 1.5;
wmax = 1;
nstep = n;
omegavect = linspace(wmin, wmax, nstep);
kvect = linspace(kmin,kmax,nstep);

period = csvread([pth,fname,'.csv']);
% set up figure
set(gcf,'position',get(0,'screensize'))

image(period-1)   ;                    %minus one to get 1 based image

% custom colormap
c1 = colorcube(pmax);
colormap([c1(1:ceil(pmax/2),:); jet(ceil(pmax/2)-1) ;0*white(1)]);
cb = colorbar;

% axis labels
xlabel('\omega')
set(gca,'XTickMode', 'Manual');
oind = 0:ceil(nstep/10):nstep;
oind = oind(2:end);
strom = strsplit(sprintf('%1.1f ',omegavect(oind)));
set(gca,'XTickLabel',strom)

set(gca,'YLim', [0 nstep])
ylabel('k')
set(gca,'YTickMode', 'Manual');
kind = 0:ceil(nstep/10):nstep;
kind = kind(2:end);
strk = strsplit(sprintf('%1.1f ',fliplr(kvect(kind))));
set(gca,'YTickLabel',strk)
set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)

% save a data and png file

% name = ['tongues_norm_',num2str(nstep),'_L_',num2str(L),'.png'];
% path = 'C:\Users\swamy\Documents\amy\thesis\circle_map_code\circle_map_code\figures\normal_tongues\';
% 'C:\Users\amy\Dropbox\thesis\circle_map_code\figures\tongues\';
% dlmwrite([path,['tongues_norm_',num2str(nstep),'_L_',num2str(L),'.csv']],period)
saveas (gcf, [pth,fname,'.png']);
end