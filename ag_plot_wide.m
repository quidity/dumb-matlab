function h = ag_plot_wide( X, Y, eY, color )
%AG_PLOT_WIDE h = ag_plot_wide( X, Y, eY, color )
%   Plot Y+-eY as semi-transparent patch, ignores any values for which
% *any* of the values Xi, Yi, eYi are NaN
if (nargin < 4)
    color = ag_color(1);
end
if (size(X, 1) == 1)
    X = X';
    Y = Y';
    eY = eY';
end

D = X+Y+eY; % dummy
idx = isfinite(D);

x = [X(idx);reverse(X(idx))];
y = [Y(idx)+eY(idx);reverse(Y(idx)-eY(idx))];

h = patch(x, y, color, ...
    'EdgeColor', 'none', ...
    'FaceColor', color,...
    'FaceAlpha', 0.5);

end


function t = reverse(T)
    t = NaN(size(T));
    for k = 1:size(T,1)
        t(k,:) = T(end-k+1, :);
    end
end
