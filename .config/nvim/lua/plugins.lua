vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    use {'mhinz/vim-startify'}
    use {'romgrk/nvim-treesitter-context'}
    use {'mhinz/vim-signify'}
    use {'christoomey/vim-tmux-navigator'}

    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'

    use 'Xuyuanp/scrollbar.nvim'
    use 'jiangmiao/auto-pairs'


    use 'itchyny/lightline.vim'

    use {
        'pangloss/vim-javascript',
        ft = {'js'}
      }

    use 'preservim/tagbar'

    use {'joshdick/onedark.vim'}
    use {'arcticicestudio/nord-vim'}
    use {'sainnhe/gruvbox-material'}

    use {'tikhomirov/vim-glsl'}

    use {
        'neovim/nvim-lspconfig',
        'nvim-lua/completion-nvim'
      }

    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-packer.nvim'
    use {'kyazdani42/nvim-web-devicons',
        config=function()
          require'nvim-web-devicons'.setup {
              default = true;
            }
        end
      }

    use {'kyazdani42/nvim-tree.lua'}

    use {'nvim-treesitter/nvim-treesitter'}

    use {'lervag/vimtex',
        ft = {'tex'}
      }

  end)
