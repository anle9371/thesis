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
alpha = 10e-5;
[a, b] = myrand(L,N,alpha);
iter = 1200;
trunc = 150;   % will make arnold return a vec 150 units long

% iterate the map, remove transients
% go thru each ic in x0 and each k,w value
% arnold returns a vector xt of final postions
% look for period order in xt
for i = 1:nstep
    disp(i)
    for j = 1:nstep
        [xv,~,~] = arnold(x0(i,j), iter, a, b, kvect(i), omegavect(j), N, trunc,0);
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

figure('Color',[1,1,1])
period = flipud(period);   %reflect image to get proper orientation
image(period)   ;                    %add one to get 1 based image
colormap([prism(6);hsv(94);0*white(1)]);
% xlabel('\omega')
% ylabel('k')
h = gcf;
name = ['tongues_',num2str(nstep),'_L_',num2str(L),'.png'];
path = 'C:\Users\amy\Dropbox\thesis\circle_map_code\figures\';
saveas (h, [path,name], 'png');
end