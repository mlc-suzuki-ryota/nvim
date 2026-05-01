return {
  "saghen/blink.cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
    "fang2hou/blink-copilot"
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
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
          transform_items = function(_, items)
            local completion_item_kind = require("blink.cmp.types").CompletionItemKind
            for _, item in ipairs(items) do
              item.kind = completion_item_kind.Copilot
            end
            return items
          end,
        },
      },
    },
    snippets = {
      preset = "luasnip",
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
}
