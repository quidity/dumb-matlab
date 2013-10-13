function r = ag_opt_args( varg, defaults )
%AG_OPT_ARGS Fill in optional arguments
%   Given var args from some other function as (name, value) pairs
% and a structure of default values, return r as a struct of r.name = value
% taken from the varg or from defaults if not provided in varg

r = defaults;

nv = size(varg);

if (mod(nv, 2) ~= 0)
    error('Odd number of values in name:value list, ABORTING');
end;

for k = 1:(size(varg)/2)
    name = varg(k*2-1, 1);
    value = varg(k*2, 1);
    r.(name) = value;
end

end

