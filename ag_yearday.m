function mdate = ag_yearday( year, yearday, hh, mm, ss )
%AG_YEARDAY mdate = ag_yearday( year, yearday, hh, mm, ss )
% Creates a matlab datenum from a day of year value

mdate = datenum(year, 1, 1);
mdate = mdate + yearday - 1;
if (nargin > 2)
   mdate = mdate + hh/24;
   if (nargin > 3)
       mdate = mdate + mm/(24*60);
       if (nargin > 4)
           mdate = mdate + ss/(24*60*60);
       end
   end
end


end

