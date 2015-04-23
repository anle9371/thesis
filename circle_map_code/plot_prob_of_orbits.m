% plotting orbit histogram
% data = [period, avg_num, stderr]
function plot_prob_of_orbits(data, pth, fname, L, w, k, maxp)
close all

% bar(data(:,1),data(:,2),'g')
% hold on
% h = errorbar(data(:,1),data(:,2),data(:,3),'k');
% set(h(1),'linestyle','none');
% set(gca,'YScale','log')
% set(gca,'YDir','reverse')
semilogy(data(:,1),data(:,2),'k.','MarkerSize',12)
fname = [fname,'semilogy'];

title(['L = ',num2str(L),', r = 3.3'])%\omega = ',num2str(w), ', k = ',num2str(k)])
xlabel('Period')
ylabel('Average Fraction of Period p Orbits')
xlim([0 maxp])

set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
% set(gcf,'position',get(0,'screensize'))
% saveas (gcf, [pth,fname,'.png'], 'png');
saveas (gcf, ['C:\Users\amy\Dropbox\thesis\writeup\figs\',fname,'.png'], 'png');
end