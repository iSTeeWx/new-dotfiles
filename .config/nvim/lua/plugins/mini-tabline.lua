return {
  'echasnovski/mini.tabline',
  version = '*',
  init = function()
    require('mini.tabline').setup({
      show_icons = false,
      format = function(buf_id, label)
        local prefix = vim.bo[buf_id].modified and ' ' or ''
        return prefix .. MiniTabline.default_format(buf_id, label)
      end
    })
  end
}
