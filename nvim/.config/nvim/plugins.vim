" plugins.vim
"
" Neovim plugins and options

" Vim-plug configuration

call plug#begin()

" Linter
Plug 'w0rp/ale'

" Handy terminal.
Plug 'kassio/neoterm'

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

" Asynchronous :make, awesome checker.
" Plug 'benekastah/neomake'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" Dark powered neo-completion.
" Requires neovim-python.
" See: https://neovim.io/doc/user/nvim_python.html
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/echodoc.vim'

" Show indentation levels
Plug 'nathanaelkane/vim-indent-guides'

" Asynchronously control git repositories
Plug 'lambdalisue/gina.vim'

" Rust syntax highlighting.
Plug 'wting/rust.vim', { 'for': 'rust' }

" Purescript syntax highlighting.
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }

" Run ghcid in nvim
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': 'haskell' }
" Haskell autocompletion (works with deoplete, YCM, omni)
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Haskell syntax highlighting
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Vim Haskell search.
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Prettify Haskell code.
Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }
" Crazy Haskell concealing.
" Plug 'enomsg/vim-haskellConcealPlus'

" Support for writing LaTeX documents
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

" Not entirely sure how I feel about this one.
" Highlighting is better than haskell-vim, but lots of bad defaults that
" cannot be configured. Lint is less clear than ghc-mod.
" Plug 'dag/vim2hs', { 'for': 'haskell' }

call plug#end()

"" Plugin options

" Use deoplete
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

" Neomake after each write.
" autocmd! BufWritePost * Neomake

" Open fix list when found.
let g:neomake_open_list = 2

" NERD Tree on launch
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if last window is a NERD Tree window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

source ~/.config/nvim/hasktags.vim

" ALE Haskell linters
"
" Default linters include 'stack-ghc' and 'ghc-mod' on top of those below.
" ALE isn't capable of seeing project-defined names, leading to annoying
" error messages.
" This is a very heavy way of shitting them up.
" TODO: investigate a lighter way to accomplish this, without turning the
"       linter off entirely.

let g:ale_linters ={
      \   'haskell': ['hlint', 'hdevtools', 'hfmt'],
      \}

" Haskell-vim indentation
let g:haskell_indent_where = 2

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

let g:neoterm_size = 10
