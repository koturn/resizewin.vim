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
if exists('g:loaded_resizewin')
  finish
endif
let g:loaded_resizewin = 1
let s:save_cpo = &cpo
set cpo&vim


let g:resizewin#resize_width  = get(g:, 'resizewin#resize_width', 1)
let g:resizewin#resize_height = get(g:, 'resizewin#resize_height', 1)

command! ResizeWin    call resizewin#resizewin()
command! ResizeWinCX  call resizewin#resizewin_x(-g:resizewin#resize_width)
command! ResizeWinEY  call resizewin#resizewin_y( g:resizewin#resize_height)
command! ResizeWinCY  call resizewin#resizewin_y(-g:resizewin#resize_height)
command! ResizeWinEX  call resizewin#resizewin_x( g:resizewin#resize_width)
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
