---@diagnostic disable: undefined-global
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "tn", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "<Leader>ss", ":split<Return>", opts)
keymap.set("n", "<Leader>sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "<Leader>sh", "<C-w>h")
keymap.set("n", "<Leader>sk", "<C-w>k")
keymap.set("n", "<Leader>sj", "<C-w>j")
keymap.set("n", "<Leader>sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- SelectAll
keymap.set("n", "all", "gg<S-v>G")



-- Buf移動
keymap.set("n", "<tab>", "<Cmd>bnext<CR>", { silent = true })

-- エラーメッセージ
keymap.set("n", "<Leader>e", vim.diagnostic.open_float, { silent = true });

-- format（LSP）。PHP は intelephense を明示（他 LSP と重なったときの誤選択防止）
vim.keymap.set('n', '<Leader>fo', function()
  local o = { async = true }
  if vim.bo.filetype == 'php' then
    o.name = 'intelephense'
  end
  vim.lsp.buf.format(o)
end)

keymap.set("n", "<Leader><Leader>", "<Cmd>Yazi<CR>", { silent = true })
