function rm-tag
    git push origin :$argv[1]
    git tag --delete $argv[1]
end

