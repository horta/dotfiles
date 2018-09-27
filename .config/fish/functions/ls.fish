function ls
  if type exa >/dev/null 2>&1
    exa $argv
  else
    /bin/ls $argv
  end
end

