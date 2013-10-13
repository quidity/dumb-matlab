function r = ag_do_vary( fun, flatten, args, varyargs )
%AG_DO_VARY Run a function with varying inputs (eg. models)
%   fun: curried function to call eventually, takes 1 arg, a struct of
%   arguments
%   flatten: optional, takes r{} and returns a new r
%   args: A starting set of arguments, can be {}
%   varyargs: {struct('field', 'FIELDNAME', 'values', {a,b,c})}
% returns a nested cell array of outputs
%
% suggest using ag_flatten_cells to get just matrices out
%
% eg.
%
% fun = @(x) your_function(with, normal, args, x)
% s1.field = 'FIELD1'; s1.values = {1 2 3};
% s2.field = 'FIELD2'; s2.values = {'a' 'b' 'c'};
% r = ag_do_vary(fun, @ag_flatten_cells, struct(), {s1 s2});
%  s1 and s2 end up providing values for x.FIELD1 and x.FIELD2.
%
if (~isempty(varyargs))
    if (size(varyargs, 2) > 1)
        newargs = {varyargs{1, 2:end}};
    else
        newargs = {};
    end
    fname = varyargs{1}.field;
    for k = 1:size(varyargs{1}.values, 2)
        args.(fname) = varyargs{1}.values{k};
        r{k} = ag_do_vary(fun, flatten, args, newargs);
    end
    if (~isempty(flatten))
        r = flatten(r');
    end
    return;
end;

% got the whole set of args sorted out
r.data = fun(args);
r.params = args;
end

