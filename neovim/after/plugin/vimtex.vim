let g:vimtex_compiler_progname = 'nvr'
" let g:vimtex_compiler_method   = 'arara'

let g:vimtex_grammar_textidote = {
  \ 'jar':  '/opt/textidote/textidote.jar',
  \ 'args': '',
  \ }

" Use Skim to work with VimTeX
" this seems to be replaceable with g:vimtex_view_method = 'skim'
" let g:vimtex_view_general_viewer
"      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'

" NOTE: if used with Skim, the following should be set in Skim:
"           Preferences -> Sync -> Command   = "nvr"
"           Preferences -> Sync -> Arguments = "--remote-silent %f -c %l"
"       (quotes omitted in Skim)
let g:vimtex_view_method         = 'skim'
let g:vimtex_view_automatic      = 1
" let g:vimtex_view_use_temp_files = 1

let g:vimtex_indent_enabled     = 1
let g:vimtex_indent_bib_enabled = 1

augroup vimtex_indent
  au!
  " TODO: tweak
  autocmd Filetype tex setlocal indentkeys=!^F,o,O
augroup END

let g:vimtex_complete_bib = {'enabled':0}
let g:vimtex_complete_bib = {'simple': 1}
let g:vimtex_complete_bib = {'simple': 1, 'menu_fmt': "'@author_short. “@title”. (@year).'"}

" The quickfix window is opened automatically when there are errors,
" but it does not become the active window.
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 3
" let g:vimtex_quickfix_open_on_warning = 0
"
" let g:vimtex_delim_insert_timeout = 20 " default 60
" alternatively: https://github.com/andymass/vim-matchup
"   (advised by vimtex)
