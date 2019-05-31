function hpip
    set old_dir (pwd)
    set dir (mktemp -d)
    and cd $dir
    and pip download $argv[1] --no-binary :all: --no-deps >/dev/null
    set file (ls)
    and pip hash $file
    rm $file
    rmdir $dir
    cd $old_dir
end

