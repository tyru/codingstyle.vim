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
\   -nargs=* -bar
\   -complete=customlist,codingstyle#cmd_complete_change_space_indent
\   CSChangeSpaceIndent
\   call codingstyle#cmd_change_space_indent(<f-args>)

command!
\   -bar -range=% -nargs=?
\   -complete=customlist,codingstyle#cmd_complete_unretab
\   CSUnretab
\   call codingstyle#cmd_unretab(<line1>, <line2>, <q-args>)


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
