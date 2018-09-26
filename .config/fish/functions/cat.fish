function cat
  if type ccat ^/dev/null
    ccat $argv
  else
    /bin/cat $argv
  end
end

