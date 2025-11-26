return {
  'nvim-mini/mini.nvim',
  config = function()
    require("mini.cursorword").setup()
    require("mini.indentscope").setup({
      symbol = '│'
    })
  end
}
