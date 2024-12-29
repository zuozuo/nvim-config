" vim:sw=2:
" ============================================================================
" FileName: kittytabs.vim
" Author: Zorro <zzhattzzh@gmail.com>
" GitHub: https://github.com/zuozuo
" Blog: https://zuozuo.github.io
" ============================================================================

function! floaterm#wrapper#kittytabs#(cmd, jobopts, config) abort
  let s:kittytabs_tmpfile = tempname()
  let cmd = a:cmd
  let s:exit_all = get(a:config, 'exit_all', 1)

  if cmd !~ '--preview'
    if executable('bat')
      let cmd .= ' --preview ' . shellescape('bat --style=numbers --color=always {}')
    else
      let cmd .= ' --preview ' . shellescape('cat -n {}')
    endif
  endif
  let cmd .= ' > ' . s:kittytabs_tmpfile
  let cmd = [&shell, &shellcmdflag, cmd]
  let jobopts = {'on_exit': funcref('s:kittytabs_callback')}
  call floaterm#util#deep_extend(a:jobopts, jobopts)
  return [v:false, cmd]
endfunction

function! s:kittytabs_callback(job, data, event, opener) abort
  if filereadable(s:kittytabs_tmpfile)
    let filenames = readfile(s:kittytabs_tmpfile)
    if !empty(filenames)
      if has('nvim')
        call floaterm#window#hide(bufnr('%'))
      endif
      let locations = []
      for filename in filenames
        let dict = {'filename': fnamemodify(filename, ':p')}
        call add(locations, dict)
      endfor
      call floaterm#util#open(locations, a:opener)
      
      if s:exit_all
        echom "退出所有窗口..."
        echom "退出所有窗口..."
        echom "退出所有窗口..."
        call timer_start(100, {-> execute('qa!')})
      endif
    endif
  endif
endfunction
