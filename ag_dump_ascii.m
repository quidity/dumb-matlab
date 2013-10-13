function ascii = ag_dump_ascii(A)
%AG_DUMP_ASCII Dump matrix as ascii representation

strs = dump_deltas(calc_deltas(A));
for k = 1:size(strs, 1)
    disp(char(strs(k,:)));
end

end
%% useful debugging
function strs = dump_deltas(deltas)
    strs = [];
    for k = 1:size(deltas,1)
        str = '';
        for m =1:size(deltas,2)
            if (deltas(k,m) > 0.0)
                str = [str, '+'];
            elseif (deltas(k,m)==0.0)
                str = [str, 'o'];
            elseif (deltas(k,m) < 0.0)
                str = [str, '-'];
            elseif (isnan(deltas(k,m))) % NaN
                str = [str, ' '];
            else
                str = [str, '8']; % Inf
            end
        end
        strs(k, :) = str;
    end
end

function deltas = calc_deltas(input)
    for k = 1:size(input, 1)
        data = input(k,1:end);
        data = data(isfinite(data(:)));
        if (~isempty(data))
            deltas(k,:) = input(k, 1:end) - mean(data);
        end
    end
end
