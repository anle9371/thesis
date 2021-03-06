% arnold tongues picture
% Amy Le, Feb 19, 2015
% in:
% [kmin, kmax] = range over k values
% [wmin, wmax] = range over omega values
% nsteps = create an nstep x nstep grid for display

function tongues(kmin, kmax, wmin, wmax, nstep, L, N)

tol = 0.0001;
pmax = 100;   % max period
x0 = zeros(nstep,nstep);    % x has nstep init conditions, all same
period = pmax - zeros(nstep,nstep);   % all periods have order 100
omegavect = linspace(wmin, wmax, nstep);
kvect = linspace(kmin,kmax,nstep);

% random draws
alpha = .5*(10e-5);
if N < (10/L)
    N = ceil(10/L);
end
[a, b] = myrand(L,N,alpha);
iter = 1200;
trunc = 150;   % will make arnold return a vec 150 units long

% iterate the map, remove transients
% go thru each ic in x0 and each k,w value
% arnold returns a vector xt of final postions
% look for period order in xt
for i = 1:nstep
    disp(['tongue iter: ',num2str(i)])
    for j = 1:nstep
        [xv,~,~] = arnold(x0(i,j), iter, a, b, kvect(i), omegavect(j), N, trunc,1);
        if isnan(xv(end)) == 0
            for w = 1:pmax    % check period of orbit
                if abs(xv(end-w) - xv(end)) < tol
                    period(i,j) = w;    % w is period order; default period is pmax
                    break
                end
            end
        end

    end
end


% set up figure
set(gcf,'position',get(0,'screensize'))
period = flipud(period);   %reflect image to get proper orientation
image(period)   ;      

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
h = gcf;
name = ['tongues_u_halfa_',num2str(nstep),'_L_',num2str(L),'.png'];
% 'C:\Users\swamy\Documents\amy\thesis\circle_map_code\circle_map_code\figures\normal_tongues\';
pth = 'C:\Users\amy\Dropbox\thesis\circle_map_code\figures\tongues\halfa\';
dlmwrite([pth,['tongues_u_halfa_',num2str(nstep),'_L_',num2str(L),'.csv']],period)
saveas (h, [pth,name], 'png');
end