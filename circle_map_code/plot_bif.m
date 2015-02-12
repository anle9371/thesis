function plot_bif(M,k,numSims,si)
x = M(:,1); % x axis values are the omegas
[r,~] = size(M);
loc = 3;

figure
hold on
for i = 1:r
    myperiod = M(i,2);    
    w = x(i);
    switch myperiod    % ignores the -1 entries
        case 1
            plot(w*ones(myperiod,1),M(i,loc:loc+myperiod-1),'b.','markersize',si)
        case 2
            plot(w*ones(myperiod,1),M(i,loc:loc+myperiod-1),'r.','markersize',si)
        case 3 
            plot(w*ones(myperiod,1),M(i,loc:loc+myperiod-1),'c.','markersize',si)
        case 4
            plot(w*ones(myperiod,1),M(i,loc:loc+myperiod-1),'m.','markersize',si)
        case 5
            plot(w*ones(myperiod,1),M(i,loc:loc+myperiod-1),'g.','markersize',si)
    end
    if myperiod > 5
            plot(w*ones(myperiod,1),M(i,loc:loc+myperiod-1),'k.','markersize',si)
    end
end
ylim =get(gca,'YLim');
xlim =get(gca,'XLim');
text(xlim(2),ylim(2),['\fontsize{10}{\color{blue}1 \color{red}2 '...
'\color[rgb]{0 1 1}3 \color{magenta}4 \color{green} 5} >5'],...
   'VerticalAlignment','bottom',...
   'HorizontalAlignment','left')
title('Bifurcation diagram')
xlabel('\omega')
ylabel('x')
t = strcat('Bifurcation diagram for k = ',num2str(k));
p = strcat(' and numSims =',num2str(numSims));
title([t,p]);
h = gcf;
% print (h, '-dpng', [t,p]);
end