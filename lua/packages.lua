local packer = require('packer')

return packer.startup(function() 
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- theme
  use 'EdenEast/nightfox.nvim'
  use 'sainnhe/edge'
  use 'sainnhe/sonokai'

  -- surround
  use 'kylechui/nvim-surround'

  -- bufferline
  use 'Akin909/nvim-bufferline.lua'

  -- nvimtree
  use 'kyazdani42/nvim-tree.lua'

  -- lua line
  use 'hoob3rt/lualine.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- notify
  use 'rcarriga/nvim-notify'

  -- which-key
  use 'folke/which-key.nvim'

  -- lsp
  use { 'neovim/nvim-lspconfig',
    opt = true,
    event = "BufReadPre",
    wants = { "nvim-lsp-installer" },
    config = function()
      require("plugins.lsp").setup()
    end,
   requires = {
      "williamboman/nvim-lsp-installer",
    },
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  -- vim-fugitive
  use {'tpope/vim-fugitive',
  opt = true,
    cmd = {
      "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gedit", "Gsplit",
      "Gread", "Gwrite", "Ggrep", "Glgrep", "Gmove",
      "Gdelete", "Gremove", "Gbrowse",
    },
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- floating terminal
  use 'voldikss/vim-floaterm'

  -- dev container
  use 'jamestthompson3/nvim-remote-containers'

  -- treesitter for sticky headers
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- dim inactive views
  use 'sunjon/shade.nvim'
end)

