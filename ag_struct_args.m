function r = ag_struct_args( s, defaults )
%AG_STRUCT_ARGS Fill in optional arguments
%   Given var args from some other function as (name, value) pairs
% and a structure of default values, return r as a struct of r.name = value
% taken from the varg or from defaults if not provided in varg

if (isempty(s))
    s = struct();
end
if (isempty(defaults))
    defaults = struct();
end

r = defaults;

n = fieldnames(s);
for k = 1:(size(n, 1))
    name = n{k,1};
    r.(name) = s.(name);
end

end

