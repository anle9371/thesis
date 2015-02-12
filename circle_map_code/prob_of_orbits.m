% compute the probability of a P1, P2, etc. orbit

function res = prob_of_orbits(L, alpha, N, om, k, maxp, iter, x0, tol)

trunc = maxp+5;    % number of results to print
[a,b] = myrand(L,N,alpha);    % make a new random draw for ea realization
orbits = ones(maxp, maxp + 1)*-1;    % as many rows as periods and as many cols as x vals
u = 1;    % row counter for unique orbits array
y = zeros(maxp,2);    % allocate space of results

% iterate thru init conds
% find periodic orbits for each starting x: st(j)
[xv, ~, ~] = arnold(x0, iter, a, b, k, om, N,trunc);
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

% get number of unique P1,P2... orbits for this map
u_orbits = uorbits(orbits);
[urow, ~] = size(u_orbits);
if isempty(u_orbits)
    res = [x0, ones(1,maxp)*-1];
else
    res = [ones(length(urow),1)*x0, u_orbits];
end

% num_periods = u_orbits(1:end,1);
% for w = 1:maxp
%     y(w,1) = w;
%     y(w,2) = sum(num_periods == w);
% end
% 
% p = zeros(maxp,2);
% for i = 1:maxp
%     p(i,1) = mean(y(i,2,:));
%     p(i,2) = sum(y(i,2,:));
% end
% mytotal = sum(p(:,2));
% probs = p(:,2)./mytotal;
% labels = 1:maxp;
end