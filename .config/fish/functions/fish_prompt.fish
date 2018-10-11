function fish_prompt
    set -l last_status $status
    if set -q CONDA_LEFT_PROMPT
        __conda_add_prompt
    end
    return_last_status $last_status

    # __fish_prompt_orig
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
        set branch ' ' (git rev-parse --abbrev-ref HEAD)
    else
        set branch ''
    end

    echo -n -s (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd) (set_color blue) $branch (set_color normal) "$suffix "
end
