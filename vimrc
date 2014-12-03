" Inspired from Tarik Graba's .vimrc and from Tyler Cipriani's.
" Tyler Cipriani's can be found at
" https://github.com/thcipriani/dotfiles/blob/master/vimrc

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

" Pathogen ------------------------------------------------------------ {{{
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
" " }}}

" Basic options ------------------------------------------------------- {{{
let mapleader=","
set nocompatible
set t_Co=256        " My terminal's got all those colors, yo

set title           " Change the terminal title
set encoding=utf-8  " Show utf-8 chars
set showcmd         " count highlighted
set ruler           " Show where I am in the command area
set colorcolumn=75  " vertical ruler at 75 characters
set showmode        " -- INSERT (appreciation)-- :)
set laststatus=2    " always show the status line
                    " ↪ (0 = never, 1 = default [multi-window only])

set modelines=0     " Don't read first/last lines of file for settings
set hidden          " Stash unwritten files in buffer
set vb              " Don't beep at me
set cursorline      " Highlight current line
set scrolloff=3     " Start scrolling when I'm 3 lines from top/bottom
set history=10000   " Remember commands and search history
set backspace=2     " Backspace over indent, eol, and insert
set mousehide       " Hide the mouse pointer while typing

set number          " Show linenumbers
set nowrap          " Turn off linewrap
set tabstop=8       " 8 spaces
set shiftwidth=8    " 8 spaces
set softtabstop=8   " 8 spaces
set expandtab       " Expand tabs to spaces

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

filetype plugin on
filetype indent on

set fileformats=unix,dos,mac

set undodir^=~/.vim/undo/ " Places .un~ files in the correct directory

" Use syntastic for C files
let g:syntastic_c_checkers=['make']

" Yell for long lines
au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>75v.\+', -1)

" Colorscheme
set background=dark

" Solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=16 " 16 if Solarized is the colorscheme of
                              " iTerm2, 256 otherwise
colorscheme solarized

" GUI Font
" https://github.com/adobe/source-code-pro
set guifont=Source\ Code\ Pro\ 14
" }}}

" Version 7.3 (703) --------------------------------------------------- {{{
if v:version >= 703
        set colorcolumn=75
        set undodir=~/.vim-undo
        set undofile
        set undolevels=10000 "max number of changes that can be undone
        set undoreload=100000 "max number lines to save for undo
        "on buffer reload

        " Toggle line numbers in normal mode, unset by default
        " set relativenumber
        function! NumberToggle()
        "        if(&relativenumber == 1)
                 if(&number == 0)
                        set nu
        "               set nornu
                else
                        set nonu
        "               set rnu
                endif
        endfunc

        nnoremap <leader>n :call NumberToggle()<cr>
endif
" }}}

" Dumb osx ------------------------------------------------------------ {{{
if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
                set clipboard=unnamed
        endif
endif
" }}}

" Convenient Mapping--------------------------------------------------- {{{
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
set statusline+=\ " Space.
set statusline+=%= " Right align.
" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)
" }}}
