% Make a cobweb plot for a circle map
% no randomness if q = 0
% x0 Initial condition in [0,1]
% w driving frequency in [0,1]
% k coupling strength in [0,1]

% Amy Le
% Feb 4, 2014
function circ_cobweb(w,k,x0,N,L,alpha,q)
close all
iter = 1000;
x = zeros(iter+1,1);
x(1) = x0;
t = linspace(0,1,iter);

if q == 0
    for ic = 1:iter
        x(ic + 1) = x(ic) + w - (k/(2*pi))* sin(2 * pi * x(ic));
        x(ic+1) = mod(x(ic+1),1.0);
    end
    
    % plot the map function
    mymap = t + w - (k/(2*pi)) * sin(2 * pi * t);
    mymap = mod(mymap,1.0);
    figure
    %     title('Deterministic Cobweb Diagram')
    
    % line([x(iter) x(iter+1)],[x(iter+1) x(iter+1)],'Color','g')
    % % Add comments to plot
    % % at = text(0.1,0.82,['R_0 = ',num2str(R0)]); set(at,'FontSize',12);
    % % title(['R_0 = ',num2str(R0), ', x_0 = ',num2str(x0), ', N = ',num2str(N)])
else
    iter = iter*2;
    x = zeros(iter,1);
    x(1) = x0;
    kk = 1:N;
    [a,b] = myrand(L,N,alpha);
    % % bifurcation diagram calcs
    for i = 1:iter-1
        xtmp = x(i)*ones(1,N);
        res = 2*(a'.*cos(2*pi*kk.*xtmp) - b'.*sin(2*pi*kk.*xtmp));
        myW = exp( log(w) + sum(res) );
        x(i+1) = x(i) + myW - (k/(2*pi)) * sin(2.0 * pi * x(i));
        x(i+1) = mod(x(i+1),1.0);
    end
    
    %smooth function
    myW = zeros(1,length(t));
    for i = 1:length(t)
        xtmp = t(i)*ones(1,N);
        res = 2*(a'.*cos(2*pi*kk.*xtmp) - b'.*sin(2*pi*kk.*xtmp));
        myW(i) = exp( log(w) + sum(res) );
    end
    
    mymap = mod(t + myW - (k/(2*pi)) * sin(2.0 * pi * t),1);
    figure
    %     title('Random Cobweb Diagram')
end
hold on
plot(t,mymap,'b.','MarkerSize',5)
axis([0 1 0 1]);
set(gca,'XTick',(0:0.2:1),'YTick',(0:0.2:1))

% % plot the line y = x
fplot('1*y',[0 1],'r');

% % plot cobweb
%  line([x(1) x(1)],[0 x(2)],'Color','g')
%  plot(x(1), x(1),'k*');
for ic = iter-30:iter-2
    line([x(ic) x(ic+1)],[x(ic+1) x(ic+1)],'Color','g')
    line([x(ic+1) x(ic+1)],[x(ic+1) x(ic+2)],'Color','g')
    plot(x(ic+1), x(ic+1),'k*');
end
xlabel('x_n')
ylabel('x_{n+1}')
set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
set(findall(gca, 'Type', 'Line'),'LineWidth',2);
end