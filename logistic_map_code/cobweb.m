% Make a cobweb plot for a 1D difference equation map
% R0 parameter, 0 <= R <= 4
% x0 Initial condition
% N Number of iterations

% Amy Le
% May 29, 2014
% vectorized call to R(x) on 3/13/15

function [xv, t, mymap] = cobweb(x0, iter, a, b, r, N, xlen)
if length(x0) == 1   % iterate the logistic map    
    x = zeros(iter+1,1);    
    k = 1:N;        
    x(1) = x0;
    
    for ic = 1:iter
        xtmp = x(ic)*ones(1,N);
        res = 2*(a'.*cos(2*pi*k.*xtmp) - b'.*sin(2*pi*k.*xtmp));
        myR = exp( log(r) + sum(res) );
        x(ic + 1) = myR * x(ic) * (1 - x(ic));
    end
    if xlen ~= 0
        xv = x(end-xlen+1:end);
    else
        xv = x;
    end
    t = 0;
    mymap = 0;
    
else % the function at every place in [0,1]    
    t = x0;
    myR2 = zeros(length(t),1);    
    for j = 1:length(t)
        myR2(j) = R(t(j),a,b,r,N);
    end
%     disp([t', x0', myR2, a, b])
    mymap = myR2'.*(t.*(1-t));
    xv = 0;    
    
    % % plot cobweb
    plot(t,mymap,'Linewidth',2)
    hold on
    axis('square'); axis([0 1 0 1]);
    set(gca,'XTick',(0:0.2:1),'YTick',(0:0.2:1))
    
    % % plot the line y = x
    fplot('1*y',[0 1],'r');
 
    x = zeros(iter,1);
    x(1) = 0.5;
    for ic = 1:iter
        myR(ic) = R(x(ic),a,b,r,N);
        x(ic + 1) = myR(ic) * x(ic) * (1 - x(ic));
    end
    
%     line([x(1) x(1)],[0 x(2)],'Color','g')
    for ic = iter-100:iter-1
        line([x(ic) x(ic+1)],[x(ic+1) x(ic+1)],'Color','g')
        line([x(ic+1) x(ic+1)],[x(ic+1) x(ic+2)],'Color','g')
        plot(x(ic+1), x(ic+1),'k*');
    end
    line([x(iter) x(iter+1)],[x(iter+1) x(iter+1)],'Color','g')
    xlabel('x_n')
    ylabel('x_{n+1}')
%     title('Random Cobweb Diagram')
    set(gca,'FontSize',15)
    set(findall(gcf,'type','text'),'FontSize',15)
    set(findall(gca, 'Type', 'Line'),'LineWidth',2);
end
end