local add, later = MiniDeps.add, MiniDeps.later

later(function()
  add({
    source = 'rachartier/tiny-inline-diagnostic.nvim',
    checkout = 'master',
    monitor = 'main',
  })
  require('tiny-inline-diagnostic').setup()
  -- 標準の仮想テキストを無効化して重複を避ける
  vim.diagnostic.config({ virtual_text = false })
end)

later(function()
  add({
    source = 'Bekaboo/dropbar.nvim',
    checkout = 'master',
    monitor = 'main',
  })
end)

later(function()
  add({
    source = 'hedyhli/outline.nvim',
    checkout = 'master',
    monitor = 'main',
  })

  require('outline').setup({})

  vim.keymap.set('n', '<Leader>o', '<cmd>Outline<CR>', { silent = true, desc = 'Toggle Outline' })
end)
