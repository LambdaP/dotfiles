" org.vim.vim

augroup org_vim
  autocmd!
  autocmd FileType org setlocal conceallevel=2 concealcursor=nc
augroup END

" default: let g:org_state_keywords = ['TODO', 'NEXT', 'DONE']
let g:org_state_keywords = [
  \ 'TODO' ,
  \ 'NEXT' ,
  \ 'PROJ' ,
  \ 'STRT' ,
  \ 'WAIT' ,
  \ 'HOLD' ,
  \ 'DONE' ,
  \ 'KILL' ]

let g:org_clean_folds = 1
