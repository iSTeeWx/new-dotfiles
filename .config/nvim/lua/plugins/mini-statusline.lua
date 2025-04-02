return {
  {
    'echasnovski/mini.statusline',
    version = '*',
    init = function ()
      require("mini.statusline").setup({
        content = {
          active = function()
            local diagnostics_icons = {
              ERROR = " ",
              WARN = " ",
              INFO = " ",
              HINT = " ",
            }

            MiniStatusline.section_location = function()
              return '%2l:%-2v'
            end

            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git           = MiniStatusline.section_git({ trunc_width = 40 })
            local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics   = MiniStatusline.section_diagnostics({
              trunc_width = 75,
              icon = "",
              signs = diagnostics_icons,
            })
            local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
            local location      = MiniStatusline.section_location()

            return MiniStatusline.combine_groups({
              { hl = mode_hl,                  strings = { mode } },
              { hl = 'MiniStatuslineDevinfo',  strings = { git, diff, diagnostics } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl,                  strings = { search, location } },
            })
          end
        }
      })
    end
  }
}
