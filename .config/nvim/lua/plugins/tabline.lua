vim.pack.add({
  { src = "https://github.com/echasnovski/mini.tabline" }

})

require("mini.tabline").setup({
  format = function(buf_id, label)
    if vim.bo[buf_id].modified then
      return  " [+]" .. MiniTabline.default_format(buf_id, label):sub(2)
    else
      return MiniTabline.default_format(buf_id, label)
    end
  end
})
