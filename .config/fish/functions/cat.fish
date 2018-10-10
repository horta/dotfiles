function cat
  if type ccat >/dev/null 2>&1
    ccat $argv
  else
    /bin/cat $argv
  end
end

