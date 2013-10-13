function [ o ] = ag_rolling_f( fun, x, y, window, align )
%AG_ROLLING_F o  = ag_rolling_f(fun, x, y, window)
%   at each o(k) = fun(x, y) over window, centered on x(k), squashes at
%   includes all x such that x(i) > x(k)-window/2, x(i) <= x(k) + window/2
% first dimensions of x and y must have same length
% it's up to fun how many entries to return per line
% align can be 'middle', 'front', 'end'
%   front : consider points from ahead of the point only
%  middle : consider points from both sides of the point
%     end : consider points before the point
%  default is 'middle'

PL_S = -1/2;
PL_E = +1/2;
% allow the window to align in various places...
if (nargin > 4)
    if (strcmp(align, 'middle'))
        PL_S = -1/2; PL_E = +1/2;
    elseif (strcmp(align, 'front'))
        PL_S = 0; PL_E = +1;
    elseif (strcmp(align, 'end'))
        PL_S = -1; PL_E = 0;
    end
end

if (size(x, 1) ~= size(y,1))
    error('x and y do not have same 1st dimenson');
end

for k = 1:size(x, 1)
    % start and end of window
    xs = x(k) + PL_S * window;
    xe = x(k) + PL_E * window/2;
    
    % locate these values
    is = find(x(:,1) > xs, 1, 'first');
    ie = find(x(:,1) <= xe, 1, 'last');
    
    % force window to edges of data
    if (isempty(is) || is < 0)
        is = 1;
    end
    if (isempty(ie) || ie > size(x, 1))
        ie = size(x,1);
    end
    
    % calculate the function
    o(k, :) = [fun(x(is:ie, 1), y(is:ie, :), k-is + 1)];
end


end

