function h = ag_plot_wide_yx( X, eX, Y, color )
%AG_PLOT_WIDE_YX h = ag_plot_wide( X, eX, Y, color )
%   Plot X+-eX as semi-transparent patch, ignores any values for which
% *any* of the values Xi, eXi, Yi are NaN

if (size(X, 1) == 1)
    X = X';
    Y = Y';
    eX = eX';
end

D = X+Y+eX; % dummy
idx = isfinite(D);

x = [X(idx)+eX(idx);reverse(X(idx)-eX(idx))];
y = [Y(idx);reverse(Y(idx))];

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
