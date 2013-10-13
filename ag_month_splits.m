function splits = ag_month_splits(time0, time1)
%AG_MONTH_SPLITS splits = ag_month_splits(time0, time1)
% produces a vector of all month starts from time0 to time1
% adds starts to include both time0 and time1

V1 = datevec(time0);
Y1 = V1(1);
V2 = datevec(time1);
if (V2(2) == 12)
    V2(1) = V2(1) + 1;
    V2(2) = 1;
end
Y2 = V2(1);

pos = 0;
for y = Y1:Y2
    for m = 1:12
        if (y==Y1 && m < V1(2))
            continue;
        end
        if (y==Y2 && m > V2(2)+1)
            continue;
        end
        pos = pos+1;
        splits(pos, 1) = datenum(y, m, 1);
    end
end



end
