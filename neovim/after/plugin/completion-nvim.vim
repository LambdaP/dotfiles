 augroup completion-nvim
   autocmd!
   " Use completion-nvim in every buffer
   autocmd BufEnter * lua require('completion').on_attach()
 augroup END
 
 let g:completion_auto_change_source = 1
 let g:completion_timer_cycle        = 200 "default value is 80
 
 " let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
 let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
 let g:completion_matching_ignore_case   = 1
 
 lua require('completion').addCompletionSource( 'vimtex', require('vimtex').complete_item )
 
 let g:completion_chain_complete_list = {
       \ 'default' : {    
       \   'comment' : [],
       \   'default' : [
       \     {'complete_items': ['lsp', 'snippet'] },
       \     {'mode': '<c-p>'},
       \     {'mode': '<c-n>'}
       \   ]
       \ },
       \ 'tex'     : [ {'complete_items': ['vimtex', 'lsp']} ],
       \ }
