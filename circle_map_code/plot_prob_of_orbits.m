% plotting orbit histogram
% data = [period, avg_num, stderr]
function plot_prob_of_orbits(data, pth, fname, L, w, k, maxp)
close all

bar(data(:,1),data(:,2),'g')
hold on
h = errorbar(data(:,1),data(:,2),data(:,3),'k');

set(h(1),'linestyle','none');
title(['L = ',num2str(L),', w = ',num2str(w), ', k = ',num2str(k)])
xlabel('Period')
ylabel('Average Number of Period p Orbits')
xlim([0 maxp])

set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
set(gcf,'position',get(0,'screensize'))
fh = gcf;
saveas (fh, [pth,fname,'.png'], 'png');
end