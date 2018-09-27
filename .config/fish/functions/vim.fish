function vim
  if type nvim >/dev/null ^&1
    nvim $argv
  else
    /usr/bin/vim $argv
  end
end
