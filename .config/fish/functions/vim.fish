function vim
  if type nvim ^/dev/null
    nvim $argv
  else
    vim $argv
  end
end
