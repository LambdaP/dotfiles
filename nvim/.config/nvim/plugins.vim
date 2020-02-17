" plugins.vim
"
" Neovim plugins and options

"" Vim-plug

call plug#begin()

" Start screen
Plug 'mhinz/vim-startify'

" Easily work with brackets etc.
Plug 'tpope/vim-surround'

" Toggle comments
Plug 'tpope/vim-commentary'

" My favorite colorscheme.
Plug 'altercation/vim-colors-solarized'

" Thank you for flying neovim.
Plug 'bling/vim-airline'

" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" Filesystem explorer.
Plug 'scrooloose/nerdtree'
" NERDtree git integration.
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Show local tags.
Plug 'majutsushi/tagbar'

" Linter
Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

Plug 'mbbill/undotree'

" Dark powered neo-completion.
" Requires neovim-python.
" See: https://neovim.io/doc/user/nvim_python.html
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neco-syntax'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf'

Plug 'Shougo/echodoc.vim'

" Show indentation levels
Plug 'nathanaelkane/vim-indent-guides'

" Asynchronously control git repositories
Plug 'lambdalisue/gina.vim'

" Rust syntax highlighting.
Plug 'wting/rust.vim', { 'for': 'rust' }

" Purescript syntax highlighting.
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }

Plug 'jceb/vim-orgmode'

Plug 'jiangmiao/auto-pairs'

""" Haskell

" Ghcid
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': 'haskell'}
" Interactive development
"   TODO: look into keeping this
" Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
" Hoogle
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim'

""" Latex
"
Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
Plug 'rhysd/vim-grammarous', { 'for': ['tex', 'latex'] }
Plug 'dbmrq/vim-ditto', { 'for': ['tex', 'latex'] }
Plug 'reedes/vim-wordy', { 'for': ['tex', 'latex'] }

""" Python

Plug 'zchee/deoplete-jedi', { 'for': 'python' }

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
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

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
  \   'haskell': ['hfmt', 'brittany'],
  \   'rust':    ['rustfmt'],
  \   'python':  ['yapf'],
  \}

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0

let g:ale_linters = {
  \   'haskell': ['hlint', 'hdevtools', 'stack-build'],
  \   'latex':   ['vale'],
  \   'rust':    ['rustc'],
  \   'python':  ['pylint'],
  \}

" Automatically open loclist
" let g:ale_open_list = 1

" Auto-close loclist when leaving buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" Let vim-airline convey ALE info
let g:airline#extensions#ale#enabled = 1

" Auto-use indent guides
let g:indent_guides_enable_on_vim_startup = 1

" TeX options
"
let g:tex_flavor = 'latex' " Do not mistake .tex files for plain TeX

" VimTeX options

" NOTE: from :h vimtex-faq-neovim:
" Q: Does vimtex work with neovim?
" A: Yes. Since 2018-11-18 [0], most features work out of the box. However, for
"    backward search from PDF viewer to neovim, one needs the neovim-remote
"    tool as described below.
"
"    Deprecated: The compiler coupling and some of the viewer functionality
"    require the --remote options from the clientserver. For some reason,
"    these options have been removed from neovim, see #1750 [1]. There does
"    remain some hope that the options will be reimplemented sometime in the
"    future.
"
"    In the meantime, there exists a workaround: neovim-remote [2] is a simple
"    tool that implements the --remote options through a python script. If one
"    downloads this tool and sets the option g:vimtex_compiler_progname to
"    nvr (or the full path, if nvr is not in $PATH), then everything
"    should work.
"
"    [0]: https://github.com/lervag/vimtex/issues/1258
"    [1]: https://github.com/neovim/neovim/issues/1750
"    [2]: https://github.com/lervag/vimtex/issues/262
"
" NOTE: if used with Skim, the following should be set in Skim:
"       Preferences -> Sync -> Command = "nvr"
"       Preferences -> Sync -> Arguments = "--remote-silent %f -c %l"
"       (quotes omitted in Skim)
let g:vimtex_compiler_progname = 'nvr'

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

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = {
    \ 'rust':     ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'haskell':  ['ghcide', '--lsp'],
    \ 'python':   ['/usr/local/bin/pyls']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:netrw_keepdir= 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_options = 'i'

let g:tex_flavor = 'latex'

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
