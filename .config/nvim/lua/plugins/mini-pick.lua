return {
  {
    'echasnovski/mini.pick',
    version = '*',
    config = function ()
      local pick = require("mini.pick")

      pick.registry.files = function(local_opts)
        local opts = { source = { cwd = local_opts.cwd } }
        local_opts.cwd = nil
        return MiniPick.builtin.files(local_opts, opts)
      end

      pick.setup({
        window = {
          config = function()
            local height = math.floor(0.5 * vim.o.lines)
            local width = math.floor(0.5 * vim.o.columns)
            return {
              anchor = 'NW', height = height, width = width,
              row = math.floor(0.5 * (vim.o.lines - height)),
              col = math.floor(0.5 * (vim.o.columns - width)),
            }
          end
        },
      })
    end,
    keys = {
      { "<leader><leader>", "<cmd>Pick files tool='git' cwd='~'<cr>", desc = "Opens files in home" },
    },
  }
}
