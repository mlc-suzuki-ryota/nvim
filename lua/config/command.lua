-- HTMLファイルのインデントを全て削除するコマンド
vim.api.nvim_create_user_command(
  'RHI',
  function()
    if vim.bo.filetype == 'html' then
      vim.cmd('%s/^\\s*//g')
      print('HTMLファイルのインデントを全て削除しました。')
    else
      print('これはHTMLファイルではありません。')
    end
  end,
  {
    desc = 'Remove all indentation from HTML file (RHI)',
  }
)
