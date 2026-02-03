return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
  config = function()
    local ls = require("luasnip")
    -- Load Lua snippets for HTML
    require("luasnip.loaders.from_lua").load({
      paths = { vim.fn.stdpath("config") .. "/snip" }
    })
  end,
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
}
