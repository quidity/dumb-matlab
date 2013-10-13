function arr = ag_flatten_cells( cells )
%AG_FLATTEN_CELLS Flattens a cell array of matrices into matrices
% need to be same dimensions

if (isempty(cells)) error('No inputs'); end
arr = cell2mat(cells);

end

