scriptencoding utf-8
" plugins.vim
"
" Neovim plugins and options

"" Vim-plug

call plug#begin()

" check this config:
" https://github.com/hardcoreplayers/ThinkVim

" Univeral Text Linking - Execute URLs, footnotes, open emails, organize ideas
Plug 'vim-scripts/utl.vim'

" Define a different filetype syntax on regions of a buffer.
Plug 'vim-scripts/SyntaxRange'


" tldr client for vim/neovim
Plug 'wlemuel/vim-tldr'

" emulate emacs narrow-region feature
Plug 'chrisbra/NrrwRgn'

" enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Load local vimrc files in the tree root dir up to current dir
" Looks dangerous
" Plug 'embear/vim-localvimrc'

" Start screen
Plug 'mhinz/vim-startify'

" TODO: check this alternative:
" Plug 'hardcoreplayers/dashboard-nvim'
" https://github.com/hardcoreplayers/spaceline.vim

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" https://github.com/tpope/vim-projectionist

" Toggle comments
" Plug 'tpope/vim-commentary'

" My favorite colorscheme.
" Plug 'altercation/vim-colors-solarized' " -------------------------------{{{
"
" colorscheme solarized
"
" set background=dark
"
" let g:solarized_visibility      = 'high'
" let g:solarized_contrast        = 'high'
" let g:solarized_termcolors      = 16 " 16 if Solarized is the colorscheme
"                                      " of iTerm2, 256 otherwise
"
" " }}}

Plug 'iCyMind/NeoSolarized' " -------------------------------------------{{{
" let g:neosolarized_contrast   = 'high'
let g:neosolarized_visibility   = 'low'
" let g:neosolarized_termBoldAsBright = 1
" let g:neosolarized_bold       = 1
" let g:neosolarized_underline  = 1
" let g:neosolarized_italic     = 1
" }}}

" Thank you for flying neovim.
Plug 'bling/vim-airline'

" Filesystem explorer.
" Plug 'scrooloose/nerdtree'

" A maintained ctags implementation
" Plug 'universal-ctags/ctags'

" Show local tags.
" Plug 'majutsushi/tagbar'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Intellisense engine for Vim8 & Neovim,
" full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use fzf instead of coc.nvim built-in fuzzy finder.
Plug 'antoinemadec/coc-fzf'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

Plug 'mbbill/undotree'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " -----------------------------------------------{{{
" Configuration inspired by
" https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko

" TODO: change mappings
" Use C-f to search in files
" nnoremap <silent> <C-f>     :Files<CR>
" Use Leader-f to search within buffer
nnoremap <silent> <Leader>f :Rg<CR>

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Suggested when installing FZF
set runtimepath+=/usr/local/opt/fzf

" }}}

" Notational velocity for vim.
Plug 'https://github.com/alok/notational-fzf-vim' " ---------------------{{{

" TODO: curate
" g:nv_search_paths needs to be set or the plugin yells
let g:nv_search_paths = ['~/notes','~/wiki','./notes.md','./aux/notes.md']

" consider mapping something to :NV
" e.g.:nnoremap <silent> <c-s> :NV<CR>
"
" }}}

" alternatives to fzf:
" Plug 'liuchengxu/vim-clap'

" Enhancing in-buffer search experience
Plug 'junegunn/vim-slash'

" see the contents of the registers
Plug 'junegunn/vim-peekaboo'

" Plug 'Shougo/echodoc.vim'

" Snippet engine
" Plug 'SirVer/ultisnips'
"
" Plug 'honza/vim-snippets'

" display the indention levels with thin vertical lines
" Plug 'Yggdroot/indentLine'

" Rust syntax highlighting.
Plug 'wting/rust.vim', { 'for': 'rust' }

" Purescript syntax highlighting.
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }

Plug 'jceb/vim-orgmode', { 'for': 'org' }

