% compute the probability of a P1, P2, etc. orbit
% L = correlation length
% N = num Fourier modes
% r = constant in [0,4]
% xrng = number of initial conditions
% maxp = max number of orbit periods

function p = prob_of_orbits(L, N, alpha, omega, k, xrng, numiters, maxp)
tol = 10e-6;
xlen = maxp+5;    % number of results to print
iter = 1000;    % number of x values in the cobweb

maxsize = ceil(0.5*maxp*numiters);
% st = linspace(0+tol,1-tol,xrng);    % vector of initial conditions
st = rand(xrng,1);
u = 1;
y = zeros(maxp,2); % histogram data
p = zeros(maxp,3); %[period, avg_num, stderr]
orbits = ones(maxsize, maxp + 1)*-1;    % as many rows as periods and as many cols as x vals

for i = 1:numiters    
    [a, b] = myrand(L,N,alpha);
    
    % iterate thru init conds. find periodic orbits
    for j = 1:xrng
        [xv, ~, ~] = arnold(st(j), iter, a, b, k, omega, N, xlen,1);
        
        for w = 1:maxp    % check period of orbit
            if abs(xv(end-w) - xv(end)) < tol
                orbits(u,1) = w;    % w is period order
                orbits(u,2) = xv(end);        % xv has orbit location
                
                for v = 3:w+1    % get higher order period orbit locations
                    orbits(u,v) = xv(end-v+2);
                end
                
                u = u + 1;    % row counter
                if u > maxsize
                    disp('u > maxsize')
                end
                break
            end
        end
        
    end
end

% get number of unique P1,P2... orbits for this map
u_orbits = uorbits( orbits, tol ); 
if isempty(u_orbits)
    p = [];
else
    num_periods = u_orbits(1:end,1); % all periods observed in col 1
    for w = 1:maxp
        y(w,1) = w;
        y(w,2) = sum(num_periods == w); % count period w orbits found
    end
    
    total_orbs = xrng*numiters;%sum(y(:,2))    
    labels = 1:maxp;
    p(:,1) = labels';
    p(:,2) = y(:,2)/total_orbs;
    p(:,3) = sqrt((1/(total_orbs-1))*(std(p(:,2)))^2);
end
end