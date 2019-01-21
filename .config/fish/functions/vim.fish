function vim
  if type nvim >/dev/null ^&1
    nvim $argv
  else
    if test -e /usr/bin/vim
      /usr/bin/vim $argv
    else
      echo "Could not find vim."
    end
  end
end
