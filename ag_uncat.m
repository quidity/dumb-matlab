function  varargout = ag_uncat( A, dim )
%UNTITLED Summary of this function goes here
%   dim is 1 or 2
if (nargout ~= size(A, dim))
    error('wrong number of output arguments');
end
if (dim == 1)
    A = A';
end

for k = 1:size(A, 2)
    varargout(k) = {A(:,k)};
end

end

