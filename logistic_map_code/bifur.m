% compute the probability of a P1, P2, etc. orbit
% input
% r = param in [0,4]
% N = num fourier modes, usually 100
% a,b = rand vecs based on prob dist
% x0 = intial condition
% maxp = max num period to look for
% tol = tolerance

% output
% myorbs = array:
% myorbs(:,1) = r,
% myorbs(:,2) = period order
% myorbs(:,3:maxp) = unique orbit locations for (r,L,x0) tuple

function myorbs = bifur(r, N, a, b, x0, maxp, tol)    
trunc = 2*maxp;   % truncate the list of iterates at this length
iter = 1000 + maxp; % number iterations of cobweb for one x0
orbits = -1*ones(length(x0),maxp+1);
u = 1;


for i = 1:length(x0)
    [xv, ~, ~] = cobweb(x0(i), iter, a, b, r, N, trunc);
    for w = 1:maxp    % check period of orbit
        if abs(xv(end-w) - xv(end)) < tol
            orbits(u,1) = w;    % w is period order
            orbits(u,2) = xv(end);        % xv has orbit location
            
            for v = 3:w+1    % get higher order period orbit locations
                orbits(u,v) = xv(end-v+2);
            end
            
            u = u + 1;    % row counter
            break
        end
    end
end


myorbs = uorbits(orbits, tol);
[urow, ucol] = size(myorbs);
if isempty(myorbs)
    myorbs = [];%[r, -1*ones(1,ucol)];  % record divergence for this r
else
    myorbs = [r*ones(urow,1), myorbs];
end

end