function [ out ] = ag_concat_cells( varargin )
%AG_CONCAT_CELLS Summary of this function goes here
%   Detailed explanation goes here

num = 1;
for k = 1:size(varargin, 2)
    for m =1:size(varargin{k}, 2)
        out{num} = varargin{k}{m};
        num = num+1;
    end
end

end

