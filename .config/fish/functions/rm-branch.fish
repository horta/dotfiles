function rm-branch
    git push origin ":refs/heads/$argv[1]"
    if git show-ref "refs/heads/$argv[1]" >/dev/null
        git branch -d "$argv[1]"
    end
end

