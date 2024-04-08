vim9script
#
# Title: Apollo Terminal Assistant
# Descr: 
# Date : 2024-04-08
# Ver  : 1.0

import autoload "apollo.vim"

command! -nargs=0 -range ATADocument :call apollo.ATADocument()
vnoremap <silent> ;ad :ATADocument<CR>
