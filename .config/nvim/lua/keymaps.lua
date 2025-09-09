vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

vim.keymap.set("n", "H", "<cmd>bp<cr>")
vim.keymap.set("n", "L", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>")

vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>")

-- term
vim.keymap.set("n", "<f11>", "<cmd>Term<cr>", { noremap = true, silent = true })
vim.keymap.set("t", "<f11>", "<cmd>Term<cr>", { noremap = true, silent = true })

-- lsp
vim.keymap.set("n", "grf", vim.lsp.buf.format, { desc = "vim.lsp.buf.format()" })
vim.keymap.set("i", "<C-space>", "", { noremap = true, silent = true, desc = "Tigger Omnicompletion" })
