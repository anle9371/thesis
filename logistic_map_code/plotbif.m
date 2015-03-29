% plot the bifurcation diagram for the rand log map
% read the data file in fname line by line to plot

function plotbif(pth, fname, L, rlen, x0len, maxp)
close all

% plot params
si = 3; % markersize
loc = 3; % start index of orbit locations
c = linspace(1,10,maxp); % colormap

tikind = 1:10:length(c);
tik = c(tikind);
maxp_vec = 1:maxp;
tiklb = maxp_vec(tikind);

% plot labels
figure
hold on
axis([0 4 0 1])
set(gcf,'position',get(0,'screensize'))
xlabel('r')
ylabel('x')
t = ['L = ',num2str(L),', N_r = ', num2str(rlen), ', N_x_0 = ', num2str(x0len), ', p_{max} = ',num2str(maxp)];
title(t);

% fname = [pth,froot,num2str(L),'.csv'];
fid = fopen([pth,fname],'r');
tline = fgets(fid);
while ischar(tline)   % go thru all rows of M
    t1 = cellstr(tline);
    t2 = strjoin(t1);
    M = str2double(strsplit(t2,','));
    myperiod = M(2);    % period order
    w = M(1);   % r value
    
    if myperiod > 0        
        myorbsize = ones(myperiod,1);
        rv = w*myorbsize;    
        xv = M(loc:loc+myperiod-1);
        cv = c(myperiod)*myorbsize;
        scatter(rv,xv,si,cv,'filled')
    end
    tline = fgets(fid);
end
fclose(fid);

% save with meaningful title
cb = colorbar('YTick',tik,'YTickLabels',tiklb);
set(gca,'FontSize',15)
set(findall(gcf,'type','text'),'FontSize',15)
h = gcf;
pname = ['rlog_bif_L_',num2str(L),'.png'];
saveas (h, [pth,pname], 'png');
end
