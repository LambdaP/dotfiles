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

-- vim.cmd('packadd packer.nvim')

return require('packer').startup(
  function(use)
    -- go manage yourself
    use { 'wbthomason/packer.nvim' }

    -- ## Experimental Neovim tech

    -- “Any sufficiently advanced technology
    --  is indistinguishable from magic.”
    --    -- Sir Arthur Charles Clarke

    -- ### LSP

		use {
			{
				'neovim/nvim-lspconfig',
				-- config = [[ require("lspconfig") ]]  ,
				config = function()
						local lspc = require("lspconfig")
						lspc.ccls.setup{}
						lspc.hls.setup{}
						lspc.gopls.setup{}
						lspc.vimls.setup{}
						lspc.bashls.setup{}
						lspc.texlab.setup{
							filetypes = { "tex", "bib" },
							settings = {
								latex = {
									rootDirectory = ".",
									build = { onSave = false },
									lint = {
										onChange = false,
										onSave = false
									}
								}
							}
						}
					end
					-- disable = true
				} , {
					'nvim-lua/lsp-status.nvim',
					config = [[ require("lsp-status") ]] ,
					-- disable = true
				} , {
				'kabouzeid/nvim-lspinstall',
				config = function()
					local function setup_servers()
						require'lspinstall'.setup()
						local servers = require'lspinstall'.installed_servers()
						for _, server in pairs(servers) do
							require'lspconfig'[server].setup{}
						end
					end

					setup_servers()

					-- Automatically reload after `:LspInstall <server>`
					--   so we don't have to restart neovim
					require'lspinstall'.post_install_hook = function ()
						setup_servers()    -- reload installed servers
						vim.cmd("bufdo e") -- trigger FileType autocmd that starts the server
					end
				end
			} , {
        'nvim-lua/completion-nvim'           ,
        config = [[ require("completion") ]] ,
        disable = true
      }
			, {
			  'hrsh7th/nvim-compe',
				config = function()
					require'compe'.setup {
						enabled = true;
						autocomplete = true;
						debug = false;
						min_length = 1;
						preselect = 'enable';
						throttle_time = 80;
						source_timeout = 200;
						incomplete_delay = 400;
						max_abbr_width = 100;
						max_kind_width = 100;
						max_menu_width = 100;
						documentation = true;

						source = {
							path = true;
							buffer = false;
							calc = true;
							nvim_lsp = true;
							nvim_lua = true;
							-- vsnip = true;
						};
					}
				end
			}
    }

    -- ### tree-sitter

		use {
			{
				'nvim-treesitter/nvim-treesitter',
				config = [[ require("treesitter") ]] ,
				event  = 'VimEnter *'                ,
				-- disable = true
			} ,
			{
				'nvim-treesitter/completion-treesitter',
				opt = true ,
				-- disable = true
			} ,
			{ 'nvim-treesitter/playground',
				opt = true
			} , {
				'romgrk/nvim-treesitter-context' ,
				after = 'nvim-treesitter'        ,
				-- disable = true
			} , {
				'nvim-treesitter/nvim-treesitter-refactor',
				opt = true
			}
		}

		-- use {
		-- 	'lewis6991/spellsitter.nvim',
		-- 	config = function()
		-- 		require('spellsitter').setup()
		-- 	end
		-- }

    ---- ### fuzzy magic

    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim'   ,
        'nvim-lua/plenary.nvim' ,
      }
    }


    -- ## Work

    -- use { 'https://gitlab.com/dbeniamine/todo.txt-vim' }

    -- ## Languages

    use { 'vmchale/dhall-vim' }
		use { 'justinmk/vim-syntax-extra' }

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
		use { 'phaazon/hop.nvim' }
    use { 'unblevable/quick-scope'          }
    use { 'justinmk/vim-sneak' ,
      config = function()
        vim.g['sneak#s_next'] = 1
        -- vim.g['sneak#s_label'] = 1
				vim.api.nvim_set_keymap('', 'f', '<Plug>Sneak_f', {})
				vim.api.nvim_set_keymap('', 'F', '<Plug>Sneak_F', {})
				vim.api.nvim_set_keymap('', 't', '<Plug>Sneak_t', {})
				vim.api.nvim_set_keymap('', 'T', '<Plug>Sneak_T', {})
			end
    }

    -- ### Search

    use { 'romainl/vim-cool' }

    -- ## Edition

    use { 'tpope/vim-commentary'  }
    use { 'tpope/vim-rsi'         }
    use { 'tpope/vim-repeat'      }
    use { 'tpope/vim-speeddating' }
    use { 'tpope/vim-surround'    }

    -- ## Writing

    use {
      'lervag/vimtex' ,
      config = function() vim.g.tex_flavor = 'latex' end
    }

    use { 'axvr/org.vim' }

    -- use { 'dhruvasagar/vim-dotoo' }

    use { 'lervag/wiki.vim', 'lervag/wiki-ft.vim' }
		use { 'lervag/lists.vim' }

    -- use { 'jceb/vim-orgmode' , ft = 'org' }
    -- use { 'aaronbieber/vim-quicktask'     }
    -- use { 'vimoutliner/vimoutliner/'      }
    -- use { 'fmoralesc/vim-pad'             }

    -- ## Editor

    -- vim-qf has unfortunate interactiosn with Vimtex
    -- use { 'romainl/vim-qf' ,
    --   config = function()
    --     vim.g.qf_auto_open_quickfix = 0
    --     vim.g.qf_auto_open_loclist  = 0
    --   end
    -- }
    use { 'andymass/vim-matchup'             }
    use { 'tommcdo/vim-lion'                 }
    use { 'tpope/vim-sleuth' ,
      config = function() vim.g.sleuth_automatic = 0 end
		}
    -- use { 'justinmk/vim-dirvish'          }
    use { 'junegunn/vim-peekaboo'            }
    use { 'chrisbra/NrrwRgn'                 }
    use { 'tpope/vim-apathy'                 }
    use { 'editorconfig/editorconfig-vim'    }
    use { 'mhinz/vim-startify'               }
    use { 'tpope/vim-eunuch'                 }
    use { 'mcchrish/nnn.vim' ,
      config = function()
        vim.g['nnn#replace_netrw']  = 1
        vim.g.loaded_netrw          = 1
        vim.g.loaded_netrwPlugin    = 1
      end
    }
    use { 'vim-scripts/utl.vim' }
    use { 'https://gitlab.com/HiPhish/info.vim' }
		use { 'kosayoda/nvim-lightbulb',
			config = {
				vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
			}
		}
		use { 'folke/which-key.nvim',
			config = function()
				require("which-key").setup{}
			end
		}
		use { 'Pocco81/TrueZen.nvim' }

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
			'RRethy/nvim-base16',
      -- 'chriskempson/base16-vim'        ,
			'savq/melange' ,
      'mhartington/oceanic-next'       ,
      'glepnir/zephyr-nvim'            ,
      'romainl/Apprentice'             ,
      'hardselius/warlock'             ,
      'axvr/photon.vim'                ,
      'sainnhe/edge'                   ,
			'rockerBOO/boo-colorscheme-nvim' ,
			'jaredgorski/SpaceCamp'	         ,
			'Rigellute/rigel'                ,
			'vigoux/oak'                     ,
			'cocopon/iceberg.vim',
    }

    -- !! should load last
    use { 'ryanoasis/vim-devicons' }

    -- here be dragons
    -- 'tpope/vim-projectionist'
    -- 'tpope/vim-obsession'
  end
)
