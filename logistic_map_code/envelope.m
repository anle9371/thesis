% bound the map at each position 

function envelope(r,N,L,xlen)

% L = 0.1;   % max length
% N = 100;   % max number of modes
% r = 3.2;     % expectation of xi, E[xi] = ln(r)
% xlen = 25;    % number of results to print

iter = 1000;    % number of x locations
kmax = 500;    % number of different realizations
st = linspace(0,1,kmax);    % vector of initial conditions

myextrema = zeros(kmax,3);
myextrema(:,1) = st';
myextrema(:,2) = ones(kmax,1);
allmydata = zeros(kmax,kmax);

for k = 1:kmax
    [a,b] = myrand(L,N,r);    % make a new random draw for ea realization
    [~, ~,mymap] = cobweb(st, iter, a, b,r,N,xlen);   
    allmydata(k,:) = mymap;
    if k == 250
        plot(st,mymap,'r','Linewidth',2)
        hold on
    elseif k == 475
        plot(st,mymap,'r','Linewidth',2)
    end
    
end

myextrema(:,2) = min(allmydata)';
myextrema(:,3) = max(allmydata)';
% csvwrite(strcat(myname, '.csv'),myextrema)
plot(myextrema(:,1),myextrema(:,2),'k',myextrema(:,1),myextrema(:,3),'k','Linewidth',2)
xlabel('x_n')
ylabel('x_{n+1}')
axis([0 1 0 1])
% title('Upper and lower bounds on the random logistic map')
set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
h=gcf;
name = ['envelope_',num2str(kmax),'_r',num2str(r),'_L',num2str(L),'.png'];
path = 'C:\Users\amy\Dropbox\thesis\logistic map code\figures\';
saveas (h, [path,name], 'png');

end