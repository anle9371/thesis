function Tongues(kmin,kmax,om,oM,m,n )
%Tongues Compute the Arnold tongues
%   krange from 0 to kmax, Compute on an m x n grid

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
                
% figure('Color',[1,1,1],'Position',[10,10,800,800])
period = flipud(period+1);   %reflect image to get proper orientation
image(period)   ;                    %add one to get 1 based image
%colormap([lines(10);hsv(tmax-10);0*white(1)])
colormap([prism(6);hsv(94);0*white(1)]);
xlabel('\omega', 'FontSize', 14)
ylabel('k', 'FontSize', 14)
end

