% avg # of period 1 orbits over all sims
% avgp = [avg, stddev, stderr];
function plotavg(M, maxp, numSims, xrng)
ns = 0;
count = 0;
mydata = zeros(numSims,2);
avgp = zeros(maxp,3);

for myp = 1:maxp
    for i = 1:length(M)
        if mod(i, xrng) ~= 1
            if M(i,2) == myp %find a period p orbit
                count = count + 1;% increment the count
            end
            mydata(ns, 1) = ns;
            mydata(ns, 2) = count;
        else
            ns = ns + 1;
            count = 0;
        end
    end
    stddev = std(mydata(:,2));
    avg = mean(mydata(:,2));
    stderr = sqrt((1/(numSims-1))*(stddev^2));
    avgp(myp, :) = [avg, stddev, stderr];    
    mydata = zeros(numSims,2);
end

% plot the avg number of p orbits with error bars
figure
s = num2str(numSims);
t = strcat(s, ' Simulations');
h=errorbar(1:52, avgp(:,1), avgp(:,3),'rx');
set(get(h,'Parent'), 'YScale', 'log')
xlabel('period order')
ylabel('average number of orbits')
title(['Average number of orbits;',t])
dlmwrite('avg_p.csv',avgp)
end

% plot the number of orbits observed for each sim
% mp = strcat(['mean number of p',num2str(myp)],' orbits');
% bar(mydata(:,1),mydata(:,2))
% xlabel('simulation number')
% ylabel('number of orbits')
% title(mp)%'Number of Period 1 Orbits in 200 Simulations')
%
%
% disp(mp)
% disp(mean(mydata(:,2)))
% disp('standard deviation')
% disp(stddev)
% disp('standard error')
% disp(sqrt((1/(numSims-1))*(stddev^2)))