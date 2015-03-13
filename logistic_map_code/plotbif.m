%plot the bifurcation diagram for the rand log map

function plotbif(fname, L, rlen, N, x0len, maxp, tol, numSims)
close all
% load data from fname to memory
M = dlmread(fname); %col1 = r, col2 = order, col3:end = locations
[numrows,~] = size(M);

% plot
si = 12; % markersize 
loc = 3; % start index of orbit locations
figure
hold on
for i = 1:numrows   % go thru all rows of M
    myperiod = M(i,2);    % col2 = order    
    w = M(i,1);   % col1 = r
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
% text(xlim(2),ylim(2),['\fontsize{10}{\color{blue}1 \color{red}2 '...
% '\color[rgb]{0 1 1}3 \color{magenta}4 \color{green} 5} >5'],...
%    'VerticalAlignment','bottom',...
%    'HorizontalAlignment','left')
% title('Bifurcation diagram')
xlabel('r')
ylabel('x')

% save with meaningful title
t = ['L = ',num2str(L),', N_r = ', num2str(rlen), ', N_x_0 = ', num2str(x0len), ', p_{max} = ',num2str(maxp)];
title(t);
set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
h = gcf;
name = ['rlog_bif_L_',num2str(L),'.png'];
path = 'C:\Users\amy\Dropbox\thesis\logistic_map_code\bifurcation_data\';
saveas (h, [path,name], 'png');
end
