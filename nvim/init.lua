vim.g.maplocalleader = " " -- Call BEFORE plugins so mappins are correct


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)


-- setup() can be passed a table of specs, e.g.:
--   local plugins = {
--     { "tanvirtin/monokai.nvim",
--         lazy=false, priority=9001
--         config = function() --[[ stuff --]] end
--     },
--     "another/plugin" -- etc.
--   }
-- 
-- OR, pass a string, "plugins", and it'll automatically include ./lua/plugins/*.lua.
-- In those *.lua files, do e.g.:
--   return {
--     { "tranvirtin/monokai.nvim"
--         lazy=false, -- etc. same as before 
--     }
--     "another/plugin"
--   }
require("lazy").setup(
  "plugins",
  {} -- Other general options you can set, see here: https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration
)


vim.o.termguicolors = true
vim.o.syntax = "on"
vim.o.errorbells = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.completeopt='menuone,noinsert'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.wo.foldnestmax = 1
vim.wo.foldmethod = "syntax"

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

