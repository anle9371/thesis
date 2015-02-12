% get location of orbits for bifurcation diagram

function res = bif_orbs(N, om, k, maxp, iter, x0, tol,a,b)

trunc = maxp+5;    % number of results to print
orbits = ones(maxp, maxp + 1)*-1;    % as many rows as periods and as many cols as x vals
u = 1;    % row counter for unique orbits array

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
% first column is value of omega
% remaining data is x location of orbit & period order
u_orbits = uorbits(orbits);
[urow, ~] = size(u_orbits);
if isempty(u_orbits)
    res = [om, ones(1,maxp)*-1];
else
    res = [ones(length(urow),1)*om, u_orbits];
end
end