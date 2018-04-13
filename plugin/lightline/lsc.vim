augroup lightline_lsc
    au!
    au User LanguageClientDiagnosticsChanged call lightline#update()
    au User LanguageClientStarted call lightline#lsc#lspStarted()
    au User LanguageClientStopped call lightline#lsc#lspStopped()
augroup END
