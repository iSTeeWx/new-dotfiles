vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.number = true
vim.o.scrolloff = 10

vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
function _G.custom_fold_text() return '> ' .. vim.fn.getline(vim.v.foldstart) .. '...' end
vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.fillchars:append({fold = " "})

vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.api.nvim_create_autocmd("TextYankPost", { callback = function() vim.highlight.on_yank() end })
vim.diagnostic.config({ virtual_text = true, signs = false, })

vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')
vim.keymap.set('n', 'H', '<cmd>bp<cr>')
vim.keymap.set('n', 'L', '<cmd>bn<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      import = "plugins",
    },
  },
  checker = { enabled = true },
})
