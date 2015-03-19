function QEMcelltocsv(fn,x,wa)
%QEMcelltocsv	Write cell array x to a .csv file, fn.
%
%QEMcelltocsv(fn,x,wa)
%
%	fn is the file name, including full path if required.
%	x is the cell array to be written.
%	wa is the write ('w') or append ('a') mode for fopen.
%
%	All columns of x are assumed to be of the same layout.
if nargin < 3
    wa = [];
end
if isempty(wa)
    wa = 'w';
end
fid = fopen(fn,wa);
if fid < 0
    error('File open failed')
end
%
% Build the format string.
%
[m,n] = size(x);
fs = '';
for j = 1:n
    if isstr(x{1,j})
        fs = [fs,'%s,'];
    else
        fs = [fs,'%0.20g,'];
    end
end
fs(end:end+1) = '\n'; % Append newline
%
% Now work through the cell array one row at a time.
%
s = []; % We print to a string, then write to a file.
for i = 1:m
    s = [s,sprintf(fs,x{i,:})]; % Print a row at a time
end
fwrite(fid,s); % Write it all to the file in one go
fclose(fid);
