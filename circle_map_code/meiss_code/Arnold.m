function [ x ] = Arnold( x,numits )
%UNTITLED2 Arnold circle map
%   Given arrays for x, ktpi & omega, iterate the map

global omega ktpi tpi

for i = 1:numits
   x = x+ omega - ktpi.*sin(tpi*x);
%    x = x - floor(x);
   x = mod(x,1); 
end
end


