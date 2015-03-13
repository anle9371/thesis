% get unique orbits
% input
% orbits = array of all orbit orders + locations 
% tol = tolerance

% output
% w = array of orbit orders + unique orbit locations

function [ w ] = uorbits( orbits, tol )
orbits = sort(orbits,2,'descend'); % sort orbits by row in desc order
u_orbits = unique(orbits,'rows');  % delete repeating rows
[row, col] = size(u_orbits);

% delete more rows based on tol
for i = 2:row
    if u_orbits(i,1) == u_orbits(i-1,1)
        if norm(u_orbits(i,:) - u_orbits(i-1,:)) <= tol
            u_orbits(i-1,:) = ones(1,col)*-1;            
        end
    end    
end

% delete the -1 rows
w = unique(u_orbits,'rows');
if w(1,1) == -1   % if the first element is -1, delete it
    w = w(2:end,:);
end
end