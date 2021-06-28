scriptencoding utf-8

" general references
" https://github.com/romainl/idiomatic-vimrc
" https://github.com/nanotee/nvim-lua-guide

" ## Plugin management
"
" Plugin configuration in ./after/plugin/

" install packer if not present

const s:packer_path = stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if empty(glob(s:packer_path))
	const s:packer_url = "https://github.com/wbthomason/packer.nvim"
	call system(join(["git clone", s:packer_url, s:packer_path]))
	packadd packer.nvim
	lua require("p.plugins")
	PackerCompile
endif

const s:plugins = globpath(stdpath("config"), "lua/p/plugins.lua")

command! ReloadPlugins luafile `=s:plugins`

augroup packer
	autocmd!
	" autocmd BufEnter     s:packconf ++once lua require [[p.plugins]]
	autocmd BufEnter     s:plugins ++once ReloadPlugins
	autocmd BufWritePost s:plugins PackerCompile | ReloadPlugins
augroup END

" ## Options

let mapleader      = ','
let maplocalleader = "\<Space>"

" TODO [2020-11-05] organize

" filetype plugin indent on " nvim default
syntax enable

let g:vimsyn_embed = 'lPr'

let &synmaxcol = 180

" set autoindent " nvim default
let &smartindent = 1

" runtime macros/matchit.vim " nvim default
" disable with `:let loaded_matchit = 1`

let &showmatch = 1
let &matchtime = 2

let &showmode = 0

let &pyxversion = 3
let g:loaded_python_provider  = 0
let g:python3_host_prog       = '/usr/local/bin/python3' " TODO guard for existence

let &clipboard = 'unnamedplus'
let &cmdheight = 2
let &modeline  = 0
" set belloff = all " nvim default
let &lazyredraw = 1
let &scrolloff  = 3
" set backspace = indent,eol,start " nvim default

let &number         = 1
let &relativenumber = 1 " turn on after number

" ### Shell

let &shell = '/bin/bash'
let &title = 1

" ### History

let &hidden     = 1
let &undofile   = 1
let &undolevels = 10000
let &undoreload = 100000

" ### Search

" set incsearch " nvim default

let &ignorecase = 1
let &smartcase  = 1
let &inccommand = 'split'

noremap / /\v

" stolen from fzf.vim
" set grepprg=rg\ --vimgrep\ --smart-case\ --follow
let &grepprg = 'rg --vimgrep --smart-case --follow'

let &textwidth = 79

let &wrap        = 1
let &sidescroll  = 5
" set listchars+=precedes:<,extends:>
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " curtesy of -romainl-
set list
let &linebreak   = 1
let &breakindent = 1
set breakindentopt=shift:4,min:20
let &showbreak   = '… ' " TODO: do something fancy here.


" ### tabs and spaces

" let &expandtab  = 1

let &shiftwidth = 0
let &tabstop    = 2
let &smarttab = 1
" let &shiftwidth = 2
let &shiftround = 1
" set softtabstop=2

let &joinspaces = 0

" auto-completion

" set wildmenu " nvim default
" set wildmode=longest,list,full
let &wildmode    = 'longest' . ',list' . ',full'
" set completeopt=menuone,noinsert,noselect
let &completeopt = 'menuone' . ',noinsert' . ',noselect'

let &switchbuf   = 'usetab' . ',vsplit'

" :botright cwindow

" colorscheme

let &termguicolors = 1
" colorscheme base16-tomorrow-night
" colorscheme apprentice

colorscheme base16-gruvbox-dark-hard

" ## Mappings

map  Q gq<Return>
map gQ gq<Return>

" TODO re-evaluate
nnoremap   <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" ### AZERTY
" nnoremap ; .

" ## Mappings

nnoremap g?  gc
vnoremap g?  gc
nnoremap g?? gcc

nnoremap h m
vnoremap h m
nnoremap j h
vnoremap j h
nnoremap k j
vnoremap k j
nnoremap l k
vnoremap l k
nnoremap m l
vnoremap m l

" noremap h m
" noremap j h
" noremap k j
" noremap l k
" noremap m l

" https://github.com/hrsh7th/nvim-compe
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" https://gist.github.com/romainl/3b8cdc6c3748a363da07b1a625cfc666
function! BreakHere()
	s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
	call histdel("/", -1)
endfunction

nnoremap <Leader>K :<C-u>call BreakHere()<Return>

" tmp to play with dotoo
" autocmd BufNewFile,BufRead *.org setfiletype dotoo

helptags $VIMRUNTIME/doc
