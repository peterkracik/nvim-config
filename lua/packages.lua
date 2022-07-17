local packer = require('packer')

return packer.startup(function() 
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- theme
  use 'EdenEast/nightfox.nvim'
  use 'sainnhe/edge'

  -- comments
  -- use 'terrortylor/nvim-coment'

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

  -- lsp
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  -- vim-fugitive
  use 'tpope/vim-fugitive'
end)

