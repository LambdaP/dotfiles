"
" after/plugin/startify.nvim
"
" https://github.com/mhinz/vim-startify
"
"
" ## example from `:help startify-example` ---{{{
"
" " EXAMPLE                                                       *startify-example*
"     autocmd User Startified setlocal cursorline

"     let g:startify_enable_special      = 0
"     let g:startify_files_number        = 8
"     let g:startify_relative_path       = 1
"     let g:startify_change_to_dir       = 1
"     let g:startify_update_oldfiles     = 1
"     let g:startify_session_autoload    = 1
"     let g:startify_session_persistence = 1

"     let g:startify_skiplist = [
"             \ 'COMMIT_EDITMSG',
"             \ 'bundle/.*/doc',
"             \ '/data/repo/neovim/runtime/doc',
"             \ '/Users/mhi/local/vim/share/vim/vim74/doc',
"             \ ]

"     let g:startify_bookmarks = [
"             \ { 'c': '~/.vim/vimrc' },
"             \ '~/golfing',
"             \ ]

"     let g:startify_custom_header =
"             \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')

"     let g:startify_custom_footer =
"            \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

"     hi StartifyBracket ctermfg=240
"     hi StartifyFile    ctermfg=147
"     hi StartifyFooter  ctermfg=240
"     hi StartifyHeader  ctermfg=114
"     hi StartifyNumber  ctermfg=215
"     hi StartifyPath    ctermfg=245
"     hi StartifySlash   ctermfg=240
"     hi StartifySpecial ctermfg=240
"
"     }}}

autocmd User Startified setlocal cursorline

let g:startify_fortune_use_unicode = 1

const s:plugins = globpath(stdpath("config"), "lua/p/plugins.lua")

let g:startify_bookmarks = [
      \ { 'c': '$MYVIMRC' },
      \ { 'p': s:plugins },
      \ ]

let g:startify_files_number   = 5
let g:startify_change_to_dir  = 1
let g:startify_change_cmd     = 'tcd'
