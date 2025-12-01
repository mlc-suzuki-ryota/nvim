vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.lazy")
require("config.lsp")
require("config.keymaps")

vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("YaziGroup", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      vim.cmd("Yazi")
    end
  end,
  desc = "ディレクトリを開いた時にYaziを起動する",
})

-- ダークモードの時のみtokyonightを適用
if vim.o.background == "dark" then
  vim.cmd.colorscheme "tokyonight-night"
end
