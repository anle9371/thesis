% bound the map at each position
% L = 0.1;   % max length
% N = 100;   % max number of modes
% w = 0.4;
% k = 1;
% xlen = 25;    % number of results to print

function envelope(k,w,alpha,N,L)

iter = 1000;    % number of x locations
kmax = 500;    % number of different realizations
st = linspace(0,1,kmax);    % vector of initial conditions
trunc = 0;

myextrema = zeros(kmax,3);
myextrema(:,1) = st';    %col1 = x position in [0,1]
myextrema(:,2) = ones(kmax,1);   %col2 = min, col3 = max
allmydata = zeros(kmax,kmax);

for kind = 1:kmax
    [a,b] = myrand(L,N,alpha);    % make a new random draw for ea realization
    [~, ~,mymap] = arnold(st, iter, a, b, k, w, N, trunc,1);
    allmydata(kind,:) = mymap;    
    if kind == ceil(kmax/2)
        plot(st,mymap,'r.','Markersize',10)
        hold on
    elseif kind == ceil(kmax*(2/3))
        plot(st,mymap,'r.','Markersize',10)
    end
    clear mymap
end

myextrema(:,2) = min(allmydata)';   %black
myextrema(:,3) = max(allmydata)';   %blue
plot(myextrema(:,1),myextrema(:,2),'k.',myextrema(:,1),myextrema(:,3),'b.','markersize',10)
xlabel('x_n')
ylabel('x_{n+1}')
axis([0 1 0 1])
set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
h=gcf;
name = ['envelope_unif_',num2str(kmax),'_k',num2str(k),'_L',num2str(L),'_w',num2str(w),'.png'];
path = 'C:\Users\amy\Dropbox\thesis\circle_map_code\figures\';
saveas (h, [path,name], 'png');

end