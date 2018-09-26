function epip
  pip search $argv | grep -e "^$argv "
end

