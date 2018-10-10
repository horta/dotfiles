function t2

    set IMAGE dhorta/ubuntu
    set dirty (git status --porcelain)

    set PRJ_NAME (basename (pwd))
    set PKG_NAME (cat setup.cfg | grep "^name" | sed 's/^name *= *//' | tr "-" "_")

    if test -n "$dirty"
        echo "Working directory is not clean. Please, commit your changes."
    else 
        docker run -it -v (pwd):/home/horta/host/(basename (pwd)) $IMAGE bash -l -c "echo \$SHELL && /home/horta/t2.sh $PRJ_NAME $PKG_NAME"
    end
end

