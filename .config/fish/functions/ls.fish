function ls
  if type exa ^/dev/null
    exa $argv
  else
    /bin/ls $argv
  end
end

