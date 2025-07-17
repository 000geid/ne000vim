vim.opt.termguicolors = true
local ok, bufferline = pcall(require, "bufferline")
if ok then
  bufferline.setup {}
end
