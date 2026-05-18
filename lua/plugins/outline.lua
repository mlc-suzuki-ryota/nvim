local add, later = MiniDeps.add, MiniDeps.later

later(function()
  add({
    source = 'hedyhli/outline.nvim',
    checkout = 'master',
    monitor = 'main',
  })

  require('outline').setup({})

  vim.keymap.set('n', '<Leader>o', '<cmd>Outline<CR>', { silent = true, desc = 'Toggle Outline' })
end)
