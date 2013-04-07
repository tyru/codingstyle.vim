" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Load Once {{{
if exists('g:loaded_coding_style') && g:loaded_coding_style
    finish
endif
let g:loaded_coding_style = 1
" }}}
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}


command!
\   -bar -range=% -nargs=?
\   CSUnretab
\   call codingstyle#cmd_unretab(<line1>, <line2>, <q-args>)

command!
\   -nargs=* -bar
\   CSChangeSpaceIndent
\   call codingstyle#cmd_change_space_indent(<f-args>)


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
