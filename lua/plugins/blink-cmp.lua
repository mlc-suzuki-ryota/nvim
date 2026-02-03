return {
  "saghen/blink.cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
  },
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-k>"] = { "snippet_forward", "fallback" },
      ["<C-j>"] = { "snippet_backward", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = { 
      documentation = { auto_show = true },
      accept = {
        auto_brackets = { enabled = true }
      }
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    snippets = {
      preset = "luasnip",
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
}

