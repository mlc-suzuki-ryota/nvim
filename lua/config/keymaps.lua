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
keymap.set("n", "<Leader>ss", ":split<Return>", { noremap = true, silent = true, desc = "Split window horizontally" })
keymap.set("n", "<Leader>sv", ":vsplit<Return>", { noremap = true, silent = true, desc = "Split window vertically" })

-- Move window
keymap.set("n", "<Leader>sh", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<Leader>sk", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<Leader>sj", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<Leader>sl", "<C-w>l", { desc = "Move to right window" })

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
keymap.set("n", "<Leader>e", vim.diagnostic.open_float, { silent = true, desc = "Show line diagnostics" });
