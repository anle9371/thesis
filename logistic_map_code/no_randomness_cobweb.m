% Make a cobweb plot for a 1D difference equation map
% R0 parameter, 0 <= R <= 4
% x0 Initial condition
% N Number of iterations

% Amy Le
% May 29, 2014

% logistic map
close all
iter = 1000;
x0 = 0.2;
x = zeros(iter+1,1);
myR = 3.5;
x(1) = x0;
for ic = 1:iter
    %     x(ic+1) = R0*x(ic)*(1-x(ic));
    x(ic + 1) = myR * x(ic) * (1 - x(ic));
end

% plot the map function
t = linspace(0,1,length(x));
mymap = myR'.*(t.*(1-t));
plot(t,mymap)
% ,'--ks',...
%     'LineWidth',0.5,...
%     'MarkerSize',3,...
%     'MarkerEdgeColor','b',...
%     'MarkerFaceColor',[0.5,0.5,0.5])
hold on
axis('square'); axis([0 1 0 1]);
set(gca,'XTick',(0:0.1:1),'YTick',(0:0.1:1))
% grid on;

% % plot the line y = x
fplot('1*y',[0 1],'r');
% 
% % plot cobweb
 line([x(1) x(1)],[0 x(2)],'Color','g')
 plot(x(1), x(1),'k*');
for ic = 1:3
    line([x(ic) x(ic+1)],[x(ic+1) x(ic+1)],'Color','g')
    line([x(ic+1) x(ic+1)],[x(ic+1) x(ic+2)],'Color','g')
    plot(x(ic+1), x(ic+1),'k*');
end
text(x(1)-.02,x(1)+.1,'\uparrow','fontsize',20)
text(x(2)-.02,x(2)+.1,'\uparrow','fontsize',20)
text(x(2)-.3,x(2)+.01,'\rightarrow','fontsize',20)
% line([x(iter) x(iter+1)],[x(iter+1) x(iter+1)],'Color','g')
% title('Deterministic Cobweb Diagram')
% 
% % Add comments to plot
% % at = text(0.1,0.82,['R_0 = ',num2str(R0)]); set(at,'FontSize',12);
% % title(['R_0 = ',num2str(R0), ', x_0 = ',num2str(x0), ', N = ',num2str(N)])
xlabel('x_n')
ylabel('x_{n+1}')