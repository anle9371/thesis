% observed periodic orbits over 200 sims
function uhist(M, numSims)
M1 = unique(M , 'rows');    % get unique orbits
M1 = sortrows(M1,2);    %sort by period order

s = num2str(numSims);
t = strcat(s, ' Simulations');
figure
hist(M1(21:end,2),52)
xlabel('period order')
ylabel('frequency')
title(['Histogram of Uniquely Observed Periodic Orbits;',t])
end