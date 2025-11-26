---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
  },
  -- Bufferが読み込まれるときをトリガーに遅延ロードする
  event = { "BufReadPre", "BufNewFile" },
}
