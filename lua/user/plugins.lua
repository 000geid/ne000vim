local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/plenary.nvim'
  use({
      'MeanderingProgrammer/markdown.nvim',
      as = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
      after = { 'nvim-treesitter' },
      requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
      -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
      -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
      config = function()
          require('render-markdown').setup({})
      end,
  })

  use 'catppuccin/nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'ellisonleao/gruvbox.nvim'
  use 'windwp/nvim-autopairs'
  use 'nvim-tree/nvim-web-devicons'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true } 
  }
  use {'chipsenkbeil/vimwiki-server.nvim', tag = 'v0.1.0-alpha.5'}

  
  use {'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.3',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'akinsho/bufferline.nvim',
  tag = "*",
  requires = 'nvim-tree/nvim-web-devicons'}

  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    require("nvim-tree").setup {}
  end
}

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