""" Haskell

Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

" Ghcid
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': 'haskell'}
" Hoogle
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

"Haskell Formatting
" requires ormolu
Plug 'sdiehl/vim-ormolu', { 'for': 'haskell' }


""" Latex

Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
" Plug 'rhysd/vim-grammarous', { 'for': ['tex', 'latex'] }
" Plug 'dbmrq/vim-ditto', { 'for': ['tex', 'latex'] }
" Plug 'reedes/vim-wordy', { 'for': ['tex', 'latex'] }

" A version-control-friendly prose text formatter for vim (and neovim).
Plug 'mrossinek/vim-verdict', { 'for': ['markdown'] }

" TODO: look into those.
" https://github.com/neovim/neovim/wiki/Related-projects
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'mhinz/neovim-remote'
" Plug 'euclio/vim-markdown-composer'
" Plug 'airblade/vim-gitgutter'
" https://github.com/chrisbra/NrrwRgn/
" https://github.com/iamcco/markdown-preview.nvim
" https://github.com/vimoutliner/vimoutliner/
" https://vimawesome.com/plugin/vim-agriculture
" https://github.com/liuchengxu/vim-clap
" https://github.com/romainl/idiomatic-vimrc
" Plug 'vimwiki/vimwiki'
" https://github.com/jalvesaq/vimcmdline
" Plug 'pechorin/any-jump.vim'
" https://github.com/bagrat/vim-buffet
" https://github.com/liuchengxu/vim-clap

call plug#end()

"" Plugin options

" activate vim-verdict by default for these filetypes
" TODO: consider using vim-plug for this
augroup VerdictAuto
"  autocmd FileType tex      call verdict#Init() FIXME this is bad
  autocmd FileType markdown call verdict#Init()
augroup END


" TODO: review
let g:ghcid_command = 'stack exec -- ghcid -c "stack ghci"'

" do not replace latex sequences
" with UTF-8 equivalents
" (e.g., \emph{abc} with 𝑎𝑏𝑐)
" why anyone would enable this
" (let alone by default)
" is beyond me
let g:tex_conceal = ''

" " all of this for TeX
" " move to somewhere i can use setlocal
" set formatlistpat+=\\\|^\\s*\\<\\u\\l
"
" set formatoptions=""
"
" set formatoptions+=t    " auto-wrap using textwidth
" set formatoptions+=j    " remove middle comment leader when joining lines
" set formatoptions+=q    " format comments with 'gq'
" set formatoptions+=cro  " insert comment leader automatically
" set formatoptions+=2    " use the indent of the second line of a paragraph
" "set formatoptions+=n   " recognize numbered lists
" set formatoptions+=l    " do not break long lines

" augroup TeX
"   " try to help with semantic feeding.
"   " https://www.reddit.com/r/vim/comments/9m6ir3/latex_insanity/e7cwz0z/
"   autocmd Filetype tex,rst,markdown,asciidoc for punct in ['.', '!', '?', '…', ':'] | exe 'inoremap <buffer> ' . punct . '<space> ' . punct . '<CR>' | endfor
" augroup END

""" BEGIN indentLine options

" make the indent line visual
" similar to the line used in Sublime Text 2?
let g:indentLine_char = '┊'

""" END indentLine options

""" BEGIN ALE options

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
" with ALE need to be installed with stack install.

let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_echo_cursor = 1
let g:ale_cursor_detail = 0

" When `numhl` is available,
" highlight problems on the 'number' column.
" TODO: this seems not to work at the moment
let g:ale_sign_highlight_linenrs = 1

" Use another plugin for LSP features
let g:ale_disable_lsp = 1

" Let vim-airline convey ALE info
let g:airline#extensions#ale#enabled = 1

" Show a message in neovim virtual text when cursor is near a warning/error.
" conflicts with highlights
" let g:ale_virtualtext_cursor = 1

" The following imported from desmap/ale-sensible
"""" begin imported code

