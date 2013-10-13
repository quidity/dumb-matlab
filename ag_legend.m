function [ l ] = ag_legend( l )
%AG_NO_LEGEND Turns off legend entry for a thing
%   set(get(get(l,'Annotation'),'LegendInformation'), 'IconDisplayStyle',
%   'off')
for k = 1:length(l)
    set(get(get(l(k),'Annotation'),'LegendInformation'), 'IconDisplayStyle', 'on')
end

end

