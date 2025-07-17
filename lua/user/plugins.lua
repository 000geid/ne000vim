-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Core plugins
  { "nvim-lua/plenary.nvim" },
  { "catppuccin/nvim" },
  { "nvim-treesitter/nvim-treesitter" },
  { "ellisonleao/gruvbox.nvim" },
  { "windwp/nvim-autopairs" },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "chipsenkbeil/vimwiki-server.nvim", version = "v0.1.0-alpha.5" },
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    dependencies = { "echasnovski/mini.nvim", optional = true },
    config = function()
      require('render-markdown').setup({})
    end,
    -- after = { "nvim-treesitter" }, -- Not needed in lazy.nvim, handled by dependency order
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.3",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
})
