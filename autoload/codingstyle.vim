" vim:foldmethod=marker:fen:sw=4:sts=4
scriptencoding utf-8

" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}



function! s:warn(msg) "{{{
    echohl WarningMsg
    try
        echomsg a:msg
    finally
        echohl None
    endtry
endfunction "}}}



let s:CHANGE_SPACE_INDENT_USAGE = ':ChangeSpaceIndent {before sp num} [{after sp num}]'
function! codingstyle#cmd_change_space_indent(...) "{{{
    if a:0 is 0
        echo s:CHANGE_SPACE_INDENT_USAGE
        return
    endif

    let before = get(a:000, 0, '')
    if before ==# ''
        echo s:CHANGE_SPACE_INDENT_USAGE
        return
    elseif before !~# '^\d\+$'
        echoerr 'argument must be a number: '.before
        return
    endif

    let after = get(a:000, 1, '')
    if after ==# ''
        let after = &tabstop
    elseif a:1 !~# '^\d\+$'
        echoerr 'argument must be a number: '.after
        return
    endif

    call s:do_change_space_indent(before, after)
endfunction "}}}

function! s:do_change_space_indent(before, after) "{{{
    execute
    \   '%s:^ \+:\=repeat(" ", strlen(submatch(0)) / '
    \   . a:before . ' * ' . a:after
    \   . '):'
endfunction "}}}



function! codingstyle#cmd_unretab(begin, end, tabstop) "{{{
    if type(a:tabstop) isnot type(0)
        call s:warn('CSUnretab: invalid tabstop was given.')
        return
    endif

    let pattern = '^\(\%( \{' . a:tabstop . '}\)\+\)\( *\)'
    let replacement = '\=repeat("\t", strlen(submatch(1)) / ' . a:tabstop . ') . submatch(2)'
    execute
    \   a:begin . ',' . a:end
    \   's:' . pattern . ':' . replacement . ':'
endfunction "}}}



" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
