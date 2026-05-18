local add, later = MiniDeps.add, MiniDeps.later

later(function()
  add({
    source = 'windwp/nvim-ts-autotag',
    checkout = 'main',
    monitor = 'main',
  })
  require('nvim-ts-autotag').setup()
end)

later(function()
  add({
    source = 'kdheepak/lazygit.nvim',
    depends = { 'nvim-lua/plenary.nvim' },
  })
  vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
end)
