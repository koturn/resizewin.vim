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


command! ResizeWin    call resizewin#resizewin()
command! ResizeWinCX  call resizewin#resizewin_x(-20)
command! ResizeWinEY  call resizewin#resizewin_y(20)
command! ResizeWinCY  call resizewin#resizewin_y(-20)
command! ResizeWinEX  call resizewin#resizewin_x(20)
command! FullSize     call resizewin#fullsize()
noremap  <silent> <Plug>(resizewin-contract-x)  :<C-u>ResizeWinCX<CR>
noremap! <silent> <Plug>(resizewin-contract-x)  <Esc>:ResizeWinCX<CR>
noremap  <silent> <Plug>(resizewin-expand-y)    :<C-u>ResizeWinEY<CR>
noremap! <silent> <Plug>(resizewin-expand-y)    <Esc>:ResizeWinEY<CR>
noremap  <silent> <Plug>(resizewin-contract-y)  :<C-u>ResizeWinCY<CR>
noremap! <silent> <Plug>(resizewin-contract-y)  <Esc>:ResizeWinCY<CR>
noremap  <silent> <Plug>(resizewin-expand-x)    :<C-u>ResizeWinEX<CR>
noremap! <silent> <Plug>(resizewin-expand-x)    <Esc>:ResizeWinEX<CR>
noremap  <silent> <Plug>(resizewin-full)        :<C-u>FullSize<CR>
noremap! <silent> <Plug>(resizewin-full)        <Esc>:FullSize<CR>


let &cpo = s:save_cpo
unlet s:save_cpo
