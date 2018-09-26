function v
    set src "from setuptools import find_packages; print(find_packages()[0])"
    set pkg_name (python -c "$src")
    set re1 "__version__ *= *['\"]\(.*\)['\"]"
    set re2 "\d+(\.\d+)*"
    set version (grep "$re1" $pkg_name/__init__.py | grep -Eo "$re2")

    set opt (echo "$argv[1]" | string trim)
    if [ $opt = "--bump" ]
        set numbers (string split . "$version")
        set numbers[-1] (math $numbers[-1] + 1)
        set new_version (string join . $numbers)
        echo "$version --> $new_version"
        sed -i ".bak" "s/$version/$new_version/g" $pkg_name/__init__.py
        if [ $status = 0 ]
            rm $pkg_name/__init__.py.bak
        end
        return
    end
    echo $version
end

