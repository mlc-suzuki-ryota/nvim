-- Cursor (VS Code) 専用の Neovim 設定ファイル (init.lua)

-- 1. VS Code 環境であることを確認
if not vim.g.vscode then
  return
end

-- 2. 基本的なオプションとキーマップを共有
require("config.options")
require("config.keymaps")
require("config.command")

-- 3. VS Code 専用のキーマップを追加 
local function vscode_action(cmd)
  return function()
    require('vscode-neovim').call(cmd)
  end
end
