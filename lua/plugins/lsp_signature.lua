return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    floating_window = false,
    virtual_text = true,
    hint_prefix = " ",
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}
