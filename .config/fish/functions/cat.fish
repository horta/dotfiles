function cat
    if type bat >/dev/null ^&2
        bat $argv
    else
        /bin/cat $argv
    fi
end

