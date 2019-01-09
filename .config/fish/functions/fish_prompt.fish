function fish_prompt
    set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end
    if test -d .git
        set branch ' ' (git rev-parse --abbrev-ref HEAD ^ /dev/null)
    else
        set branch ''
    end

    set -l prefix
    if [ (prompt_hostname) = "horta-ml" ]
        set prefix ""
    else
        set prefix (prompt_hostname)
    end

    echo -n -s $prefix ' ' (set_color $color_cwd) (prompt_pwd) (set_color blue) $branch (set_color normal) "$suffix "
end