" Set gorgeous colors for marked lines to sane, readable combinations
" working with any colorscheme
au VimEnter,BufEnter,ColorScheme *
  \ exec "hi! ALEInfoLine
    \ guifg=".(&background=='light'?'#808000':'#ffff00')."
    \ guibg=".(&background=='light'?'#ffff00':'#555500') |
  \ exec "hi! ALEWarningLine
    \ guifg=".(&background=='light'?'#808000':'#ffff00')."
    \ guibg=".(&background=='light'?'#ffff00':'#555500') |
  \ exec "hi! ALEErrorLine
    \ guifg=".(&background=='light'?'#ff0000':'#ff0000')."
    \ guibg=".(&background=='light'?'#ffcccc':'#550000')

"""" end imported code

let g:ale_lint_on_text_changed = 'insert'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 200

" TODO: check config for textlint, vale
" vale: right now it just offers writegood, proselint, alex
"       as well as documentation standards from various companies
let g:ale_linters = {
  \   'haskell': ['hlint', 'hdevtools', 'stack-build'],
  \   'tex':     ['chktex', 'textlint', 'vale'],
  \   'rust':    ['rustc'],
  \   'python':  ['pylint'],
  \}

let g:ale_tex_chktex_options = '-I -H -n 1 -n 3 -n 8 -n 18 -n 24'

" From https://github.com/btford/write-good:
" other options:
" --no-passive
"       Checks for passive voice.
" --no-illusion
"       Checks for lexical illusions – cases where a word is repeated.
" --no-so
"       Checks for so at the beginning of the sentence.
" --no-thereIs
"       Checks for there is or there are at the beginning of the sentence.
" --no-weasel
" Checks for "weasel words."
" --no-adverb
"        Checks for adverbs that can weaken meaning: really, very, extremely, etc.
" --no-tooWordy
"        Checks for wordy phrases and unnecessary words.
" --no-cliches
"        Checks for common cliches.
" --yes-eprime
"        Checks for "to-be" verbs.
"
" To consider: --no-wordy --yes-eprime
let g:ale_writegood_options = '--no-weasel --no-passive --no-adverb --no-wordy'

"""" fixers

let g:ale_fix_on_save = 1

" Haskell: do not use fixers, as this is being taken care of by ormolu.
" If in the future ormolu is available for ale use that.
" TODO: see how this articulates with nvim-coc
let g:ale_fixers = {
  \   '*':       ['remove_trailing_lines', 'trim_whitespace'],
  \   'rust':    ['rustfmt'],
  \   'python':  ['yapf'],
  \}

" Automatically open loclist
" let g:ale_open_list = 1

" TODO: move somewhere else
" Auto-close loclist when leaving buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

""" END ALE options

""" VimTeX options

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

" let g:vimtex_complete_bib = {'enabled':0}
let g:vimtex_complete_bib = {'simple':1}

let g:vimtex_indent_enabled = 1
let g:vimtex_indent_bib_enabled = 1

" The quickfix window is opened automatically when there are errors,
" but it does not become the active window.
let g:vimtex_quickfix_mode = 2

" close the quickfix window will after this number of motions
" works best when g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 3

" or alternatively:
" let g:vimtex_quickfix_open_on_warning = 0

""" END VimTeX options

" terminal sanity

tnoremap <Esc> <C-\><C-n>

" Required for operations modifying multiple buffers like rename.
set hidden

" let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
" let g:LanguageClient_serverCommands = {
"     \ 'rust':     ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'haskell':  ['ghcide', '--lsp'],
"     \ 'python':   ['/usr/local/bin/pyls']
"     \ }
"
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

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

""" BEGIN COC configuration
" taken from https://github.com/neoclide/coc.nvim
"
" " TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=aFc

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" TODO: move somewhere else
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" nb: with leader=' ' this does not work
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

""" END COC configuration

""" BEGIN fzf configuration
" references:
" https://www.reddit.com/r/neovim/comments/djmehv/im_probably_really_late_to_the_party_but_fzf_in_a/
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.85 } }

" bindings
" call fzf#vim#files('', fzf#vim#with_preview({'options': '--prompt ""'}, 'right:70%'))
nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <silent> <leader>b :Buffers<CR>
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
""" END fzf configuration
