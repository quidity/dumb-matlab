function ndir = ag_dir(project, rest)
%AG_DIR directory = ag_dir(project, rest)
% looks up the root on this machine for 'project's data and concats to a
% directory (see ag_env)

rdir = ag_env(project);

if (strcmp(rdir, ''))
    ndir = rest;
else
    ndir = strcat(rdir, '/', rest);
end

end