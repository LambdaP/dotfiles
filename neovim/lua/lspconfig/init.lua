local lspconfig = require('lspconfig')

local custom_on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- https://github.com/nvim-lua/diagnostic-nvim
  -- require('diagnostic').on_attach()
  -- https://github.com/nvim-lua/completion-nvim
  require('completion').on_attach()

  -- Mappings.
     -- local opts = { noremap=true, silent=true }
     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
     -- -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
end

  -- -- local servers = {'cssls', 'bashls', 'diagnosticls', 'dockerls', 'flow', 'ghcide', 'gopls', 'hie', 'html', 'intelephense', 'tsserver', 'jsonls', 'kotlin_language_server', 'pyls', 'rls', 'rust_analyzer', 'sourcekit', 'vimls', 'vuels'}
  -- local servers = { 'texlab' }

  -- for _, lsp in ipairs(servers) do
  --   lspconfig[lsp].setup {
  --     on_attach = custom_on_attach,
  --   }
  -- end

-- ## TexLab
lspconfig.texlab.setup{
  on_attach = custom_on_attach ,
  filetypes = { "tex", "bib" } ,
  settings = {
    latex = {
      rootDirectory = ".",
      build = { onSave = false },
      forwardSearch = {
        -- https://texlab.netlify.app/docs/installation/previewing
        executable  = "/Applications/Skim.app/Contents/SharedSupport/displayline",
        args        =       { "%l", "%p", "%f" }
      },
      lint = {
        onChange = false,
        onSave   = false
      }
    }
  }
}
