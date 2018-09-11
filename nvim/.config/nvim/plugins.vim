" plugins.vim
"
" Neovim plugins and options

"" Vim-plug

call plug#begin()

" My favorite colorscheme.
Plug 'altercation/vim-colors-solarized'

" Thank you for flying neovim.
Plug 'bling/vim-airline'

" Filesystem explorer.
Plug 'scrooloose/nerdtree'
" NERDtree git integration.
Plug 'Xuyuanp/nerdtree-git-plugin'

" Show local tags.
Plug 'majutsushi/tagbar'

" Linter
Plug 'w0rp/ale'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" Dark powered neo-completion.
" Requires neovim-python.
" See: https://neovim.io/doc/user/nvim_python.html
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/echodoc.vim'

" Show indentation levels
Plug 'nathanaelkane/vim-indent-guides'

" Asynchronously control git repositories
Plug 'lambdalisue/gina.vim'

" Rust syntax highlighting.
Plug 'wting/rust.vim', { 'for': 'rust' }

" Purescript syntax highlighting.
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }

""" Haskell

" Ghcid
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': 'haskell'}
" Interactive development
"   TODO: look into keeping this
" Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
" Hoogle
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Haskell autocompletion (works with deoplete, YCM, omni), requires ghc-mod
"   as of 2018-08-31, ghc-mod is not compatible with the last two releases of
"   GHC, so using this is awkward.
" Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

""" Latex
"
Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
Plug 'rhysd/vim-grammarous', { 'for': ['tex', 'latex'] }
Plug 'dbmrq/vim-ditto', { 'for': ['tex', 'latex'] }
Plug 'reedes/vim-wordy', { 'for': ['tex', 'latex'] }


" TODO: look into those.
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'mhinz/neovim-remote'
" Plug 'euclio/vim-markdown-composer'
" Plug 'airblade/vim-gitgutter'

call plug#end()

"" Plugin options

""" Deoplete

" Enable
let g:deoplete#enable_at_startup = 1

" Start completing after two char
let g:deoplete#auto_completion_start_length = 2

" Have types in neco-ghc -- this slows up things a bit. Use 0 for faster.
let g:necoghc_enable_detailed_browse = 1

" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
"
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#mappings#close_popup() . "\<CR>"
" endfunction

"""

let g:ghcid_command = 'stack exec -- ghcid -c "stack ghci"'

""" NERD Tree

" NERD Tree on launch
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if last window is a NERD Tree window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let $HASKTAGS_VIM=expand("~/.config/nvim/hasktags.vim")
if filereadable($HASKTAGS_VIM)
    source $HASKTAGS_VIM
endif

""" ALE

" Note on using ALE and Stack:
" ALE checks that binaries are valid before running them.
" Because of this, we cannot simply do e.g.
"   let g:ale_haskell_hfmt_executable = 'stack exec -- hfmt'.
"
" A possible solution to make ALE use stack exec is to pass 'stack' to the
" executable path and 'exec -- linter' as an option, but e.g., there isn't a
" variable for passing options to hfmt.
"
" Until there is a workaround in ALE itself, the linters and fixers to be used
" with ALE need to be instlled with stack install.

let g:ale_fix_on_save = 1

let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'haskell': ['hfmt'],
  \}

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0

let g:ale_linters = {
  \   'haskell': ['hlint', 'hdevtools', 'stack-build'],
  \   'latex':   ['vale'],
  \}

" Automatically open loclist
" let g:ale_open_list = 1

" Auto-close loclist when leaving buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" Haskell-vim indentation
" let g:haskell_indent_where = 2

" Let vim-airline convey ALE info
let g:airline#extensions#ale#enabled = 1

" Auto-use indent guides
let g:indent_guides_enable_on_vim_startup = 1

" Use Skim to work with VimTeX
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction

" terminal sanity

tnoremap <Esc> <C-\><C-n>

" augroup interoMaps
"   au!
"   " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.
"
"   " Background process and window management
"   au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
"   au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>
"
"   " Open intero/GHCi split horizontally
"   au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
"   " Open intero/GHCi split vertically
"   au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
"   au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>
"
"   " Reloading (pick one)
"   " Automatically reload on save
"   au BufWritePost *.hs InteroReload
"
"   " Load individual modules
"   au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
"   au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>
"
"   " Type-related information
"   " Heads up! These next two differ from the rest.
"   au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
"   au FileType haskell map <silent> <leader>T <Plug>InteroType
"   au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>
"
"   " Navigation
"   au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
"
"   " Managing targets
"   " Prompts you to enter targets (no silent):
"   au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
" augroup END
"
" Enable type information on hover (when holding cursor at point for ~1 second).
" let g:intero_type_on_hover = 1
"
" " Change the intero window size; default is 10.
" let g:intero_window_size = 15
"
" OPTIONAL: Make the update time shorter, so the type info will trigger faster.
" set updatetime=1000






" Required for operations modifying multiple buffers like rename.
set hidden

"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
