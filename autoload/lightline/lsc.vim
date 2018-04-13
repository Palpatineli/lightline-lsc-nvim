let s:indicator_notstarted = get(g:, 'lightline#lsc#indicator_notstarted', 'Starting...')
let s:indicator_errors = get(g:, 'lightline#lsc#indicator_errors', 'E:')
let s:indicator_ok = get(g:, 'lightline#lsc#indicator_ok', 'OK')
let s:indicator_checking = get(g:, 'lightline#lsc#indicator_checking', 'Linting...')


let g:language_client_started = 0

function! lightline#lsc#lspStarted() abort
    let g:language_client_started = 1
    call lightline#update()
endfunction

function! lightline#lsc#lspStopped() abort
    let g:language_client_started = 0
    call lightline#update()
endfunction


function! lightline#lsc#notStarted() abort
  return (g:language_client_started == 0) ? s:indicator_notstarted : ''
endfunction

function! lightline#lsc#errors() abort
    if (LanguageClient_serverStatus() == 1)
        return ''
    endif
    let l:error_no = len(getqflist())
    return l:error_no == 0 ? '' : printf(s:indicator_errors . " %d", error_no)
endfunction

function! lightline#lsc#ok() abort
    if (LanguageClient_serverStatus() == 1) || (g:language_client_started == 0)
        return ''
    endif
    let l:error_no = len(getqflist())
    return l:error_no == 0 ? s:indicator_ok : ''
endfunction
