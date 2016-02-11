" vim-plug ------------------------------------------------------------ {{{

call plug#begin()

" My favorite colorscheme.
Plug 'altercation/vim-colors-solarized'

" Magical syntax checker.
Plug 'scrooloose/syntastic'

" Interactive command execution.
Plug 'Shougo/vimproc.vim'

" " I have strong feelings about my editor.
" Plug 'Valloric/YouCompleteMe'

" Filesystem explorer.
Plug 'scrooloose/nerdtree'

" NERDtree git integration.
Plug 'Xuyuanp/nerdtree-git-plugin'

" Rust syntax highlighting.
" Plug 'wting/rust.vim', { 'for': 'rust' }

" Haskell lints, checks, and fancy things.
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Haskell autocompletion (works with deoplete, YCM, omni)
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Haskell syntax highlighting
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Vim Haskell search.
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Crazy Haskell concealing.
" Plug 'enomsg/vim-haskellConcealPlus'

" Not entirely sure how I feel about this one.
" Vim Haskell utilities.
" Plug 'dag/vim2hs', { 'for': 'haskell' }

call plug#end()

" }}}

" Vim. Live it. ------------------------------------------------------- {{{

"noremap <up> <nop>
"noremap <down> <nop>
"noremap <left> <nop>
"noremap <right> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"inoremap <up> <nop>

" " }}}

" Fish compatible ----------------------------------------------------- {{{

set shell=/bin/sh

" " }}}

" Basic options ------------------------------------------------------- {{{

set nocompatible    " Vim for the 1990s
set t_Co=256        " My terminal's got all those colors, yo

set title           " Change the terminal title
set encoding=utf-8  " Show utf-8 chars
set showcmd         " count highlighted
set ruler           " Show where I am in the command area
set colorcolumn=75 " vertical ruler at 75 characters
set showmode        " -- INSERT (appreciation)-- :)
set laststatus=2    " always show the status line
                    " ↪ (0 = never, 1 = default [multi-window only])

set noml            " Don't read first/last lines of file for settings
set hidden          " Stash unwritten files in buffer
set vb              " Don't beep at me
set cursorline      " Highlight current line
set scrolloff=3     " Start scrolling when I'm 3 lines from top/bottom
set history=10000   " Remember commands and search history
set backspace=2     " Backspace over indent, eol, and insert
set mousehide       " Hide the mouse pointer while typing

set number          " Show linenumbers
set nowrap          " Turn off linewrap

set expandtab       " Expand tabs to spaces

" TODO: make this syntax-dependent.
" hs   -> 2
" C    -> 8?
" rest -> 4
set tabstop=8       " 8 spaces
set shiftwidth=8    " 8 spaces
set softtabstop=8   " 8 spaces

set hlsearch        " highlight my search
set incsearch       " incremental search
set wrapscan        " Set the search scan to wrap around the file
set ignorecase      " when searching
set smartcase       " …unless I use an uppercase character

set showmatch       " show matching brackets
set mat=2

syntax on           " Syntax highlighting
syntax sync minlines=256 " Makes big files slow
set synmaxcol=2048  " Also long lines are slow

set autoindent      " Indent
set smartindent     " Do your best

filetype plugin indent on

set fileformats=unix,dos,mac

set undodir^=~/.config/nvim/undo/ " Places .un~ files in the correct directory
set undofile
set undolevels=10000  " max number of changes that can be undone
set undoreload=100000 " max number lines to save for undo
                      " on buffer reload

" https://github.com/adobe-fonts/source-code-pro
set guifont=Source\ Code\ Pro\ 14

" Yell for long lines
au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>75v.\+', -1)

" }}}

" Plugin options ------------------------------------------------------ {{{

" Don't yell for redundant Haskell code
let g:ghcmod_hlint_options = ['--ignore=Redundant $']

" Auto-check with ghc-mod
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" NERD Tree on launch
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if last window is a NERD Tree window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic checkers options
let g:syntastic_c_checkers                      = ['make'] " Use syntastic for C files
let g:syntastic_always_populate_loc_list        = 1
let g:syntastic_auto_loc_list                   = 1
let g:syntastic_check_on_open                   = 1
let g:syntastic_check_on_wq                     = 0

" YouCompleteMe options
let g:ycm_semantic_triggers = {'haskell' : ['.']} " use neco-ghc

" }}}

" Colorscheme ----------------------------------------------------------{{{

colorscheme solarized

set background=dark

" Solarized options
let g:solarized_visibility      = "high"
let g:solarized_contrast        = "high"
let g:solarized_termcolors      = 16 " 16 if Solarized is the colorscheme
                                     " of iTerm2, 256 otherwise

" }}}

" Dumb osx ------------------------------------------------------------ {{{

let s:uname = system("uname")
if s:uname == "Darwin\n"
  set clipboard=unnamed
endif

" }}}

" Convenient Mapping--------------------------------------------------- {{{
let mapleader=","

" Make regex sane
noremap / /\v

" un-highlight search results
noremap <leader><space> :noh<cr>

" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>

" Normal/Visual tab for bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"Opens a vertical split and switches over (,v)
nnoremap <leader>v <C-w>v<C-w>l

"Moves around split windows
nnoremap <leader>w <C-w><C-w>

"Moves around tabs
nnoremap <leader>t <Esc>:tabnew<CR>

"Real Returns
nnoremap <leader>R :%s/\r/\r/g<CR>

"Kill endline whitespaces
nnoremap <Leader><Return> :%s/\s\+$//e<CR>

"Moving around windows
map <C-j> <C-W>j
map <A-S-Down> <C-W>j

map <C-k> <C-W>k
map <A-S-Up> <C-W>k

map <C-h> <C-W>h
map <A-S-Left> <C-W>h

map <C-l> <C-W>l
map <A-S-Right> <C-W>l

" Toggle line numbers in normal mode.
function! NumberToggle()
  if(&number == 0)
    set nu
  else
    set nonu
  endif
endfunc

nnoremap <leader>n :call NumberToggle()<cr>

" }}}

" Status line --------------------------------------------------------- {{{
augroup ft_statuslinecolor
        au!
        au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
        au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END
set statusline=%f " Path.
set statusline+=%m " Modified flag.
set statusline+=%r " Readonly flag.
set statusline+=%w " Preview window flag.
set statusline+=%#warningmsg# " Syntastic
set statusline+=%{SyntasticStatuslineFlag()} "Syntastic
set statusline+=%* " ??? (Syntastic)
set statusline+=\ " Space.
set statusline+=%= " Right align.
" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)
" }}}
