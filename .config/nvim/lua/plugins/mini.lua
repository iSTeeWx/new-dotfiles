return {
  -- { -- Collection of various small independent plugins/modules
  --  "echasnovski/mini.nvim",
  --  config = function()
  --    -- Better Around/Inside textobjects
  --    --
  --    -- Examples:
  --    --  - va)  - [V]isually select [A]round [)]paren
  --    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
  --    --  - ci'  - [C]hange [I]nside [']quote
  --    require("mini.ai").setup({ n_lines = 500 })
  --
  --    -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --    --
  --    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  --    -- - sd'   - [S]urround [D]elete [']quotes
  --    -- - sr)'  - [S]urround [R]eplace [)] [']
  --    require("mini.surround").setup()
  --  end,
  -- },
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.icons").setup()
      require("mini.pairs").setup()
      require("mini.align").setup()

      require("mini.files").setup()
      vim.keymap.set("n", "<leader>e", function()
        if not MiniFiles.close() then
          MiniFiles.open()
        end
      end)

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set("n", "<Esc>", function()
            MiniFiles.synchronize()
            MiniFiles.close()
          end, { buffer = buf_id })
        end,
      })

      require("mini.diff").setup({
        view = {
          style = "sign",
        },
        mappings = {
          -- Disable all mappings
          apply = "",
          reset = "",
          textobject = "",
          goto_first = "",
          goto_prev = "",
          goto_next = "",
          goto_last = "",
        },
      })

      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })

      local tabline = require("mini.tabline")
      tabline.setup({
        show_icons = false,
      })
      vim.cmd("highlight MiniTablineFill guibg=#181825")
      vim.cmd("highlight MiniTablineCurrent guisp=#181825")

      local statusline = require("mini.statusline")
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function() return "%l:%v" end
      statusline.setup({
        content = {
          active = function()
            local diagnostics_signs = { ERROR = " ", WARN = " ", INFO = " ", HINT = "* " }
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 100 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local diff = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75, signs = diagnostics_signs })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- End left alignment
              { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
              { hl = mode_hl, strings = { location } },
            })
          end,
        },
      })
    end,
  },
}
