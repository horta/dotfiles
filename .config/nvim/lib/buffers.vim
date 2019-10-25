" Buffers
if !exists("*DeleteHiddenBuffers")
  function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
      let buftype=getbufvar(buf, '&buftype', 'ERROR')
      if buftype !=# 'terminal'
        silent execute 'Bwipeout' buf
      endif
    endfor
  endfunction
endif
