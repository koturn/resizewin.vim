"=============================================================================
" FILE: resizewin.vim
" AUTHOR: koturn <jeak.koutan.apple@gmail.com>
" Last Modified: 17 July 2013.
" DESCRIPTION: {{{
" This plugin enables resizing window without mouse and provides the command
" for maximize window.
" You can use this CUI and GUI.
" }}}
"=============================================================================
let s:save_cpo = &cpo
set cpo&vim


function! resizewin#resizewin()
  let l:d1  = 1
  let l:d2  = 3
  let l:h   = &lines
  let l:w   = &columns
  let l:key = 'k'
  let l:title = &titlestring

  while stridx('hjklHJKL', l:key) >= 0
    let &titlestring = 'Window size: (' . &columns . ', ' . &lines . ')'
    if &lazyredraw
      redraw
    endif

    let l:key = nr2char(getchar())
    if l:key ==? 'h' && l:w >= 20
      let l:w = l:w - l:d1
      if l:key ==# 'H'
        let l:w = l:w - l:d2
      endif
    endif
    if l:key ==? 'j'
      let l:h = l:h + l:d1
      if l:key ==# 'J'
        let l:h = l:h + l:d2
      endif
    endif
    if l:key ==? 'k' && l:h >= 5
      let l:h = l:h - l:d1
      if l:key ==# 'K'
        let l:h = l:h - l:d2
      endif
    endif
    if l:key ==? 'l'
      let l:w = l:w + l:d1
      if l:key ==# 'L'
        let l:w = l:w + l:d2
      endif
    endif
    let &lines   = l:h
    let &columns = l:w
  endwhile

  let &titlestring = l:title
endfunction


function! resizewin#resizewin_x(dist)
  let &columns += a:dist
endfunction

function! resizewin#resizewin_y(dist)
  let &lines += a:dist
endfunction


if (has('win95') || has('win16') || has('win32') || has('win64'))
      \ && has('gui_running')
  if !exists('s:is_fullsize')
    let s:is_fullsize = 0
  endif
  function! resizewin#fullsize()
    if s:is_fullsize
      simalt ~r
      let s:is_fullsize = 0
    else
      simalt ~x
      let s:is_fullsize = 1
    endif
  endfunction
  return
else
  if !exists('s:is_fullsize')
    let s:is_fullsize = 0
    let s:lines       = 0
    let s:columns     = 0
    let s:winpos_cmd  = ''
  endif

  augroup ResizeWin
    autocmd!
    au ResizeWin VimLeave *
          \   if s:is_fullsize && s:winpos_cmd !=# ''
          \ |   exec s:winpos_cmd
          \ | endif
  augroup END

  function! resizewin#fullsize()
    if s:is_fullsize
      exec s:winpos_cmd
      let &lines   = s:lines
      let &columns = s:columns
      let s:is_fullsize = 0
    else
      let s:lines      = &lines
      let s:columns    = &columns
      let s:winpos_cmd = s:get_winpos_cmd()
      winpos   -8  -8
      winsize 999 999
      let s:is_fullsize = 1
    endif
  endfunction

  function! s:get_winpos_cmd()
    let l:wstr = ''
    try
      redir => l:wstr
        silent winpos
      redir END
      let l:wstr = substitute(l:wstr, '[\r\n]', '', 'g')
      let l:wstrlst = split(split(l:wstr, ':')[1][3 :], ',')
      return 'winpos' . l:wstrlst[0] . l:wstrlst[1][2 :]
    catch
      redir END
      return ''
    endtry
  endfunction
endif


let &cpo = s:save_cpo
unlet s:save_cpo
