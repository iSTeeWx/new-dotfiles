vim.pack.add({
  { src = "https://github.com/echasnovski/mini.snippets" },
})

local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
  snippets = {
    gen_loader.from_file("~/.config/nvim/snippets/all.json"),
    gen_loader.from_lang(),
  },
  mappings = {
    expand = "<C-e>",
    jump_next = "<Tab>",
    jump_prev = "<S-Tab>",
  }
})
