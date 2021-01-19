--[[ lua/packer_config.lua
--
--
-- packer.nvim configuration
--
-- tells packer.nvim what plugins to use, in its own tongue
]]--


--[[ ## Example configs
--
-- https://github.com/wbthomason/dotfiles/blob/linux/neovim/.config/nvim/lua/plugins.lua
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/plugins.lua
--
]]--

vim.cmd('packadd packer.nvim')

return require('packer').startup(
function()
  -- go manage yourself
  use { 'wbthomason/packer.nvim', opt = true }

  -- ## Experimental Neovim tech

  -- “Any sufficiently advanced technology
  --  is indistinguishable from magic.”
  --    -- Sir Arthur Charles Clarke

  -- ### LSP

  use {
    {
      'neovim/nvim-lspconfig'              ,
      config = [[ require("lspconfig") ]]  ,
    } , {
      'nvim-lua/lsp-status.nvim'           ,
      config = [[ require("lsp-status") ]] ,
    } , {
      'nvim-lua/completion-nvim'           ,
      config = [[ require("completion") ]] ,
    } 
  }

  -- ### tree-sitter

  use {
    {
      'nvim-treesitter/nvim-treesitter'    ,
      config = [[ require("treesitter") ]] ,
      event  = 'VimEnter *'                ,
    } , { 'nvim-treesitter/completion-treesitter' , opt = true }
  }

  use {
    'romgrk/nvim-treesitter-context' ,
    after = 'nvim-treesitter'        ,
  }

  ---- ### fuzzy magic

  use {
    'nvim-telescope/telescope.nvim' ,
    requires = {
      'nvim-lua/popup.nvim'   ,
      'nvim-lua/plenary.nvim' ,
    }
  }


  -- ## Work

  -- use { 'https://gitlab.com/dbeniamine/todo.txt-vim' }

  -- ## Programming

  -- ### Lua

  use {
    'euclidianAce/BetterLua.vim' ,
    -- 'tjdevries/manillua.nvim'    ,
  }

  -- ## Navigation
  --
  -- [2020-11-05] TODO sort

  use { 'pechorin/any-jump.vim' }

  -- ### Motions

  -- [2020-11-19] TODO: this is beginning to look crowded

  use { 'wellle/targets.vim'              }
  use { 'michaeljsmith/vim-indent-object' }
  use { 'chaoren/vim-wordmotion'          }
  -- use { 'easymotion/vim-easymotion'       }
  use { 'unblevable/quick-scope'          }
  -- use {
  --   'rhysd/clever-f.vim' ,
  --   config = function() vim.g.clever_f_fix_key_direction = 1 end
  -- }
  use { 'justinmk/vim-sneak' }

  -- ### Search

  use { 'romainl/vim-cool' }

  -- ## Edition

  use { 'tpope/vim-commentary'  }
  use { 'tpope/vim-repeat'      }
  use { 'tpope/vim-speeddating' }
  use { 'tpope/vim-surround'    }

  -- ## Writing

  use {
    'lervag/vimtex' ,
    -- , config = 'require("vimtex")'
    config = function() vim.g.tex_flavor = 'latex' end
  }

  use { 'axvr/org.vim' }

  use { 'dhruvasagar/vim-dotoo' }

  use { 'lervag/wiki.vim', 'lervag/wiki-ft.vim' }

  -- use { 'jceb/vim-orgmode' , ft = 'org' }

  -- ## Editor

  use { 'romainl/vim-qf'                }
  use { 'justinmk/vim-dirvish'          }
  use { 'junegunn/vim-peekaboo'         }
  use { 'chrisbra/NrrwRgn'              }
  use { 'tpope/vim-apathy'              }
  use { 'editorconfig/editorconfig-vim' }
  use { 'mhinz/vim-startify'            }
  use { 'tpope/vim-eunuch'              }
  use { 'mcchrish/nnn.vim' ,
    config = function()
        vim.g['nnn#replace_netrw']  = 1
        vim.g.loaded_netrw          = 1
	      vim.g.loaded_netrwPlugin    = 1
      end
  }

  use {
    'tpope/vim-fugitive' ,
    'tpope/vim-git'      ,
    'tpope/vim-rhubarb'  ,
  }

  -- use { 'sirver/UltiSnips' }

  -- ### Focusing
  -- Goyo is broken (something about leaving focused mode)
  -- use { 'junegunn/goyo.vim'      }
  -- use { 'junegunn/limelight.vim' }

  -- ### Look

  use {
    --! no specific tree-sitter support
    'chriskempson/base16-vim'  ,
    'mhartington/oceanic-next' ,
    'glepnir/zephyr-nvim'      ,
    'romainl/Apprentice'       ,
    'hardselius/warlock'       ,
    'axvr/photon.vim'          ,
  }

  -- !! should load last
  use { 'ryanoasis/vim-devicons' }

  -- here be dragons
  -- 'vim-scripts/utl.vim'
  -- 'tpope/vim-projectionist'
  -- 'tpope/vim-obsession'
end
)

