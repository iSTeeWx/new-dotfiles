return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets', },
  version = '1.*',
  opts = {
    keymap = { preset = 'enter' },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      ghost_text = {
        enabled = true,
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
