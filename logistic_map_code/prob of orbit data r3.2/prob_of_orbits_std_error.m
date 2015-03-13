% std error (error in the mean) of orbits across simulations
% OUTPUT: stats matrix, where:
% each row corresponds with each period order
% col 1 -> avg across all period z orbits from the .csv files
% col 2 -> median ''        ''
% col 3 -> std dev ''        '' 
% col 4 -> std error ''        ''

clear
clc
close all

kmax = 1;
maxp = 20;
stats = zeros(maxp,4);

% alldata = zeros(20,100);
k = 1;

for i = 1:100   % go through each member of the sample set
    myname = strcat(strcat(strcat('prob_of_orbit_',num2str(kmax)),num2str(i)),'.csv');
    odata = csvread(myname);
    if isnan(odata(:,2))
    else
        if k < 100
            alldata(:,k) = odata(:,2);    % collect all data in one matrix
            k = k + 1;
        end
    end
end

[~,c] = size(alldata);
% for i = 1:c
%     alldata = alldata(isfinite(alldata(:, i)), :);
% end
% for each orbit, compute the median, avg, and std dev
for i = 1:maxp
    stats(i,1) = mean(alldata(i,:));
    stats(i,2) = median(alldata(i,:));
    stats(i,3) = std(alldata(i,:));
    stats(i,4) = sqrt((1/(c-1))*(stats(i,3))^2);
end

bar(1:maxp,stats(:,1),'g')
hold on
h = errorbar(1:maxp,stats(:,1),stats(:,4),'k');
set(h(1),'linestyle','none');
title('Average fraction of order p orbits')
xlabel('Orbit order (p)')
ylabel('Average fraction')
% axis([0 20 0 0.06])