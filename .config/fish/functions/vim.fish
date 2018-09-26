function vim
  if type nvim ^/dev/null
    nvim $argv
  else
    /usr/bin/vim $argv
  end
end
