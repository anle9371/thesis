function Tongues(kmin,kmax,om,oM,m,n )
%Tongues Compute the Arnold tongues
%   krange from 0 to kmax, Compute on an m x n grid
close all

global omega ktpi tpi
tpi = 2*pi;
eps = 0.0001;
tmax = 100;

x = zeros(m,n);
period = tmax - zeros(m,n);
omegavect = linspace(om,oM,m);
kvect = linspace(kmin,kmax,n)/tpi;
[omega,ktpi] = meshgrid(omegavect,kvect);

%Eliminate Transients
    x = Arnold(x,500);

%Find periodic orbits
    x0 = x;

for t=1:tmax
    x = Arnold(x,1);
    dx = abs(x-x0);
    for i = 1:m
        for j=1:n
            if (dx(i,j) <eps) && (period(i,j)==tmax)
                period(i,j) = t-1;
            end;
        end;
    end;
end;
                

set(gcf,'position',get(0,'screensize'))
period = flipud(period+1);   %reflect image to get proper orientation
image(period)   ;                    %add one to get 1 based image
%colormap([lines(10);hsv(tmax-10);0*white(1)])
% colormap([prism(6);hsv(94);0*white(1)]);
c1 = colorcube(tmax);
colormap([c1(1:ceil(tmax/2),:); jet(ceil(tmax/2)-1) ;0*white(1)]);
% colormap([colorcube(6);hsv(95)]);

cb = colorbar;
xlabel('\omega')
set(gca,'XTickMode', 'Manual');
oind = 0:ceil(m/10):m;
oind = oind(2:end);
strom = strsplit(sprintf('%1.1f ',omegavect(oind)));
set(gca,'XTickLabel',strom)

set(gca,'YLim', [0 n])
ylabel('k')
set(gca,'YTickMode', 'Manual');
kind = 0:ceil(n/10):n;
kind = kind(2:end);
strk = strsplit(sprintf('%1.1f ',fliplr(2*pi*kvect(kind))));
set(gca,'YTickLabel',strk)

set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
end

