function [ output ] = ag_foreach( fun, collection )
%AG_FOREACH Execute fun(x) for each collection{x} or collection(x)
% Returns output of the same type and shape as collection

dims = size(collection);

if (isa(collection, 'cell'))
    if (nargout > 0)
        output = cell(dims);
        for k = 1:prod(dims)
            output{k} = fun(collection{k});
        end
    else
        for k = 1:prod(dims)
            fun(collection{k});
        end
    end
elseif (isa(collection, 'struct'))
    if (nargout > 0)
        for k = 1:prod(dims)
            output(k) = fun(collection(k));
        end
        output = reshape(output, dims);
    else
        for k = 1:prod(dims)
            fun(collection(k));
        end
    end
elseif (isa(collection, 'numeric'))
    if (nargout > 0)
        output = NaN(dims);
        for k = 1:prod(dims)
            output(k) = fun(collection(k));
        end
    else
        for k = 1:prod(dims)
            fun(collection(k));
        end
    end
else
    error('AJGOUGH:FOREACH:UNKNOWN', 'Do not understand');
end


end

