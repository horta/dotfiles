function rm-tag
    git push origin :refs/tags/$argv[1]
    git tag --delete $argv[1]
end

