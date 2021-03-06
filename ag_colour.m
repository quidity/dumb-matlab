function c = ag_colour(num)
%AG_COLOUR A number of good colours to use for a graph, will wrap num
% for you if you exceed the number of allowed colours.

persistent colororder;

if(isempty(colororder))
    colororder = [ ...
        0.00  0.00  1.00; ...
        0.00  0.50  0.00;...
        1.00  0.00  0.00;...
        0.00  0.75  0.75;...
        0.75  0.00  0.75;...
        0.75  0.75  0.00;...
        0.25  0.25  0.25;...
        0.75  0.25  0.25;...
        0.95  0.95  0.00;...
        0.25  0.25  0.75;...
        0.75  0.75  0.75;...
        0.00  1.00  0.00;...
        0.76  0.57  0.17;...
        0.54  0.63  0.22;...
        0.34  0.57  0.92;...
        1.00  0.10  0.60;...
        0.88  0.75  0.73;...
        0.10  0.49  0.47;...
        0.66  0.34  0.65;...
        0.99  0.41  0.23;...
    ];
end

c = colororder(mod(num-1, size(colororder,1))+1, :);
end
