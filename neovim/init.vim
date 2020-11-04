scriptencoding utf-8

let mapleader       = "\<Space>"
let maplocalleader  = ','

" use '<', '>' instead of '[', ']', hard to access on a French keyboard.
" suggested by Tim Pope in https://github.com/tpope/vim-unimpaired
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

nnoremap <up> <c-u>
nnoremap <down> <c-d>

" random sources:
" https://www.chrisatmachine.com/Neovim/02-vim-general-settings/
"

" Import and tweak plugins
let $PLUGINS_VIM=expand('~/.config/nvim/plugins.vim')
if filereadable($PLUGINS_VIM)
    source $PLUGINS_VIM
endif


" Basic options ------------------------------------------------------- {{{

set shell=/bin/sh   " Shell binary to use
set title           " Change the terminal title
set nocursorline    " Highlight current line
set textwidth=79    " Wrap at 79 columns
set colorcolumn=+1  " vertical ruler after textwidth
set lazyredraw

" set suffixesadd={str}

set nomodeline      " Don't read first/last lines of file for settings
set hidden          " Stash unwritten files in buffer
set visualbell      " Don't beep at me
set scrolloff=3     " Start scrolling when I'm 3 lines from top/bottom

set number          " Show linenumber on current line
set relativenumber  " Show relative numbers
set nowrap          " Turn off linewrap

set expandtab       " Expand tabs to spaces
set tabstop=2       " 2 spaces
set shiftwidth=2    " 2 spaces
set softtabstop=2   " 2 spaces

set nojoinspaces    " Insert one space after punctuation when joining lines

set ignorecase      " when searching
set smartcase       " …unless I use an uppercase character

set showmatch       " show matching brackets
set matchtime=2

" in trial
inoremap jk <ESC>       " jk as escape
tnoremap jk <C-\><C-n>  " jk as escape: terminal

" nnoremap K i<C-m><Esc>  " unjoin lines

" https://gist.github.com/romainl/3b8cdc6c3748a363da07b1a625cfc666
function! BreakHere()
	s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
	call histdel("/", -1)
endfunction

nnoremap K :<C-u>call BreakHere()<CR>

" in trial
vnoremap < <gv
vnoremap > >gv

" TODO: what are these
syntax sync minlines=256 " Makes big files slow
set synmaxcol=2048  " Also long lines are slow

set autoindent
set smartindent     " Auto-indent new lines
                    " TODO: should see if plugins are not taking care of this

" set fileformats=unix,dos,mac " TODO: remove, default options should be OK

set undofile          " Save undos after closing files
set undolevels=10000  " max number of changes that can be undone
set undoreload=100000 " max number lines to save for undo
                      " on buffer reload

" Sane auto-completion
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
" set wildmode=longest:full,full
set completeopt=menuone,noinsert,noselect

" Yell for long lines
" TODO: revisit
" au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Preview :s
set inccommand=split

" Colorscheme

set termguicolors
set background=dark
" base16 requires the plugin
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-tomorrow-night
" colorscheme solarized
" colorscheme NeoSolarized

" NeoSolarized: fix ugly coloring of matches in LaTeX
" highlight MatchParen ctermbg=bg guibg=bg

" }}}
"
set noshowmode
set showtabline=2                       " Always show tabs

" Make nvim clipboard compatible with OSX
set clipboard=unnamedplus

set pyxversion=3

" Convenient Mapping--------------------------------------------------- {{{

" let mapleader=','
" let mapleader = "\<Space>"

" easy access . on AZERTY
nnoremap ; .

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" disable Ex mode, format text instead
map  Q gq
map gQ gq

" Make regex sane
noremap / /\v

" treat dash separated words as a word text object"
set iskeyword+=-

" More space for displaying messages
set cmdheight=2

" " Normal/Visual tab for bracket pairs
" nnoremap <tab> %
" vnoremap <tab> %

"Opens a vertical split and switches over (,v)
nnoremap <leader>v <C-w>v<C-w>l

"Moves around split windows
nnoremap <leader>w <C-w><C-w>

"Moves around tabs
" TODO: review
nnoremap <leader>t <Esc>:tabnew<CR>

"Real Returns
nnoremap <leader>R :%s/\r/\r/g<CR>

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

"Kill endline whitespaces
" TODO: find better trick
" nnoremap <Leader><Return> :%s/\s\+$//e<CR>

"Moving around windows
map <C-j> <C-W>j
map <A-S-Down> <C-W>j

map <C-k> <C-W>k
map <A-S-Up> <C-W>k

map <C-h> <C-W>h
map <A-S-Left> <C-W>h

map <C-l> <C-W>l
map <A-S-Right> <C-W>l

" add thesauri

set thesaurus+=$HOME/.config/thesaurus/mthesaur.txt

cmap w!! w !sudo tee %


" function! MerriamWebsterThesaurus(word)
"   " vsplit term://w3m \"join(['https://www.merriam-webster.com/thesaurus/', a:word, '\#h1-anchor'])\"
"   let l:word_url = join([ "\"https://www.merriam-webster.com/thesaurus" , a:word , "\#h1-anchor\""], "/")
"   " echom l:word_url
"   vsplit term://w3m l:word_url
" endfunction

" The following from: https://github.com/dense-analysis/ale
"" Put these lines at the very end of your vimrc file.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
