function rdir = ag_env( project, root_dir )
%AG_ENV a matlab internal environment
% see also: ag_dir

persistent AG_ROOT_DIRS;
persistent AG_DIR_KEYS;
mlock;

if (isempty(AG_ROOT_DIRS))
    AG_ROOT_DIRS = {};
    AG_DIR_KEYS = {};
end

pos = match_key(project, AG_DIR_KEYS);

% replace or insert
if (nargin > 1)
    if (pos > 0)
        AG_ROOT_DIRS{pos} = root_dir;
    else
        AG_ROOT_DIRS{-pos} = root_dir;
        AG_DIR_KEYS{-pos} = project;
    end
    rdir = root_dir;
    return;
end

%return a match
if (pos > 0)
    rdir = AG_ROOT_DIRS{pos};
else
    rdir = '';
end

end

function pos = match_key(project, keylist)
    for k = 1:size(keylist, 2)
        if (strcmp(keylist{k}, project))
            pos = k;
            return;
        end
    end
    pos = -(size(keylist, 2)+1);
end