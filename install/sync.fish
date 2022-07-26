#!/usr/bin/env fish

function sync 
    rsync -avh --no-perms files/.* ~
end

set FLAG $argv

if test "$FLAG" = "--force"; or test "$FLAG" = "-f"
    sync
else
    echo "This may overwrite existing files in your home directory. Are you sure? (y/n) "
    read -l -p "" REPLY
    
    sync
end

