function [ o ] = ag_partition_f( fun, x, y, split)
%AG_PARTITION_F o  = ag_rolling_f(fun, x, y, split, align)
%   at each o(k) = fun(x, y) over [split(k) <= x < split(k+1)]
% first dimensions of x and y must have same length
% it's up to fun how many entries to return per line

if (size(split, 1) == 1)
    if (size(split,2) == 1)
        error('AJGOUGH:PARTF:WRONGDIM', 'split has dimensions [1,1,...]');
    end
    split = split';
end

if (size(x, 1) ~= size(y,1))
    error('AJGOUGH:PARTF:WRONGDIM', 'x and y do not have same 1st dimenson');
end

for k = 1:size(split, 1)-1
    % start and end of window
    xs = split(k);
    xe = split(k+1);
    
    if (xs >= xe)
        error('AJGOUGH:PARTF:BADSPLIT', 'xs:%f < xe:%f', xs, xe);
    end
    
    % locate these values
    is = find(x(:,1) >= xs, 1, 'first');
    ie = find(x(:,1) < xe, 1, 'last');
    
    % bad limits are given NaN entries
    if (isempty(is) || isempty(ie))
        continue;
    end
    
    % calculate the function
    o(k, :) = [fun(x(is:ie, 1), y(is:ie, :))];
end


end

