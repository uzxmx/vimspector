" Boilerplate {{{
let s:save_cpo = &cpoptions
set cpoptions&vim
" }}}

function! s:Windows() abort
  return has('win32') && fnamemodify(&shell, ':t') ==? 'cmd.exe'
endfunction

function! s:pretty_command(cmd) abort
  let echo  = !s:Windows() ? 'echo -e '.shellescape(a:cmd) : 'Echo '.shellescape(a:cmd)
  let separator = !s:Windows() ? '; ' : ' & '

  return join([l:echo, a:cmd], l:separator)
endfunction

function! vimspector#internal#tmux#Send( cmd ) abort
  call Send_to_Tmux(join(a:cmd)."\n")
endfunction

" Boilerplate {{{
let &cpoptions=s:save_cpo
unlet s:save_cpo
" }}}
