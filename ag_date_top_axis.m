function [ ax2 ] = ag_date_top_axis( thickness, dates, ax )
%AG_DATE_TOP_AXIS Adds a second axis to ax to put date ticks on the top
%   Detailed explanation goes here

if (nargin < 3)
    ax = gca();
end

xtickvals = interp1(thickness(:,1), thickness(:,2), dates, 'linear', 'extrap');
for k = 1:max(size(dates))
    if (isfinite(xtickvals(k)))
        xticklabels{k} = datestr(dates(k), 'mmm');
    else
        xticklabels{k} = '';
    end
end

xticklabels  = xticklabels(isfinite(xtickvals));
xtickvals = xtickvals(isfinite(xtickvals));
lims = get(ax, 'XLim');
ok = find(xtickvals >= lims(1) & xtickvals <= lims(2));
xticklabels = xticklabels(ok);
xtickvals = xtickvals(ok);

ax2 = axes('Position',get(ax,'Position'), 'Color', 'none');

set(ax2, 'XAxisLocation', 'top', ...
    'XLim', get(ax, 'XLim'), 'YLim', get(ax, 'YLim'), ...
    'YTick', [], 'XTick', xtickvals, ...
    'XTickLabel', xticklabels, 'TickDir', 'out');
    

end

