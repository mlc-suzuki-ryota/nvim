return {
  'nvim-mini/mini.nvim',
  config = function()
    require("mini.starter").setup()
    require("mini.cursorword").setup()
    require("mini.comment").setup()
    --    require("mini.indentscope").setup({
    --      symbol = '│'
    --    })
  end
}
